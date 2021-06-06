import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_tcg/src/models/set.dart';
import 'package:pokemon_tcg/src/type_aliases.dart';

class PokemonTcgApi {
  PokemonTcgApi({
    required this.apiKey,
  });

  final String apiKey;

  static const _baseUrl = 'https://api.pokemontcg.io/v2';
  static const _setsUrl = '$_baseUrl/sets';

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

  Future<CardSet> getSet(String setId) async {
    final response =  await http.get(
      Uri.parse('$_setsUrl/$setId'),
      headers: {
        'x-api-key': apiKey,
      },
    );

    final json = jsonDecode(response.body);
    return CardSet.fromJson(json['data']);
  }
}
