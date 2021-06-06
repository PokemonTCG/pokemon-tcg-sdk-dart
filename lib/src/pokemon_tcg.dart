import 'package:http/http.dart' as http;

class PokemonTcgApi {
  PokemonTcgApi({
    required this.apiKey,
  });

  final String apiKey;

  static const _baseUrl = 'https://api.pokemontcg.io/v2/';
  static const _setsUrl = '$_baseUrl/sets/';

  Future<dynamic> getSets() async {
    return await http.get(
      Uri.parse(_setsUrl),
      headers: {
        'x-api-key': apiKey,
      },
    );
  }

  Future<dynamic> getSet(String setId) async {
    return await http.get(
      Uri.parse('$_setsUrl/_setId'),
      headers: {
        'x-api-key': apiKey,
      },
    );
  }
}
