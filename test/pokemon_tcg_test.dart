import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_tcg/src/models/card.dart';
import 'package:pokemon_tcg/src/models/set.dart';
import 'package:pokemon_tcg/src/type_aliases.dart';

void main() {
  File setsFile = File('test/data/sets.json');
  File setFile = File('test/data/set.json');
  File cardsFile = File('test/data/cards.json');
  late CardSet battleStyles;
  CardSets allSets = [];
  List<PokemonCard> cards = [];

  setUp(() async {
    final set = await setFile.readAsString();
    final sets = await setsFile.readAsString();
    final _cards = await cardsFile.readAsString();
    battleStyles = CardSet.fromJson(jsonDecode(set)['data']);

    List setsList = jsonDecode(sets)['data'];
    setsList.forEach((element) {
      allSets.add(CardSet.fromJson(element));
    });

    List cardsList = jsonDecode(_cards)['data'];
    cards.clear();
    cardsList.forEach((element) {
      cards.add(PokemonCard.fromJson(element));
    });
  });

  group('Model tests', () {
    test('Get sets', () async {
      expect(allSets.length, 122);
    });

    test('Get sets', () async {
      expect(battleStyles.id, 'swsh5');
    });
  });

  test('Cards length', () {
    expect(cards.length, 250);
  });
}
