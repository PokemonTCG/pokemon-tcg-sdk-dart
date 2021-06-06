import 'package:flutter/material.dart';
import 'package:pokemon_tcg/pokemon_tcg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final api = PokemonTcgApi(apiKey: '56760a2e-f5cc-4d5d-9486-1165253e1c9b');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Get set'),
              onPressed: () async {
                final response = await api.getSets();
                print(response.body);
              },
            ),
          ],
        ),
      ),
    );
  }
}
