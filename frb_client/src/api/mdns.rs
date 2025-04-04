use anyhow::Result;
use pheonyx_engine::mdns_server;

pub async fn start_mdns_server(dur: Option<u64>) -> Result<()> {
    mdns_server::register_mdns_server(dur).await
}

pub fn create_mdns_server() -> mdns_server::MdnsServer {
    mdns_server::MdnsServer::new()
}
