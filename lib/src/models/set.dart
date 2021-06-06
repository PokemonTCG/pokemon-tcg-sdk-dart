import 'package:pokemon_tcg/src/models/images.dart';
import 'package:pokemon_tcg/src/models/legalities.dart';
import 'package:pokemon_tcg/src/type_aliases.dart';

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

  final String id;
  final String name;
  final String series;
  final int printedTotal;
  final int total;
  final SetLegalities legalities;
  final String? ptcgoCode;
  final String releaseDate;
  final String updatedAt;
  final SetImages images;
}
