import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multicast_dns/multicast_dns.dart';

part 'mdns_state.dart';
part 'mdns_cubit.freezed.dart';

class MdnsCubit extends Cubit<MdnsState> {
  MdnsCubit() : super(const MdnsState.initial());

  Future<void> searchMdnsDevices() async {
    const String name = '_pheonyx._tcp.local';
    final MDnsClient client = MDnsClient();
    final devices = <String>[];

    try {
      emit(const MdnsState.searching(true));
      // Start the client with default options.
      await client.start();

      // Get the PTR record for the service.
      await for (final PtrResourceRecord ptr in client
          .lookup<PtrResourceRecord>(
            ResourceRecordQuery.serverPointer(name),
            timeout: Duration(seconds: 10),
          )) {
        await for (final SrvResourceRecord srv in client
            .lookup<SrvResourceRecord>(
              ResourceRecordQuery.service(ptr.domainName),
            )) {
          final String bundleId = ptr.domainName;
          final device = '${srv.target}:${srv.port} for "$bundleId"';

          // Directly update and emit discovered devices as they are found
          if (!devices.contains(device)) {
            devices.add(device);
            emit(
              MdnsState.devices(devices),
            ); // Emit the discovered state directly
          }

          print('Dart observatory instance found at, $device');
        }
      }
    } catch (e) {
      emit(MdnsState.error("An error occurred during mDNS discovery: $e"));
    } finally {
      emit(const MdnsState.searching(false));
      client.stop();
    }

    print('Done.');
  }
}
