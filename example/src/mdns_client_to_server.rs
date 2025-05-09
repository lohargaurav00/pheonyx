use std::time::Duration;

use anyhow::Result;
use pheonyx_engine::udp_server::UdpServer;
use tokio::{net::UdpSocket, time::sleep};

#[tokio::main]
async fn main() -> Result<()> {
    let port = 5432;
    let mut server = UdpServer::new(port).await?;
    let server_addr = server.socket.local_addr()?;

    server.run()?;

    let client = UdpSocket::bind("0.0.0.0:0").await?;
    client.connect(server_addr).await?;

    let msg = b"hello from client";
    client.send_to(msg, server_addr).await?;

    sleep(Duration::from_millis(100)).await;

    if let Some((msg, addr)) = server.rx.recv().await {
        let decode_msg = String::from_utf8_lossy(&msg);
        println!("Received from : {} , message : {} ", decode_msg, addr);
    }

    sleep(Duration::from_secs(5)).await;
    Ok(())
}
