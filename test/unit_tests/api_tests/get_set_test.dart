import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_tcg/pokemon_tcg.dart';

class MockPokemonTcgApi extends Mock implements PokemonTcgApi {}

class MockHttpClient extends Mock implements HttpClient {}

class MockHttpResponse extends Mock implements HttpResponse {}

class MockPokemonCardSet extends Mock implements CardSet {}

void main() {
  late MockPokemonTcgApi api;
  late CardSet battleStyles;
  //MockHttpClient client;
  MockHttpResponse response;

  setUp(() {
    api = MockPokemonTcgApi();
  });

  group('Test getting a set of Pokemon Cards', () {
    test('Get BattleStyles set', () async {
      File setFile = File('test/data/set.json');
      final set = await setFile.readAsString();
      battleStyles = CardSet.fromJson(jsonDecode(set)['data']);

      when(api.getSet('swsh5').then((value) => Future.value(battleStyles.id)));
    });
  });
}
