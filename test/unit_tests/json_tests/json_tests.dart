import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_tcg/src/models/card.dart';
import 'package:pokemon_tcg/src/models/set.dart';

void main() {
  File setFile = File('test/data/set.json');
  File cardFile = File('test/data/card.json');
  late CardSet battleStyles;
  late PokemonCard ampharos;

  group('From JSON tests', () {
    test(
      'Construct CardSet from JSON',
      () async {
        // Arrange
        final set = await setFile.readAsString();

        // Act
        battleStyles = CardSet.fromJson(jsonDecode(set)['data']);

        // Assert
        expect(battleStyles, isNotNull);
        expect(true, battleStyles.runtimeType == CardSet);
      },
    );

    test(
      'Construct PokemonCard from JSON',
      () async {
        // Arrange
        final card = await cardFile.readAsString();

        // Act
        ampharos = PokemonCard.fromJson(jsonDecode(card)['data']);

        // Assert
        expect(ampharos, isNotNull);
        expect(true, ampharos.runtimeType == PokemonCard);
      },
    );
  });
}
