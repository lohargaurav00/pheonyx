import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multicast_dns/multicast_dns.dart';
import 'package:pheonyx/connect/models/models.dart';

part 'mdns_state.dart';
part 'mdns_cubit.freezed.dart';

class MdnsCubit extends Cubit<MdnsState> {
  MdnsCubit() : super(const MdnsState());

  Future<void> searchMdnsDevices() async {
    const String name = '_pheonyx._tcp.local';
    final MDnsClient client = MDnsClient();
    final devices = <MdnsService>[];

    try {
      emit(
        state.copyWith(
          isSearching: true,
          services: devices,
          status: Status.loading,
        ),
      );
      await client.start();

      await for (final PtrResourceRecord ptr in client
          .lookup<PtrResourceRecord>(
            ResourceRecordQuery.serverPointer(name),
            timeout: const Duration(seconds: 10),
          )) {
        final domainName = ptr.domainName;

        await for (final SrvResourceRecord srv in client
            .lookup<SrvResourceRecord>(
              ResourceRecordQuery.service(domainName),
            )) {
          final String host = srv.target;
          final int port = srv.port;
          String ip = '';
          Map<String, String> txtData = {};

          await for (final IPAddressResourceRecord ipRecord in client
              .lookup<IPAddressResourceRecord>(
                ResourceRecordQuery.addressIPv4(host),
              )) {
            if (ip.isEmpty) {
              ip = ipRecord.address.address;
            }
          }

          await for (final TxtResourceRecord txtRecord in client
              .lookup<TxtResourceRecord>(
                ResourceRecordQuery.text(domainName),
              )) {
            final rawTxt = txtRecord.text;

            for (final line in rawTxt.split('\n')) {
              final parts = line.split('=');
              if (parts.length == 2) {
                txtData[parts[0]] = parts[1];
              }
            }
          }

          final deviceName = _extractDeviceName(txtData, host, domainName);
          final deviceType = _inferDeviceType(domainName, host, txtData);

          final device = MdnsService(
            name: deviceName,
            ip: ip,
            host: host,
            port: port,
            deviceType: deviceType,
            txt: txtData,
          );

          if (!devices.contains(device)) {
            devices.add(device);
            emit(state.copyWith(services: devices, status: Status.success));
          }
        }
      }
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: "An error occurred during mDNS discovery: $e",
          status: Status.error,
        ),
      );
    } finally {
      client.stop();
      emit(state.copyWith(isSearching: false));
    }
  }
}

String _inferDeviceType(String name, String host, Map<String, String> txt) {
  final combined = '$name $host ${txt.values.join(" ")}'.toLowerCase();

  if (combined.contains("android")) return "Android";
  if (combined.contains("iphone") || combined.contains("ios")) return "iPhone";
  if (combined.contains("windows") || combined.contains("desktop")) {
    return "Windows";
  }
  if (combined.contains("mac") || combined.contains("macbook")) return "macOS";
  if (combined.contains("arch")) return "Arch";
  if (combined.contains("ubuntu")) return "Ubuntu";
  if (combined.contains("linux")) return "Linux";

  return "Unknown";
}

String _extractDeviceName(Map<String, String> txt, String host, String domain) {
  return txt['name'] ?? txt['device_name'] ?? host.split('.').first;
}
