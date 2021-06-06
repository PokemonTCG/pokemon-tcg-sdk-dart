import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_tcg/src/models/card_type.dart';
import 'package:pokemon_tcg/src/models/elemental_type.dart';
import 'package:pokemon_tcg/src/models/set.dart';
import 'package:pokemon_tcg/src/type_aliases.dart';

class PokemonTcgApi {
  PokemonTcgApi({
    required this.apiKey,
  });

  final String apiKey;

  static const _baseUrl = 'https://api.pokemontcg.io/v2';
  static const _setsUrl = '$_baseUrl/sets';

  /// Get All Sets
  Future<CardSets> getSets() async {
    final response = await http.get(
      Uri.parse(_setsUrl),
      headers: {
        'x-api-key': apiKey,
      },
    );

    JsonMap json = jsonDecode(response.body);
    final cardSets = <CardSet>[];
    List<dynamic> sets = json['data'];
    sets.forEach((element) {
      cardSets.add(CardSet.fromJson(element));
    });
    return cardSets;
  }

  /// Returns a specific set by the set code
  Future<CardSet> getSet(String setId) async {
    final response = await http.get(
      Uri.parse('$_setsUrl/$setId'),
      headers: {
        'x-api-key': apiKey,
      },
    );

    final json = jsonDecode(response.body);
    return CardSet.fromJson(json['data']);
  }

  /// Get All Types
  Future<List<ElementalType>> getTypes() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/types'),
      headers: {
        'x-api-key': apiKey,
      },
    );

    final types = <ElementalType>[];

    final json = jsonDecode(response.body);
    json['data'].forEach((type) {
      types.add(ElementalType(type: type));
    });

    return types;
  }

  /// Get All Subtypes
  Future<List<Subtype>> getSubtypes() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/subtypes'),
      headers: {
        'x-api-key': apiKey,
      },
    );

    final types = <Subtype>[];

    final json = jsonDecode(response.body);
    json['data'].forEach((type) {
      types.add(Subtype(type: type));
    });

    return types;
  }
}
