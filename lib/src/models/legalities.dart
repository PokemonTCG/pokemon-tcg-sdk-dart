import 'package:pokemon_tcg/src/type_aliases.dart';

class SetLegalities {
  SetLegalities({
    required this.unlimited,
    required this.expanded,
  });

  factory SetLegalities.fromJson(JsonMap json) {
    return SetLegalities(
      unlimited: json['unlimited'],
      expanded: json['expanded'],
    );
  }

  final String? unlimited;
  final String? expanded;
}
