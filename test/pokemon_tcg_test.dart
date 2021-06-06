import 'package:flutter_test/flutter_test.dart';

import 'package:pokemon_tcg/pokemon_tcg.dart';

void main() {
  final api = PokemonTcgApi(apiKey: '56760a2e-f5cc-4d5d-9486-1165253e1c9b');

  test('Get sets', () async {
    final sets = await api.getSets();
    expect(sets.length, 122);
  });

  test('Get sets', () async {
    final response = await api.getSet('swsh5');
    expect(response.id, 'swsh5');
  });
}
