import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double iconSize = 20;
const archIcon = 'assets/icons/arch.svg';
const ubuntuIcon = 'assets/icons/ubuntu.svg';
const linuxIcon = 'assets/icons/linux.svg';
const appleIcon = 'assets/icons/apple.svg';
const windowsIcon = 'assets/icons/windows.svg';

class IconConfig extends StatelessWidget {
  const IconConfig({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return switch (icon.toLowerCase()) {
      'iphone' ||
      'android' => Icon(CupertinoIcons.device_phone_portrait, size: iconSize),
      'arch' => SvgPicture.asset(
        archIcon,
        colorFilter: const ColorFilter.mode(Color(0xFF1793d1), BlendMode.srcIn),
        semanticsLabel: 'arch',
        width: iconSize,
        height: iconSize,
      ),
      'ubuntu' => SvgPicture.asset(
        ubuntuIcon,
        semanticsLabel: 'ubuntu',
        width: iconSize,
        height: iconSize,
      ),
      'linux' => SvgPicture.asset(
        linuxIcon,
        semanticsLabel: 'linux',
        width: iconSize,
        height: iconSize,
      ),
      'apple' => SvgPicture.asset(
        appleIcon,
        colorFilter: const ColorFilter.mode(Color(0xFF555555), BlendMode.srcIn),
        semanticsLabel: 'apple',
        width: iconSize,
        height: iconSize,
      ),
      'windows' => SvgPicture.asset(
        windowsIcon,
        semanticsLabel: 'windows',
        width: iconSize,
        height: iconSize,
      ),
      _ => Icon(Icons.device_unknown, size: iconSize),
    };
  }
}
