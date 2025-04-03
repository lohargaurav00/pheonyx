use std::time::Duration;

use anyhow::Result;
use pheonyx_engine::mdns_server::MdnsServer;
use tokio::time::sleep;

pub async fn start_mdns_server(dur: Option<u64>) -> Result<()> {
    let duration = Duration::from_secs(dur.unwrap_or_else(|| 5));

    let _ = MdnsServer::new();

    sleep(duration).await;
    Ok(())
}
