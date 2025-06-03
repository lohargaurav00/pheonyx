use anyhow::Result;
use flutter_rust_bridge::frb;
use pheonyx_engine::{mdns_server, udp_client::UdpClient, udp_server::UdpServer as PudpServer};
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

/// Creates a new instance of `UdpClient`.
///
/// # Returns
///
/// * `UdpClient` - A new UDP client with default unconnected state.
#[frb]
pub fn create_udp_client() -> UdpClient {
    UdpClient::new()
}

/// Connects a `UdpClient` instance to a specified UDP server.
///
/// # Arguments
///
/// * `client` - Mutable reference to the `UdpClient`.
/// * `ip` - The IP address of the server to connect to.
/// * `port` - The port number of the server.
///
/// # Returns
///
/// * `Result<()>` - Returns `Ok(())` if the connection is successful, otherwise an error.
#[frb]
pub async fn udp_client_connect_to_server(
    client: &mut UdpClient,
    ip: String,
    port: u16,
) -> Result<()> {
    client.connect(port, &ip).await
}

/// Sends a text message to the connected UDP server using the given client.
///
/// # Arguments
///
/// * `client` - Reference to the `UdpClient`.
/// * `message` - The message string to be sent.
///
/// # Returns
///
/// * `Result<()>` - Returns `Ok(())` if the message is sent successfully, otherwise an error.
#[frb]
pub async fn udp_client_send_text(client: &UdpClient, message: String) -> Result<()> {
    client.send_message(&message).await
}

/// Receives a text message from the connected UDP server using the given client.
///
/// # Arguments
///
/// * `client` - Reference to the `UdpClient`.
///
/// # Returns
///
/// * `Result<String>` - Returns the received message as a string if successful, otherwise an error.
#[frb]
pub async fn udp_client_receive_text(client: &UdpClient) -> Result<String> {
    client.receive_message().await
}

/// Checks whether the given `UdpClient` is currently connected to a server.
///
/// # Arguments
///
/// * `client` - Reference to the `UdpClient`.
///
/// # Returns
///
/// * `bool` - `true` if the client is connected, `false` otherwise.
#[frb]
pub fn udp_client_is_connected_status(client: &UdpClient) -> bool {
    client.connected
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
#[derive(Serialize)]
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
