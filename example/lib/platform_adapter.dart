import 'dart:io';

import 'package:example/apps/mac_app.dart';
import 'package:example/apps/mobile_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformAdapter extends StatelessWidget {
  const PlatformAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return MobileApp();
    }

    if (Platform.isIOS || Platform.isAndroid) {
      return MobileApp();
    }

    if (Platform.isMacOS) {
      return MacApp();
    }

    throw Exception('Unsupported platform');
  }
}
