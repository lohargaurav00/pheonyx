use anyhow::{Context, Result};
use flutter_rust_bridge::frb;
use std::sync::Arc;
use tokio::net::UdpSocket;
use tracing::{debug, info};

#[frb(opaque)]
pub struct UdpClient {
    pub connected: bool,
    pub socket: Option<Arc<UdpSocket>>,
}

impl UdpClient {
    pub fn new() -> Self {
        UdpClient {
            connected: false,
            socket: None,
        }
    }

    pub async fn connect(&mut self, port: u16, ip: &str) -> Result<()> {
        let client = UdpSocket::bind("0.0.0.0:0")
            .await
            .context("Failed to bind UDP client socket")?;

        client
            .connect(format!("{ip}:{port}"))
            .await
            .with_context(|| format!("Failed to connect to server {ip}:{port}"))?;

        self.connected = true;
        self.socket = Some(Arc::new(client));

        info!("Client connected to {ip}:{port}");

        Ok(())
    }

    pub async fn send_message(&self, message: &str) -> Result<()> {
        if let Some(socket) = &self.socket {
            let bytes_sent = socket
                .send(message.as_bytes())
                .await
                .with_context(|| "Failed to send message via UDP socket")?;

            debug!("Sent {bytes_sent} bytes: \"{message}\"");

            Ok(())
        } else {
            anyhow::bail!("Cannot send message: client not connected")
        }
    }

    pub async fn receive_message(&self) -> Result<String> {
        if let Some(socket) = &self.socket {
            let mut buf = [0; 1024];
            let len = socket
                .recv(&mut buf)
                .await
                .context("Failed to receive message via UDP socket")?;

            let received = String::from_utf8_lossy(&buf[..len]).to_string();
            debug!("Received {len} bytes: \"{received}\"");

            Ok(received)
        } else {
            anyhow::bail!("Cannot receive message: client not connected")
        }
    }
}

#[frb]
pub fn create_udp_client() -> UdpClient {
    UdpClient::new()
}

#[frb]
pub async fn udp_client_connect_to_server(
    client: &mut UdpClient,
    ip: String,
    port: u16,
) -> Result<()> {
    client.connect(port, &ip).await
}

#[frb]
pub async fn udp_client_send_text(client: &UdpClient, message: String) -> Result<()> {
    client.send_message(&message).await
}

#[frb]
pub async fn udp_client_receive_text(client: &UdpClient) -> Result<String> {
    client.receive_message().await
}

#[frb]
pub fn udp_client_is_connected_status(client: &UdpClient) -> bool {
    client.connected
}
