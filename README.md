# pokemon_tcg

The official Dart SDK for the Pokemon TCG Developers API. An API key is required to use.

## Usage

1. Sign up for a Pokemon TCG Developers account at https://pokemontcg.io/ and get your API key
2. Import this package
3. Initialize the API:
```Dart
final api = PokemonTcgApi(apiKey: 'your_api_key');
```
4. Use according to your needs

### Available functions:
* `getCard('card_id')` // example 'xy7-54'
* `getSets()`
* `getSet('set_id')` // example: 'swsh5'
* `getTypes()`
* `getSubtypes()`
* `getSupertypes()`
* `getRarities()`

## Roadmap
- [X] `/sets`
- [X] `/sets/:id`
- [ ] `/cards`
- [X] `/cards/:id`
- [X] `/types`
- [X] `/subtypes`
- [X] `/supertypes`
- [X] `/rarities`
