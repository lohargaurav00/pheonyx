use anyhow::{anyhow, Result};
use flutter_rust_bridge::frb;
use pheonyx_engine::{
    mdns_server, udp_client::UdpClient as _UdpClient, udp_server::UdpServer as PudpServer,
};
use serde::Serialize;
use std::net::SocketAddr;
use tokio::sync::Mutex;
use tracing::{debug, error, info};

use crate::frb_generated::StreamSink;

/// Starts an mDNS server for device discovery on the local network.
///
/// # Arguments
///
/// * `dur` - Optional duration (in seconds) to run the server before shutting down.  
/// If `None`, the server runs for 5 seconds.
///
/// # Returns
///
/// * `Result<()>` - Returns `Ok(())` if the server starts successfully, otherwise an error.
#[frb]
pub async fn start_mdns_server(dur: Option<u64>) -> Result<()> {
    mdns_server::register_mdns_server(dur).await
}

/// Creates a new instance of the `MdnsServer`.
///
/// This can be used to register and discover devices on the local network
/// via mDNS (Multicast DNS).
///
/// # Returns
///
/// * `MdnsServer` - A new, unstarted mDNS server instance.
#[frb]
pub fn create_mdns_server_daimon() -> mdns_server::MdnsServer {
    mdns_server::MdnsServer::new()
}

/// Starts the given mDNS server instance.
///
/// This begins advertising the service on the local network for discovery.
/// Should be called after creating the server.
///
/// # Arguments
///
/// * `server` - A mutable reference to an `MdnsServer`.
///
/// # Returns
///
/// * `Result<()>` - Returns `Ok(())` if the server starts successfully, otherwise an error.
#[frb]
pub fn start_mdns_daimon(server: &mut mdns_server::MdnsServer) -> Result<()> {
    server.start()
}

/// Stops the given mDNS server instance.
///
/// This halts any ongoing mDNS advertisement and removes the service
/// from the local network.
///
/// # Arguments
///
/// * `server` - A mutable reference to an `MdnsServer`.
#[frb]
pub fn stop_mdns_daimon(server: &mut mdns_server::MdnsServer) {
    server.stop()
}

/// Checks whether the given mDNS server instance is currently running.
///
/// # Arguments
///
/// * `server` - A reference to an `MdnsServer`.
///
/// # Returns
///
/// * `bool` - `true` if the server is running, `false` otherwise.
#[frb]
pub fn mdns_daimon_running(server: &mdns_server::MdnsServer) -> bool {
    *server.running.lock().unwrap()
}

/// Represents a received UDP message packet.
///
/// This struct will be serialized and sent to Flutter through a stream.
#[derive(Serialize, Debug, Clone)]
pub struct UdpPacket {
    /// Raw data received from the sender.
    pub data: String,
    /// The address of the sender.
    pub addr: SocketAddr,
}

#[frb]
pub struct UdpServer(Mutex<PudpServer>);

impl UdpServer {
    pub async fn new(port: u16) -> Result<Self> {
        let server = PudpServer::new(port).await?;
        Ok(Self(Mutex::new(server)))
    }

    pub async fn send_message(&self, msg: &str) -> Result<()> {
        let server = self.0.lock().await;
        server.send_message(msg).await
    }

    pub async fn run(&self) -> Result<()> {
        let server = self.0.lock().await;
        server.run()
    }

    pub async fn receive_stream(&self, sink: StreamSink<UdpPacket>) -> Result<()> {
        let udp_server = self.0.lock().await;
        let a_rx = udp_server.rx.clone();

        flutter_rust_bridge::spawn(async move {
            let mut rx = a_rx.lock().await;
            while let Some((data, addr)) = rx.recv().await {
                debug!("Received Packet from socket {:?} ,{}", data, addr);
                let msg = String::from_utf8_lossy(&data).to_string();
                let packet = UdpPacket { data: msg, addr };

                match sink.add(packet) {
                    Ok(_) => info!("Packet added to sink"),
                    Err(err) => {
                        error!("Error while sink add packet: {}", err);
                        break;
                    }
                }
            }
        });

        Ok(())
    }
}

#[frb]
pub struct UdpClient(Mutex<_UdpClient>);

impl UdpClient {
    pub fn new() -> Self {
        UdpClient(Mutex::new(_UdpClient::new()))
    }

    pub async fn connect(&mut self, port: u16, ip: &str) -> Result<()> {
        self.0.lock().await.connect(port, ip).await
    }

    pub async fn send_message(&self, message: &str) -> Result<()> {
        self.0.lock().await.send_message(message).await
    }

    pub async fn receive_stream(&self, sink: StreamSink<UdpPacket>) -> Result<()> {
        loop {
            let socket_opt = &self.0.lock().await.socket;

            let Some(socket) = socket_opt else {
                error!("Socket is None. Exiting receive loop.");
                return Err(anyhow!("Socket not initialized"));
            };

            let mut buf = [0u8; 1024];

            match socket.recv_from(&mut buf).await {
                Ok((len, addr)) => {
                    let msg = String::from_utf8_lossy(&buf[..len]);
                    let packet = UdpPacket {
                        data: msg.to_string(),
                        addr,
                    };

                    match sink.add(packet.clone()) {
                        Ok(_) => info!("Packet added to sink: {:?}", packet),
                        Err(e) => error!("Sink add error: {e}"),
                    }
                }
                Err(err) => {
                    error!("Failed to receive message: {err}");
                }
            }
        }
    }
}
