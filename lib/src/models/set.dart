import 'package:pokemon_tcg/src/models/images.dart';
import 'package:pokemon_tcg/src/models/legalities.dart';
import 'package:pokemon_tcg/src/type_aliases.dart';

/// Defines a Pokemon TCG card set
class CardSet {
  CardSet({
    required this.id,
    required this.name,
    required this.series,
    required this.printedTotal,
    required this.total,
    required this.legalities,
    required this.ptcgoCode,
    required this.releaseDate,
    required this.updatedAt,
    required this.images,
  });

  factory CardSet.fromJson(JsonMap json) {
    return CardSet(
      id: json['id'],
      name: json['name'],
      series: json['series'],
      printedTotal: json['printedTotal'],
      total: json['total'],
      legalities: SetLegalities.fromJson(json['legalities']),
      ptcgoCode: json['ptcgoCode'],
      releaseDate: json['releaseDate'],
      updatedAt: json['updatedAt'],
      images: SetImages.fromJson(json['images']),
    );
  }

  /// The id for this set.
  ///
  /// Example: 'sm1'
  final String id;

  /// The name of this set.
  ///
  /// Example: 'Sun & Moon'
  final String name;

  /// The name of the series this set belongs to.
  ///
  /// Example: 'Sun & Moon'
  final String series;

  /// The total number of printed cards in this set.
  final int printedTotal;

  /// The total number of cards in this set.
  final int total;

  /// Play legality for this set
  final SetLegalities legalities;

  /// The code for this set in the online version of the game.
  ///
  /// Older sets may not have this code.
  ///
  /// Example: 'SUM'
  final String? ptcgoCode;

  /// The date this set was released.
  ///
  /// Example: 2017/02/03
  final String releaseDate;

  /// The date this set was last updated.
  ///
  /// Example: 2019/04/10 19:59:00
  final String updatedAt;

  /// The images for this set.
  final SetImages images;
}
