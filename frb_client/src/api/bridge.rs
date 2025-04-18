use anyhow::Result;
use flutter_rust_bridge::frb;
use pheonyx_engine::mdns_server;

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
