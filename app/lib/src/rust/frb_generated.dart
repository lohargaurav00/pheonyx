// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.9.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/mdns.dart';
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
  int get rustContentHash => -313983888;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
        stem: 'pheonyx_frb_client',
        ioDirectory: '../frb_client/target/release/',
        webPrefix: 'pkg/',
      );
}

abstract class RustLibApi extends BaseApi {
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

  Future<void> crateApiMdnsStartMdnsServer({int? dur});

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
            funcId: 1,
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
          return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 2)!;
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
            funcId: 3,
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
            funcId: 4,
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
  Future<void> crateApiMdnsStartMdnsServer({int? dur}) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_opt_CastedPrimitive_u_64(dur, serializer);
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
        constMeta: kCrateApiMdnsStartMdnsServerConstMeta,
        argValues: [dur],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiMdnsStartMdnsServerConstMeta =>
      const TaskConstMeta(debugName: "start_mdns_server", argNames: ["dur"]);

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
  bool sse_decode_bool(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8() != 0;
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

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self ? 1 : 0);
  }
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

  Future<void> connect({required int port, required String ip}) => RustLib
      .instance
      .api
      .crateApiUdpClientUdpClientConnect(that: this, port: port, ip: ip);

  Future<String> receiveMessage() =>
      RustLib.instance.api.crateApiUdpClientUdpClientReceiveMessage(that: this);

  Future<void> sendMessage({required String message}) => RustLib.instance.api
      .crateApiUdpClientUdpClientSendMessage(that: this, message: message);
}
