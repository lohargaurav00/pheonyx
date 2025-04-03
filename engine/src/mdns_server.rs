use std::{sync::Once, time::Duration};

use anyhow::{Context, Result};
use tokio::time::sleep;
use tracing::{Level, error, info};
use tracing_subscriber::FmtSubscriber;

const SERVICE_NAME: &str = "_pheonyx._tcp";
const SERVER_NAME: &str = "Pheonyx Server";
const SERVER_PORT: u16 = 5435;

pub async fn register_mdns_server(dur: Option<u64>) -> Result<()> {
    // Set up tracing subscriber
    static TRACING_INIT: Once = Once::new();
    let mut init_result = Ok(());

    TRACING_INIT.call_once(|| {
        let subscriber = FmtSubscriber::builder()
            .with_max_level(Level::TRACE)
            .finish();

        match tracing::subscriber::set_global_default(subscriber) {
            Ok(_) => {
                info!("Starting pheonyx server...");
                // Set up mdns logging
                let mut builder = env_logger::Builder::new();
                builder.parse_filters("libmdns=debug");
                builder.init();
            }
            Err(err) => {
                error!("Failed to set global tracing subscriber: {:?}", err);
                init_result = Err(anyhow::anyhow!(
                    "setting default subscriber failed: {:?}",
                    err
                ));
            }
        }
    });

    init_result?;

    if !TRACING_INIT.is_completed() {
        info!("Global tracing subscriber already set, using existing configuration");
    }

    // Create the responder
    let responder = libmdns::Responder::new().context("Failed to start the libmdns responder")?;

    // Register the service
    let _svc = responder.register(
        SERVICE_NAME.to_string(),
        SERVER_NAME.to_owned(),
        SERVER_PORT,
        &["path=/"],
    );

    sleep(Duration::from_secs(dur.unwrap_or_else(|| 5))).await;

    info!("mDNS service registered as {}", SERVICE_NAME);

    Ok(())
}

#[cfg(test)]
mod tests {

    use super::*;

    #[tokio::test]
    async fn test_register_mdns_server() {
        let server = register_mdns_server(Some(10)).await;

        // Server will be dropped at end of test, which should clean up resources
        assert!(
            server.is_ok(),
            "Failed to start the mdns server : {:?}",
            server
        )
    }
}
