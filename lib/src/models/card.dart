import 'package:pokemon_tcg/src/models/elemental_type.dart';
import 'package:pokemon_tcg/src/models/legalities.dart';
import 'package:pokemon_tcg/src/models/set.dart';
import 'package:pokemon_tcg/src/models/subtype.dart';
import 'package:pokemon_tcg/src/models/supertype.dart';
import 'package:pokemon_tcg/src/type_aliases.dart';

class PokemonCard {
  PokemonCard({
    required this.id,
    required this.name,
    required this.supertype,
    required this.subtypes,
    required this.types,
    required this.hp,
    required this.evolvesFrom,
    required this.legalities,
    required this.rarity,
    required this.number,
    required this.artist,
    required this.convertedRetreatCost,
    required this.set,
    required this.flavorText,
    required this.nationalPokedexNumbers,
    required this.abilities,
    required this.attacks,
    required this.weaknesses,
    required this.resistances,
    required this.retreatCost,
    required this.images,
    required this.tcgPlayer,
  });

  factory PokemonCard.fromJson(JsonMap json) {
    List<Subtype> _subtypes = [];
    List<ElementalType> _types = [];
    List<int> _natDexNums = [];
    List<Ability> _abilities = [];
    List<Attack> _attacks = [];
    List<Weakness> _weaknesses = [];
    List<Resistance> _resistances = [];
    List<String> _retreatCost = [];

    if (json['subtypes'] != null) {
      json['subtypes']
          .forEach((element) => _subtypes.add(Subtype(type: element)));
    }

    if (json['types'] != null) {
      json['types']
          .forEach((element) => _types.add(ElementalType(type: element)));
    }

    if (json['nationalPokedexNumbers'] != null) {
      json['nationalPokedexNumbers']
          .forEach((element) => _natDexNums.add(element));
    }

    if (json['abilities'] != null) {
      json['abilities']
          .forEach((element) => _abilities.add(Ability.fromJson(element)));
    }

    if (json['attacks'] != null) {
      json['attacks']
          .forEach((element) => _attacks.add(Attack.fromJson(element)));
    }

    if (json['weaknesses'] != null) {
      json['weaknesses']
          .forEach((element) => _weaknesses.add(Weakness.fromJson(element)));
    }

    if (json['resistances'] != null) {
      json['resistances']
          .forEach((element) => _resistances.add(Resistance.fromJson(element)));
    }

    if (json['retreatCost'] != null) {
      json['retreatCost'].forEach((element) => _retreatCost.add(element));
    }

    return PokemonCard(
      id: json['id'],
      name: json['name'],
      supertype: Supertype(type: json['supertype']),
      subtypes: _subtypes,
      types: _types,
      hp: json['hp'],
      evolvesFrom: json['evolvesFrom'],
      set: CardSet.fromJson(json['set']),
      legalities: SetLegalities.fromJson(json['legalities']),
      convertedRetreatCost: json['convertedRetreatCost'],
      artist: json['artist'],
      number: json['number'],
      rarity: json['rarity'],
      flavorText: json['flavorText'],
      nationalPokedexNumbers: _natDexNums,
      abilities: _abilities,
      attacks: _attacks,
      weaknesses: _weaknesses,
      resistances: _resistances,
      retreatCost: _retreatCost,
      images: CardImages.fromJson(json['images']),
      tcgPlayer: json['tcgplayer'],
    );
  }

  final String id;
  final String name;
  final Supertype supertype;
  final String hp;
  final String evolvesFrom;
  final SetLegalities legalities;
  final String rarity;
  final String number;
  final String artist;
  final int convertedRetreatCost;
  final CardSet set;
  final String flavorText;
  final List<int> nationalPokedexNumbers;
  final List<ElementalType> types;
  final List<Subtype> subtypes;
  final List<Ability> abilities;
  final List<Attack> attacks;
  final List<Weakness> weaknesses;
  final List<Resistance> resistances;
  final List<String> retreatCost;
  final CardImages images;
  final dynamic tcgPlayer;
}

class Ability {
  Ability({
    required this.name,
    required this.type,
    required this.text,
  });

  factory Ability.fromJson(JsonMap json) {
    return Ability(
      name: json['name'],
      type: json['type'],
      text: json['text'],
    );
  }

  final String name;
  final String type;
  final String text;
}

class Attack {
  Attack({
    required this.name,
    required this.cost,
    required this.convertedEnergyCost,
    required this.damage,
    required this.text,
  });

  factory Attack.fromJson(JsonMap json) {
    List<String> _cost = [];

    if (json['cost'] != null) {
      json['cost'].forEach((element) => _cost.add(element));
    }

    return Attack(
      name: json['name'],
      cost: _cost,
      convertedEnergyCost: json['convertedEnergyCost'],
      damage: json['damage'],
      text: json['text'],
    );
  }

  final String name;
  final List<String> cost;
  final int convertedEnergyCost;
  final String damage;
  final String text;
}

class Weakness {
  Weakness({
    required this.type,
    required this.value,
  });

  factory Weakness.fromJson(JsonMap json) {
    return Weakness(
      type: json['type'],
      value: json['value'],
    );
  }

  final String type;
  final String value;
}

class Resistance {
  Resistance({
    required this.type,
    required this.value,
  });

  factory Resistance.fromJson(JsonMap json) {
    return Resistance(
      type: json['type'],
      value: json['value'],
    );
  }

  final String type;
  final String value;
}

class CardImages {
  CardImages({
    required this.small,
    required this.large,
  });

  factory CardImages.fromJson(JsonMap json) {
    return CardImages(
      small: json['small'],
      large: json['large'],
    );
  }

  final String small;
  final String large;
}

class TcgPlayer {}
