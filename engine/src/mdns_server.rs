use anyhow::{Context, Result};
use std::{
    sync::{Arc, Mutex, Once},
    thread,
    time::Duration,
};
use tokio::time::sleep;
use tracing::{Level, error, info};
use tracing_subscriber::FmtSubscriber;

const SERVICE_NAME: &str = "_pheonyx._tcp";
const SERVER_NAME: &str = "Pheonyx Server";
const SERVER_PORT: u16 = 5435;

pub fn initialize_tracing() -> Result<()> {
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

    if !TRACING_INIT.is_completed() {
        info!("Global tracing subscriber already set, using existing configuration");
    }

    init_result
}

#[allow(dead_code)]
#[derive(Debug, Clone)]
struct MdnsServer {
    running: Arc<Mutex<bool>>,
}

#[allow(dead_code)]
impl MdnsServer {
    pub fn new() -> Self {
        Self {
            running: Arc::new(Mutex::new(true)),
        }
    }

    pub fn register_mdns_server(&self) -> Result<()> {
        let running = Arc::clone(&self.running);

        thread::spawn(move || {
            // Create the responder once
            let responder = match libmdns::Responder::new() {
                Ok(r) => r,
                Err(e) => {
                    error!("Failed to start libmdns responder: {:?}", e);
                    return;
                }
            };

            // Register the service once
            let _svc = responder.register(
                SERVICE_NAME.to_string(),
                SERVER_NAME.to_string(),
                SERVER_PORT,
                &["path=/"],
            );

            info!("mDNS service registered as {}", SERVICE_NAME);

            // Keep the thread alive as long as `running` is true
            loop {
                {
                    if !*running.lock().unwrap() {
                        break;
                    }
                }
                thread::sleep(Duration::from_secs(1));
            }

            info!("mDNS service stopped.");
            // Responder and _svc will be dropped here, unpublishing the service
        });

        Ok(())
    }

    pub fn start(&mut self) -> Result<()> {
        initialize_tracing()?;
        self.register_mdns_server()
    }

    pub fn stop(&self) {
        let mut running = self.running.lock().unwrap();
        *running = false;
        info!("Stopped mDNS server!");
    }
}

pub async fn register_mdns_server(dur: Option<u64>) -> Result<()> {
    initialize_tracing()?;
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

    #[test]
    fn test_mdns_server() {
        let mut mdns_server = MdnsServer::new();

        // Start the mDNS server
        let started = mdns_server.start();
        assert!(
            started.is_ok(),
            "Failed to start mDNS server: {:?}",
            started.err()
        );

        // Let the responder thread initialize
        thread::sleep(Duration::from_secs(1));

        // Check that the server is running
        let is_running = *mdns_server.running.lock().unwrap();
        assert!(is_running, "mDNS server should be running");

        // Stop the server
        mdns_server.stop();

        // Wait a bit to allow thread to exit
        thread::sleep(Duration::from_millis(200));

        // Check that the server has stopped
        let is_stopped = *mdns_server.running.lock().unwrap();
        assert!(!is_stopped, "Failed to stop mDNS server");
    }
}
