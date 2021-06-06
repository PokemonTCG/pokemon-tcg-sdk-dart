# pokemon_tcg

A Dart SDK for the Pokemon TCG Developers API. An API key is required to use.

## Usage

1. Sign up for an Pokemon TCG Developers account at https://pokemontcg.io/ and get your API key
2. Import this package
3. Initialize the API:
```Dart
final api = PokemonTcgApi(apiKey: 'your_api_key');
```
4. Use according to your needs

### Available functions:
* `getSets()`
* `getSet('set_id')` // example: 'swsh5'

## Roadmap
- [ ] `/cards`
- [ ] `/cards/:id`
- [ ] `/types`
- [ ] `/subtypes`
- [ ] `/supertypes`
- [ ] `/rarities`
