fn main() {
    // tracing_subscriber::fmt::init();
    // let mut udp_client = UdpClient::new();
    // udp_client
    //     .connect(5435, "192.168.1.107")
    //     .await
    //     .context("Failed to connect device")?;

    // let r = Arc::new(udp_client);
    // let s = r.clone();

    // tokio::spawn(async move {
    //     match s.receive_message().await {
    //         Ok(msg) => println!("message: {}", msg),
    //         Err(err) => eprintln!("error while receiving message : {}", err),
    //     };
    // });

    // let s = r.clone();

    // s.send_message("Hello Server!").await?;

    // loop {
    //     tokio::time::sleep(std::time::Duration::from_secs(5)).await;
    // }
}
