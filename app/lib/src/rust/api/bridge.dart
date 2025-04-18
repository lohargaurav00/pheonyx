// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.9.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'udp_client.dart';

/// Starts an mDNS server for device discovery on the local network.
///
/// # Arguments
///
/// * `dur` - Optional duration (in seconds) to run the server before shutting down.
/// If `None`, the server runs for 5 seconds.
///
/// # Returns
///
/// * `Result<()>` - Returns `Ok(())` if the server starts successfully, otherwise an error.
Future<void> startMdnsServer({int? dur}) =>
    RustLib.instance.api.crateApiBridgeStartMdnsServer(dur: dur);

/// Creates a new instance of `UdpClient`.
///
/// # Returns
///
/// * `UdpClient` - A new UDP client with default unconnected state.
UdpClient createUdpClient() =>
    RustLib.instance.api.crateApiBridgeCreateUdpClient();

/// Connects a `UdpClient` instance to a specified UDP server.
///
/// # Arguments
///
/// * `client` - Mutable reference to the `UdpClient`.
/// * `ip` - The IP address of the server to connect to.
/// * `port` - The port number of the server.
///
/// # Returns
///
/// * `Result<()>` - Returns `Ok(())` if the connection is successful, otherwise an error.
Future<void> udpClientConnectToServer({
  required UdpClient client,
  required String ip,
  required int port,
}) => RustLib.instance.api.crateApiBridgeUdpClientConnectToServer(
  client: client,
  ip: ip,
  port: port,
);

/// Sends a text message to the connected UDP server using the given client.
///
/// # Arguments
///
/// * `client` - Reference to the `UdpClient`.
/// * `message` - The message string to be sent.
///
/// # Returns
///
/// * `Result<()>` - Returns `Ok(())` if the message is sent successfully, otherwise an error.
Future<void> udpClientSendText({
  required UdpClient client,
  required String message,
}) => RustLib.instance.api.crateApiBridgeUdpClientSendText(
  client: client,
  message: message,
);

/// Receives a text message from the connected UDP server using the given client.
///
/// # Arguments
///
/// * `client` - Reference to the `UdpClient`.
///
/// # Returns
///
/// * `Result<String>` - Returns the received message as a string if successful, otherwise an error.
Future<String> udpClientReceiveText({required UdpClient client}) =>
    RustLib.instance.api.crateApiBridgeUdpClientReceiveText(client: client);

/// Checks whether the given `UdpClient` is currently connected to a server.
///
/// # Arguments
///
/// * `client` - Reference to the `UdpClient`.
///
/// # Returns
///
/// * `bool` - `true` if the client is connected, `false` otherwise.
bool udpClientIsConnectedStatus({required UdpClient client}) => RustLib
    .instance
    .api
    .crateApiBridgeUdpClientIsConnectedStatus(client: client);
