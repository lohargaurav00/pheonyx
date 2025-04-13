use anyhow::{Context, Result};
use flutter_rust_bridge::frb;
use tokio::net::UdpSocket;
use tracing::{debug, info, instrument};

#[derive(Debug)]
#[frb(opaque)]
pub struct UdpClient {
    connected: bool,
    socket: Option<UdpSocket>,
}

impl UdpClient {
    pub fn new() -> Self {
        UdpClient {
            connected: false,
            socket: None,
        }
    }

    #[instrument(skip(self))]
    pub async fn connect(&mut self, port: u16, ip: &str) -> Result<()> {
        let client = UdpSocket::bind("0.0.0.0:0")
            .await
            .context("Failed to bind UDP client socket")?;

        client
            .connect(format!("{ip}:{port}"))
            .await
            .with_context(|| format!("Failed to connect to server {ip}:{port}"))?;

        self.connected = true;
        self.socket = Some(client);

        info!("Client connected to {ip}:{port}");

        Ok(())
    }

    #[instrument(skip(self, message))]
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

    #[instrument(skip(self))]
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
