import 'package:flutter/foundation.dart';
import 'package:pokemon_tcg/pokemon_tcg.dart';
import 'package:pokemon_tcg/src/models/card.dart';

/// An extension of sorts on [PokemonTcgApi] that allows for paginating through
/// lists of Pokemon cards.
///
/// Usage:
/// ```dart
/// final api = PokemonTcgApi(apiKey: 'your_api_key_here');
/// late final paginatedCardsSwsh5 = PaginatedPokemonCards([], api);
///
/// await paginatedCardsAll.loadMore(); // for default page
/// await paginatedCardsAll.loadMore(page: 1); for getting cards with a specified page
/// await paginatedCardsAll.loadMoreForSet('swsh5'); for getting cards in a particular set with the default page
/// await paginatedCardsAll.loadMoreForSet('swsh5', page: 1); for getting cards in a particular set with a specified page
/// ```
class PaginatedPokemonCards with ChangeNotifier {
  PaginatedPokemonCards(this.cards, this.api);

  /// Holds the cards retrieved from the API.
  final List<PokemonCard> cards;

  /// The instance of [PokemonTcgApi] that this class should use.
  final PokemonTcgApi api;

  /// The current page in the list of cards.
  int pageNum = 0;

  /// Load cards from the "all cards" endpoint
  Future<void> loadMore({
    int page = 0,
  }) async {
    pageNum = page;
    var cards = await api.getCards(page: page);
    this.cards.addAll(cards);
    this.notifyListeners();
  }

  /// Load cards for a particular set
  Future<void> loadMoreForSet(
    String setId, {
    int page = 0,
  }) async {
    pageNum = page;
    var cards = await api.getCardsForSet(
      setId,
      page: page,
    );
    this.cards.addAll(cards);
    this.notifyListeners();
  }
}
