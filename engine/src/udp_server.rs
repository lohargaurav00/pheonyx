use anyhow::Result;
use std::sync::Arc;
use tokio::net::UdpSocket;
use tokio::sync::Notify;

#[allow(dead_code)]
#[derive(Debug, Clone)]
pub struct UdpServer;

#[allow(dead_code)]
impl UdpServer {
    pub async fn run_server(shutdown: Arc<Notify>) -> Result<()> {
        let sock = UdpSocket::bind("0.0.0.0:8080").await?;
        let mut buf = [0; 1024];

        loop {
            tokio::select! {
                _ = shutdown.notified() => {
                    println!("Shutting down server.");
                    break;
                }
                res = sock.recv_from(&mut buf) => {
                    let (len, addr) = res?;
                    let data = String::from_utf8_lossy( &buf[..len]);

                    println!("{:?} bytes received from {:?}, {:?}", len, addr, data);

                    let len = sock.send_to(&buf[..len], addr).await?;
                    println!("{:?} bytes sent", len);
                }
            }
        }

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use tokio::time::{Duration, sleep};

    #[tokio::test]
    async fn test_udp_server_echo() -> Result<()> {
        let shutdown = Arc::new(Notify::new());
        let shutdown_clone = shutdown.clone();

        // Start the server in a background task
        tokio::spawn(async move {
            let _ = UdpServer::run_server(shutdown_clone).await;
        });

        // Wait a moment for the server to start
        sleep(Duration::from_millis(100)).await;

        // Create a UDP client socket
        let client = UdpSocket::bind("127.0.0.1:0").await?;
        client.connect("127.0.0.1:8080").await?;

        // Send message
        let msg = b"hello!";
        client.send(msg).await?;

        // Receive response
        let mut buf = [0; 1024];
        let len = client.recv(&mut buf).await?;
        let received = &buf[..len];

        assert_eq!(msg, received);

        // Shutdown the server
        shutdown.notify_one();
        sleep(Duration::from_millis(100)).await;

        Ok(())
    }
}
