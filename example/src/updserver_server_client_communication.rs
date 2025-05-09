use std::{sync::Arc, time::Duration};

use anyhow::Result;
use pheonyx_engine::udp_server::UdpServer;
use tokio::{net::UdpSocket, time::sleep};

#[tokio::main]
async fn main() -> Result<()> {
    let port = 5432;
    let mut server = UdpServer::new(port).await?;
    let server_addr = server.socket.local_addr()?;

    server.run()?;

    // Create client
    let client = UdpSocket::bind("0.0.0.0:0").await?;
    let arc_client = Arc::new(client);
    arc_client.connect(server_addr).await?;
    let recv_client = arc_client.clone();

    tokio::spawn(async move {
        let mut buf = [0u8; 1024];
        if let Ok((size, addr)) = recv_client.recv_from(&mut buf).await {
            let msg = String::from_utf8_lossy(&buf[..size]);
            println!("Message from server : {} , from : {}", msg, addr);
        }
    });

    // Send message to server
    let msg = b"hello from client";
    arc_client.send(msg).await?;

    // Simulate server sending back a message
    sleep(Duration::from_millis(100)).await;
    server.send_message("hello from server").await?;

    // Wait for a message received by the server (from client)
    if let Some((msg, addr)) = server.rx.recv().await {
        let decode_msg = String::from_utf8_lossy(&msg);
        println!("Received from client: {} , from: {}", decode_msg, addr);
    }

    sleep(Duration::from_secs(5)).await;
    Ok(())
}
