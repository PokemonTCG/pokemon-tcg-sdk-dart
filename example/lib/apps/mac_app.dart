import 'package:example/apps/desktop/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class MacApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MacosApp(
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
