use std::{sync::Arc, time::Duration};

use anyhow::Result;
use pheonyx_engine::udp_server::UdpServer;
use tokio::{sync::Notify, time::sleep};
use tracing::Level;
use tracing_subscriber::FmtSubscriber;

#[tokio::main]
async fn main() -> Result<()> {
    let subscriber = FmtSubscriber::builder()
        // all spans/events with a level higher than TRACE (e.g, debug, info, warn, etc.)
        // will be written to stdout.
        .with_max_level(Level::TRACE)
        // completes the builder.
        .finish();
    tracing::subscriber::set_global_default(subscriber).expect("setting default subscriber failed");

    let shutdown = Arc::new(Notify::new());
    let shutdown_clone = shutdown.clone();

    // Start the server in a background task
    tokio::spawn(async move {
        let _ = UdpServer::run_server(shutdown_clone).await;
    });

    // Wait a moment for the server to start
    loop {
        sleep(Duration::from_secs(5)).await;
    }
}
