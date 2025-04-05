use anyhow::Result;
use pheonyx_engine::mdns_server;

pub async fn start_mdns_server(dur: Option<u64>) -> Result<()> {
    mdns_server::register_mdns_server(dur).await
}
