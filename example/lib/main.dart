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
  final api = PokemonTcgApi(apiKey: 'your_api_key_here');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Get card'),
              onPressed: () async {
                final card = await api.getCard('xy7-54');
                print(card.tcgPlayer);
              },
            ),
            ElevatedButton(
              child: Text('Get set'),
              onPressed: () async {
                final set = await api.getSet('swsh5');
                print(set.id);
              },
            ),
            ElevatedButton(
              child: Text('Get sets'),
              onPressed: () async {
                final sets = await api.getSets();
                print(sets.length);
              },
            ),
            ElevatedButton(
              child: Text('Get types'),
              onPressed: () async {
                final types = await api.getTypes();
                types.forEach((element) {
                  print(element.type);
                });
              },
            ),
            ElevatedButton(
              child: Text('Get subtypes'),
              onPressed: () async {
                final types = await api.getSubtypes();
                types.forEach((element) {
                  print(element.type);
                });
              },
            ),
            ElevatedButton(
              child: Text('Get supertypes'),
              onPressed: () async {
                final types = await api.getSupertypes();
                types.forEach((element) {
                  print(element.type);
                });
              },
            ),
            ElevatedButton(
              child: Text('Get rarities'),
              onPressed: () async {
                final types = await api.getRarities();
                types.forEach((element) {
                  print(element.type);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
