use anyhow::{Ok, Result};
use flutter_rust_bridge::frb;
use pheonyx_engine::{mdns_server, udp_server::UdpServer};
use serde::Serialize;
use std::net::SocketAddr;

use crate::frb_generated::StreamSink;

use super::udp_client::UdpClient;

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

/// Starts a UDP server on the given port.
///
/// # Arguments
/// * `port` - The port to bind the UDP socket to.
///
/// # Returns
/// Returns a `UdpServer` instance wrapped in `Result`. This server can be used to send and receive messages.
pub async fn start_udp_server(port: u16) -> Result<UdpServer> {
    let server = UdpServer::new(port).await?;
    server.run()?;
    Ok(server)
}

/// Sends a message to all clients currently connected to the UDP server.
///
/// # Arguments
/// * `server` - The `UdpServer` instance used to send the message.
/// * `msg` - A `String` containing the message to be sent.
///
/// # Returns
/// Returns `Ok(())` if the message was sent successfully.
pub async fn udp_send_message(server: UdpServer, msg: String) -> Result<()> {
    server.send_message(&msg).await
}

/// Represents a received UDP message packet.
///
/// This struct will be serialized and sent to Flutter through a stream.
#[derive(Serialize)]
pub struct UdpPacket {
    /// Raw data received from the sender.
    pub data: Vec<u8>,
    /// The address of the sender.
    pub addr: SocketAddr,
}

/// Streams incoming UDP packets to the Flutter side.
///
/// This function runs a background task that listens for UDP messages and
/// sends each one to the provided `StreamSink`.
///
/// # Arguments
/// * `server` - The `UdpServer` instance to listen on.
/// * `sink` - The stream sink that forwards packets to Flutter.
///
/// # Returns
/// Returns `Ok(())` if the stream is set up successfully.
#[frb]
pub fn udp_receive_stream(server: UdpServer, sink: StreamSink<UdpPacket>) -> Result<()> {
    let mut rx = server.rx;
    tokio::spawn(async move {
        while let Some((data, addr)) = rx.recv().await {
            let packet = UdpPacket { data, addr };
            if sink.add(packet).is_err() {
                break;
            }
        }
    });

    Ok(())
}
