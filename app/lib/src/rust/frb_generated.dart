// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.9.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/bridge.dart';
import 'api/udp_client.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'frb_generated.io.dart'
    if (dart.library.js_interop) 'frb_generated.web.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Initialize flutter_rust_bridge in mock mode.
  /// No libraries for FFI are loaded.
  static void initMock({required RustLibApi api}) {
    instance.initMockImpl(api: api);
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  Future<void> executeRustInitializers() async {}

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  @override
  String get codegenVersion => '2.9.0';

  @override
  int get rustContentHash => 1966097431;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
        stem: 'pheonyx_frb_client',
        ioDirectory: '../frb_client/target/release/',
        webPrefix: 'pkg/',
      );
}

abstract class RustLibApi extends BaseApi {
  bool crateApiUdpClientUdpClientAutoAccessorGetConnected({
    required UdpClient that,
  });

  ArcUdpSocket? crateApiUdpClientUdpClientAutoAccessorGetSocket({
    required UdpClient that,
  });

  void crateApiUdpClientUdpClientAutoAccessorSetConnected({
    required UdpClient that,
    required bool connected,
  });

  void crateApiUdpClientUdpClientAutoAccessorSetSocket({
    required UdpClient that,
    ArcUdpSocket? socket,
  });

  Future<void> crateApiUdpClientUdpClientConnect({
    required UdpClient that,
    required int port,
    required String ip,
  });

  UdpClient crateApiUdpClientUdpClientNew();

  Future<String> crateApiUdpClientUdpClientReceiveMessage({
    required UdpClient that,
  });

  Future<void> crateApiUdpClientUdpClientSendMessage({
    required UdpClient that,
    required String message,
  });

  UdpClient crateApiBridgeCreateUdpClient();

  Future<void> crateApiBridgeStartMdnsServer({int? dur});

  Future<void> crateApiBridgeUdpClientConnectToServer({
    required UdpClient client,
    required String ip,
    required int port,
  });

  bool crateApiBridgeUdpClientIsConnectedStatus({required UdpClient client});

  Future<String> crateApiBridgeUdpClientReceiveText({
    required UdpClient client,
  });

  Future<void> crateApiBridgeUdpClientSendText({
    required UdpClient client,
    required String message,
  });

  RustArcIncrementStrongCountFnType
  get rust_arc_increment_strong_count_ArcUdpSocket;

  RustArcDecrementStrongCountFnType
  get rust_arc_decrement_strong_count_ArcUdpSocket;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_ArcUdpSocketPtr;

  RustArcIncrementStrongCountFnType
  get rust_arc_increment_strong_count_UdpClient;

  RustArcDecrementStrongCountFnType
  get rust_arc_decrement_strong_count_UdpClient;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_UdpClientPtr;
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  bool crateApiUdpClientUdpClientAutoAccessorGetConnected({
    required UdpClient that,
  }) {
    return handler.executeSync(
      SyncTask(
        callFfi: () {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
            that,
            serializer,
          );
          return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 1)!;
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_bool,
          decodeErrorData: null,
        ),
        constMeta: kCrateApiUdpClientUdpClientAutoAccessorGetConnectedConstMeta,
        argValues: [that],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta
  get kCrateApiUdpClientUdpClientAutoAccessorGetConnectedConstMeta =>
      const TaskConstMeta(
        debugName: "UdpClient_auto_accessor_get_connected",
        argNames: ["that"],
      );

  @override
  ArcUdpSocket? crateApiUdpClientUdpClientAutoAccessorGetSocket({
    required UdpClient that,
  }) {
    return handler.executeSync(
      SyncTask(
        callFfi: () {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
            that,
            serializer,
          );
          return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 2)!;
        },
        codec: SseCodec(
          decodeSuccessData:
              sse_decode_opt_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket,
          decodeErrorData: null,
        ),
        constMeta: kCrateApiUdpClientUdpClientAutoAccessorGetSocketConstMeta,
        argValues: [that],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiUdpClientUdpClientAutoAccessorGetSocketConstMeta =>
      const TaskConstMeta(
        debugName: "UdpClient_auto_accessor_get_socket",
        argNames: ["that"],
      );

  @override
  void crateApiUdpClientUdpClientAutoAccessorSetConnected({
    required UdpClient that,
    required bool connected,
  }) {
    return handler.executeSync(
      SyncTask(
        callFfi: () {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
            that,
            serializer,
          );
          sse_encode_bool(connected, serializer);
          return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 3)!;
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_unit,
          decodeErrorData: null,
        ),
        constMeta: kCrateApiUdpClientUdpClientAutoAccessorSetConnectedConstMeta,
        argValues: [that, connected],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta
  get kCrateApiUdpClientUdpClientAutoAccessorSetConnectedConstMeta =>
      const TaskConstMeta(
        debugName: "UdpClient_auto_accessor_set_connected",
        argNames: ["that", "connected"],
      );

  @override
  void crateApiUdpClientUdpClientAutoAccessorSetSocket({
    required UdpClient that,
    ArcUdpSocket? socket,
  }) {
    return handler.executeSync(
      SyncTask(
        callFfi: () {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
            that,
            serializer,
          );
          sse_encode_opt_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
            socket,
            serializer,
          );
          return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 4)!;
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_unit,
          decodeErrorData: null,
        ),
        constMeta: kCrateApiUdpClientUdpClientAutoAccessorSetSocketConstMeta,
        argValues: [that, socket],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiUdpClientUdpClientAutoAccessorSetSocketConstMeta =>
      const TaskConstMeta(
        debugName: "UdpClient_auto_accessor_set_socket",
        argNames: ["that", "socket"],
      );

  @override
  Future<void> crateApiUdpClientUdpClientConnect({
    required UdpClient that,
    required int port,
    required String ip,
  }) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
            that,
            serializer,
          );
          sse_encode_u_16(port, serializer);
          sse_encode_String(ip, serializer);
          pdeCallFfi(
            generalizedFrbRustBinding,
            serializer,
            funcId: 5,
            port: port_,
          );
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_unit,
          decodeErrorData: sse_decode_AnyhowException,
        ),
        constMeta: kCrateApiUdpClientUdpClientConnectConstMeta,
        argValues: [that, port, ip],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiUdpClientUdpClientConnectConstMeta =>
      const TaskConstMeta(
        debugName: "UdpClient_connect",
        argNames: ["that", "port", "ip"],
      );

  @override
  UdpClient crateApiUdpClientUdpClientNew() {
    return handler.executeSync(
      SyncTask(
        callFfi: () {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 6)!;
        },
        codec: SseCodec(
          decodeSuccessData:
              sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient,
          decodeErrorData: null,
        ),
        constMeta: kCrateApiUdpClientUdpClientNewConstMeta,
        argValues: [],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiUdpClientUdpClientNewConstMeta =>
      const TaskConstMeta(debugName: "UdpClient_new", argNames: []);

  @override
  Future<String> crateApiUdpClientUdpClientReceiveMessage({
    required UdpClient that,
  }) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
            that,
            serializer,
          );
          pdeCallFfi(
            generalizedFrbRustBinding,
            serializer,
            funcId: 7,
            port: port_,
          );
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_String,
          decodeErrorData: sse_decode_AnyhowException,
        ),
        constMeta: kCrateApiUdpClientUdpClientReceiveMessageConstMeta,
        argValues: [that],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiUdpClientUdpClientReceiveMessageConstMeta =>
      const TaskConstMeta(
        debugName: "UdpClient_receive_message",
        argNames: ["that"],
      );

  @override
  Future<void> crateApiUdpClientUdpClientSendMessage({
    required UdpClient that,
    required String message,
  }) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
            that,
            serializer,
          );
          sse_encode_String(message, serializer);
          pdeCallFfi(
            generalizedFrbRustBinding,
            serializer,
            funcId: 8,
            port: port_,
          );
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_unit,
          decodeErrorData: sse_decode_AnyhowException,
        ),
        constMeta: kCrateApiUdpClientUdpClientSendMessageConstMeta,
        argValues: [that, message],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiUdpClientUdpClientSendMessageConstMeta =>
      const TaskConstMeta(
        debugName: "UdpClient_send_message",
        argNames: ["that", "message"],
      );

  @override
  UdpClient crateApiBridgeCreateUdpClient() {
    return handler.executeSync(
      SyncTask(
        callFfi: () {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 9)!;
        },
        codec: SseCodec(
          decodeSuccessData:
              sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient,
          decodeErrorData: null,
        ),
        constMeta: kCrateApiBridgeCreateUdpClientConstMeta,
        argValues: [],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiBridgeCreateUdpClientConstMeta =>
      const TaskConstMeta(debugName: "create_udp_client", argNames: []);

  @override
  Future<void> crateApiBridgeStartMdnsServer({int? dur}) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_opt_CastedPrimitive_u_64(dur, serializer);
          pdeCallFfi(
            generalizedFrbRustBinding,
            serializer,
            funcId: 10,
            port: port_,
          );
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_unit,
          decodeErrorData: sse_decode_AnyhowException,
        ),
        constMeta: kCrateApiBridgeStartMdnsServerConstMeta,
        argValues: [dur],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiBridgeStartMdnsServerConstMeta =>
      const TaskConstMeta(debugName: "start_mdns_server", argNames: ["dur"]);

  @override
  Future<void> crateApiBridgeUdpClientConnectToServer({
    required UdpClient client,
    required String ip,
    required int port,
  }) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
            client,
            serializer,
          );
          sse_encode_String(ip, serializer);
          sse_encode_u_16(port, serializer);
          pdeCallFfi(
            generalizedFrbRustBinding,
            serializer,
            funcId: 11,
            port: port_,
          );
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_unit,
          decodeErrorData: sse_decode_AnyhowException,
        ),
        constMeta: kCrateApiBridgeUdpClientConnectToServerConstMeta,
        argValues: [client, ip, port],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiBridgeUdpClientConnectToServerConstMeta =>
      const TaskConstMeta(
        debugName: "udp_client_connect_to_server",
        argNames: ["client", "ip", "port"],
      );

  @override
  bool crateApiBridgeUdpClientIsConnectedStatus({required UdpClient client}) {
    return handler.executeSync(
      SyncTask(
        callFfi: () {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
            client,
            serializer,
          );
          return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 12)!;
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_bool,
          decodeErrorData: null,
        ),
        constMeta: kCrateApiBridgeUdpClientIsConnectedStatusConstMeta,
        argValues: [client],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiBridgeUdpClientIsConnectedStatusConstMeta =>
      const TaskConstMeta(
        debugName: "udp_client_is_connected_status",
        argNames: ["client"],
      );

  @override
  Future<String> crateApiBridgeUdpClientReceiveText({
    required UdpClient client,
  }) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
            client,
            serializer,
          );
          pdeCallFfi(
            generalizedFrbRustBinding,
            serializer,
            funcId: 13,
            port: port_,
          );
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_String,
          decodeErrorData: sse_decode_AnyhowException,
        ),
        constMeta: kCrateApiBridgeUdpClientReceiveTextConstMeta,
        argValues: [client],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiBridgeUdpClientReceiveTextConstMeta =>
      const TaskConstMeta(
        debugName: "udp_client_receive_text",
        argNames: ["client"],
      );

  @override
  Future<void> crateApiBridgeUdpClientSendText({
    required UdpClient client,
    required String message,
  }) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
            client,
            serializer,
          );
          sse_encode_String(message, serializer);
          pdeCallFfi(
            generalizedFrbRustBinding,
            serializer,
            funcId: 14,
            port: port_,
          );
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_unit,
          decodeErrorData: sse_decode_AnyhowException,
        ),
        constMeta: kCrateApiBridgeUdpClientSendTextConstMeta,
        argValues: [client, message],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiBridgeUdpClientSendTextConstMeta =>
      const TaskConstMeta(
        debugName: "udp_client_send_text",
        argNames: ["client", "message"],
      );

  RustArcIncrementStrongCountFnType
  get rust_arc_increment_strong_count_ArcUdpSocket =>
      wire.rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket;

  RustArcDecrementStrongCountFnType
  get rust_arc_decrement_strong_count_ArcUdpSocket =>
      wire.rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket;

  RustArcIncrementStrongCountFnType
  get rust_arc_increment_strong_count_UdpClient =>
      wire.rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient;

  RustArcDecrementStrongCountFnType
  get rust_arc_decrement_strong_count_UdpClient =>
      wire.rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient;

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return AnyhowException(raw as String);
  }

  @protected
  ArcUdpSocket
  dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
    dynamic raw,
  ) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return ArcUdpSocketImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  UdpClient
  dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
    dynamic raw,
  ) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return UdpClientImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  UdpClient
  dco_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
    dynamic raw,
  ) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return UdpClientImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  UdpClient
  dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
    dynamic raw,
  ) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return UdpClientImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  int dco_decode_CastedPrimitive_u_64(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    throw UnimplementedError(
      'Not implemented in this codec, please use the other one',
    );
  }

  @protected
  ArcUdpSocket
  dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
    dynamic raw,
  ) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return ArcUdpSocketImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  UdpClient
  dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
    dynamic raw,
  ) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return UdpClientImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  String dco_decode_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as String;
  }

  @protected
  bool dco_decode_bool(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as bool;
  }

  @protected
  ArcUdpSocket
  dco_decode_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
    dynamic raw,
  ) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
      raw,
    );
  }

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as Uint8List;
  }

  @protected
  int? dco_decode_opt_CastedPrimitive_u_64(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw == null ? null : dco_decode_CastedPrimitive_u_64(raw);
  }

  @protected
  ArcUdpSocket?
  dco_decode_opt_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
    dynamic raw,
  ) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw == null
        ? null
        : dco_decode_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
          raw,
        );
  }

  @protected
  int dco_decode_u_16(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  BigInt dco_decode_u_64(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeU64(raw);
  }

  @protected
  int dco_decode_u_8(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  void dco_decode_unit(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return;
  }

  @protected
  BigInt dco_decode_usize(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeU64(raw);
  }

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_String(deserializer);
    return AnyhowException(inner);
  }

  @protected
  ArcUdpSocket
  sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
    SseDeserializer deserializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return ArcUdpSocketImpl.frbInternalSseDecode(
      sse_decode_usize(deserializer),
      sse_decode_i_32(deserializer),
    );
  }

  @protected
  UdpClient
  sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
    SseDeserializer deserializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return UdpClientImpl.frbInternalSseDecode(
      sse_decode_usize(deserializer),
      sse_decode_i_32(deserializer),
    );
  }

  @protected
  UdpClient
  sse_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
    SseDeserializer deserializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return UdpClientImpl.frbInternalSseDecode(
      sse_decode_usize(deserializer),
      sse_decode_i_32(deserializer),
    );
  }

  @protected
  UdpClient
  sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
    SseDeserializer deserializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return UdpClientImpl.frbInternalSseDecode(
      sse_decode_usize(deserializer),
      sse_decode_i_32(deserializer),
    );
  }

  @protected
  int sse_decode_CastedPrimitive_u_64(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_u_64(deserializer);
    return inner.toInt();
  }

  @protected
  ArcUdpSocket
  sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
    SseDeserializer deserializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return ArcUdpSocketImpl.frbInternalSseDecode(
      sse_decode_usize(deserializer),
      sse_decode_i_32(deserializer),
    );
  }

  @protected
  UdpClient
  sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
    SseDeserializer deserializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return UdpClientImpl.frbInternalSseDecode(
      sse_decode_usize(deserializer),
      sse_decode_i_32(deserializer),
    );
  }

  @protected
  String sse_decode_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_list_prim_u_8_strict(deserializer);
    return utf8.decoder.convert(inner);
  }

  @protected
  bool sse_decode_bool(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8() != 0;
  }

  @protected
  ArcUdpSocket
  sse_decode_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
    SseDeserializer deserializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return (sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
      deserializer,
    ));
  }

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  int? sse_decode_opt_CastedPrimitive_u_64(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    if (sse_decode_bool(deserializer)) {
      return (sse_decode_CastedPrimitive_u_64(deserializer));
    } else {
      return null;
    }
  }

  @protected
  ArcUdpSocket?
  sse_decode_opt_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
    SseDeserializer deserializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    if (sse_decode_bool(deserializer)) {
      return (sse_decode_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
        deserializer,
      ));
    } else {
      return null;
    }
  }

  @protected
  int sse_decode_u_16(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint16();
  }

  @protected
  BigInt sse_decode_u_64(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getBigUint64();
  }

  @protected
  int sse_decode_u_8(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8();
  }

  @protected
  void sse_decode_unit(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  BigInt sse_decode_usize(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getBigUint64();
  }

  @protected
  int sse_decode_i_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getInt32();
  }

  @protected
  void sse_encode_AnyhowException(
    AnyhowException self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_String(self.message, serializer);
  }

  @protected
  void
  sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
    ArcUdpSocket self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
      (self as ArcUdpSocketImpl).frbInternalSseEncode(move: true),
      serializer,
    );
  }

  @protected
  void
  sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
    UdpClient self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
      (self as UdpClientImpl).frbInternalSseEncode(move: true),
      serializer,
    );
  }

  @protected
  void
  sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
    UdpClient self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
      (self as UdpClientImpl).frbInternalSseEncode(move: false),
      serializer,
    );
  }

  @protected
  void
  sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
    UdpClient self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
      (self as UdpClientImpl).frbInternalSseEncode(move: false),
      serializer,
    );
  }

  @protected
  void sse_encode_CastedPrimitive_u_64(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_u_64(sseEncodeCastedPrimitiveU64(self), serializer);
  }

  @protected
  void
  sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
    ArcUdpSocket self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
      (self as ArcUdpSocketImpl).frbInternalSseEncode(move: null),
      serializer,
    );
  }

  @protected
  void
  sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUdpClient(
    UdpClient self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
      (self as UdpClientImpl).frbInternalSseEncode(move: null),
      serializer,
    );
  }

  @protected
  void sse_encode_String(String self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(utf8.encoder.convert(self), serializer);
  }

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self ? 1 : 0);
  }

  @protected
  void
  sse_encode_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
    ArcUdpSocket self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
      self,
      serializer,
    );
  }

  @protected
  void sse_encode_list_prim_u_8_strict(
    Uint8List self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(self);
  }

  @protected
  void sse_encode_opt_CastedPrimitive_u_64(
    int? self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    sse_encode_bool(self != null, serializer);
    if (self != null) {
      sse_encode_CastedPrimitive_u_64(self, serializer);
    }
  }

  @protected
  void
  sse_encode_opt_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
    ArcUdpSocket? self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    sse_encode_bool(self != null, serializer);
    if (self != null) {
      sse_encode_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerArcUdpSocket(
        self,
        serializer,
      );
    }
  }

  @protected
  void sse_encode_u_16(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint16(self);
  }

  @protected
  void sse_encode_u_64(BigInt self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putBigUint64(self);
  }

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self);
  }

  @protected
  void sse_encode_unit(void self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  void sse_encode_usize(BigInt self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putBigUint64(self);
  }

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putInt32(self);
  }
}

@sealed
class ArcUdpSocketImpl extends RustOpaque implements ArcUdpSocket {
  // Not to be used by end users
  ArcUdpSocketImpl.frbInternalDcoDecode(List<dynamic> wire)
    : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  ArcUdpSocketImpl.frbInternalSseDecode(BigInt ptr, int externalSizeOnNative)
    : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_ArcUdpSocket,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_ArcUdpSocket,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_ArcUdpSocketPtr,
  );
}

@sealed
class UdpClientImpl extends RustOpaque implements UdpClient {
  // Not to be used by end users
  UdpClientImpl.frbInternalDcoDecode(List<dynamic> wire)
    : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  UdpClientImpl.frbInternalSseDecode(BigInt ptr, int externalSizeOnNative)
    : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_UdpClient,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_UdpClient,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_UdpClientPtr,
  );

  bool get connected => RustLib.instance.api
      .crateApiUdpClientUdpClientAutoAccessorGetConnected(that: this);

  ArcUdpSocket? get socket => RustLib.instance.api
      .crateApiUdpClientUdpClientAutoAccessorGetSocket(that: this);

  set connected(bool connected) =>
      RustLib.instance.api.crateApiUdpClientUdpClientAutoAccessorSetConnected(
        that: this,
        connected: connected,
      );

  set socket(ArcUdpSocket? socket) =>
      RustLib.instance.api.crateApiUdpClientUdpClientAutoAccessorSetSocket(
        that: this,
        socket: socket,
      );

  Future<void> connect({required int port, required String ip}) => RustLib
      .instance
      .api
      .crateApiUdpClientUdpClientConnect(that: this, port: port, ip: ip);

  Future<String> receiveMessage() =>
      RustLib.instance.api.crateApiUdpClientUdpClientReceiveMessage(that: this);

  Future<void> sendMessage({required String message}) => RustLib.instance.api
      .crateApiUdpClientUdpClientSendMessage(that: this, message: message);
}
