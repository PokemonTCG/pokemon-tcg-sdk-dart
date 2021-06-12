import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MacosScaffold();
  }
}