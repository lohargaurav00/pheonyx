use anyhow::{Context, Result};
use std::net::SocketAddr;
use std::sync::Arc;
use tokio::sync::Mutex;
use tokio::{net::UdpSocket, sync::mpsc};
use tracing::{debug, error, info, instrument};

use crate::mdns_server::initialize_tracing;

#[derive(Debug)]
pub struct UdpServer {
    pub socket: Arc<UdpSocket>,
    pub connections: Arc<Mutex<Vec<SocketAddr>>>,
    pub tx: mpsc::Sender<(Vec<u8>, SocketAddr)>,
    pub rx: mpsc::Receiver<(Vec<u8>, SocketAddr)>,
}

#[allow(dead_code)]
impl UdpServer {
    #[instrument]
    pub async fn new(port: u16) -> Result<Self> {
        initialize_tracing()?;
        info!(port, "Starting UDP server");

        let addr = format!("0.0.0.0:{}", port)
            .parse::<SocketAddr>()
            .context("Invalid bind address format")?;

        let sock = UdpSocket::bind(addr)
            .await
            .context("Failed to bind UdpSocket")?;

        info!(local_addr = %sock.local_addr().unwrap(), "Socket bound successfully");

        let (tx, rx) = mpsc::channel::<(Vec<u8>, SocketAddr)>(1_000);

        Ok(UdpServer {
            socket: Arc::new(sock),
            connections: Arc::new(Mutex::new(Vec::new())),
            tx,
            rx,
        })
    }

    #[instrument]
    pub fn run(&self) -> Result<()> {
        let socket = self.socket.clone();
        let connections = self.connections.clone();
        let tx = self.tx.clone();

        tokio::spawn(async move {
            let mut buf = [0u8; 1024];
            info!("UDP server daemon started");

            loop {
                match socket.recv_from(&mut buf).await {
                    Ok((size, addr)) => {
                        info!(size, addr = %addr, "Received UDP message");

                        let mut connections = connections.lock().await;
                        if !connections.contains(&addr) {
                            connections.push(addr);
                            info!(addr = %addr, "New connection added");
                        }

                        if let Err(e) = tx.send((buf[..size].to_vec(), addr)).await {
                            error!(error = %e, "Failed to send message to the channel");
                        }
                    }
                    Err(e) => {
                        error!(error = %e, "Failed to receive UDP message");
                        continue;
                    }
                }
            }
        });
        Ok(())
    }

    #[instrument]
    pub async fn send_message(&self, msg: &str) -> Result<()> {
        let bytes = msg.as_bytes();
        debug!(msg = %msg, "Message received to send");

        let connections = self.connections.lock().await;
        for addr in connections.iter() {
            // if let Err(e) = self.tx.send((bytes.to_vec(), addr.to_owned())).await {
            //     error!(error = %e, "Failed to send message to the channel");
            // }

            if let Err(e) = self.socket.send_to(bytes, addr).await {
                error!(error = %e, "Error while sending message");
            }
        }

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use tokio::time::{Duration, sleep};

    const SERVER_PORT: u16 = 5555;

    #[tokio::test]
    async fn test_udp_server_new() {
        let server = UdpServer::new(SERVER_PORT).await;
        assert!(server.is_ok(), "Server failed to initialize");

        let server = server.unwrap();
        assert_eq!(
            server.connections.lock().await.len(),
            0,
            "Connections should be empty initially"
        );
    }

    #[tokio::test]
    async fn test_udp_server_send_and_receive() -> Result<()> {
        let port = SERVER_PORT + 1;
        let mut server = UdpServer::new(port).await?;
        let server_addr = server.socket.local_addr()?;

        server.run()?;

        // Create a separate UDP socket to simulate a client
        let client_socket = UdpSocket::bind("0.0.0.0:0").await?;
        client_socket.connect(server_addr).await?;

        let message = b"Hello UDP Server!";
        client_socket.send_to(message, server_addr).await?;

        // Wait a little to make sure server processes the message
        sleep(Duration::from_millis(100)).await;

        // Now receive from server's rx channel
        if let Some((received_data, sender_addr)) = server.rx.recv().await {
            assert_eq!(received_data, message, "Received message mismatch");
            assert_eq!(
                sender_addr,
                client_socket.local_addr()?,
                "Sender address mismatch"
            );
        } else {
            panic!("Did not receive any message from the server");
        }

        Ok(())
    }

    #[tokio::test]
    async fn test_udp_server_send_message() -> Result<()> {
        let port = SERVER_PORT + 2;
        let server = UdpServer::new(port).await?;
        server.run()?;

        // Simulate a connected client manually
        let client_socket = UdpSocket::bind("0.0.0.0:0").await?;

        client_socket.connect(format!("0.0.0.0:{}", port)).await?;

        let message = "Ping from server!";
        server.send_message(message).await?;

        let mut buf = [0u8; 1024];
        let (size, _) = client_socket.recv_from(&mut buf).await?;

        assert_eq!(
            &buf[..size],
            message.as_bytes(),
            "Client did not receive correct message from server"
        );

        Ok(())
    }
}
