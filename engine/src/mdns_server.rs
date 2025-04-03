use anyhow::{Context, Result};
use tracing::{Level, info};
use tracing_subscriber::FmtSubscriber;

const SERVICE_NAME: &str = "_pheonyx._tcp";
const SERVER_NAME: &str = "Pheonyx Server";
const SERVER_PORT: u16 = 5435;

pub struct MdnsServer {
    _svc: libmdns::Service,
}

impl MdnsServer {
    pub fn new() -> Result<()> {
        // Set up tracing subscriber
        let subscriber = FmtSubscriber::builder()
            .with_max_level(Level::TRACE)
            .finish();

        tracing::subscriber::set_global_default(subscriber)
            .context("setting default subscriber failed")?;

        info!("Starting pheonyx server...");

        // Set up mdns logging
        let mut builder = env_logger::Builder::new();
        builder.parse_filters("libmdns=debug");
        builder.init();

        // Create the responder
        let responder =
            libmdns::Responder::new().context("Failed to start the libmdns responder")?;

        // Register the service
        let _svc = responder.register(
            SERVICE_NAME.to_string(),
            SERVER_NAME.to_owned(),
            SERVER_PORT,
            &["path=/"],
        );

        info!("mDNS service registered as {}", SERVICE_NAME);

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_start_mdns_server() {
        let server = MdnsServer::new();

        // Server will be dropped at end of test, which should clean up resources
        assert!(
            server.is_ok(),
            "Failed to start the mdns server : {:?}",
            server
        )
    }
}
