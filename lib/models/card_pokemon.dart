import 'package:pokecard/models/attack_model.dart';
import 'package:pokecard/models/resistances_model.dart';
import 'package:pokecard/models/weaknesses_model.dart';

class CardPokemon {
  String id;
  String name;
  String nationalPokedexNumber;
  String imageUrl;
  String imageUrlHiRes;
  List<String> types;
  String supertype;
  String subtype;
  String hp;
  List<String> retreatCost;
  String convertedRetreatCost;
  String number;
  String artist;
  String rarity;
  String series;
  String set;
  String setCode;
  List<String> text;
  List<AttackModel> attacks;
  List<WeaknessesModel> weaknesses;
  List<ResistancesModel> resistances;

  CardPokemon(
      {this.id,
      this.name,
      this.nationalPokedexNumber,
      this.imageUrl,
      this.imageUrlHiRes,
      this.types,
      this.supertype,
      this.subtype,
      this.hp,
      this.retreatCost,
      this.convertedRetreatCost,
      this.number,
      this.artist,
      this.rarity,
      this.series,
      this.set,
      this.setCode,
      this.text,
      this.attacks,
      this.weaknesses,
      this.resistances});

  factory CardPokemon.fromJson(Map<String, dynamic> json) {
    return CardPokemon(
      id: json['id'].toString(),
      name: json['name'].toString(),
      nationalPokedexNumber: json['nationalPokedexNumber'].toString(),
      imageUrl: json['imageUrl'].toString(),
      imageUrlHiRes: json['imageUrlHiRes'].toString(),
      types: json['types'] != null ? List<String>.from(json['types']) : [],
      supertype: json['supertype'].toString(),
      subtype: json['subtype'].toString(),
      hp: json['hp'].toString(),
      retreatCost: json['retreatCost'] != null
          ? List<String>.from(json['retreatCost'])
          : [],
      convertedRetreatCost: json['convertedRetreatCost'].toString(),
      number: json['number'].toString(),
      artist: json['artist'].toString(),
      rarity: json['rarity'].toString(),
      series: json['series'].toString(),
      set: json['set'].toString(),
      setCode: json['setCode'].toString(),
      text: json['text'] != null ? List<String>.from(json['text']) : [],
      attacks: json['attacks'] != null
          ? List<AttackModel>.from(json['attacks']
              .map((data) => AttackModel.fromJson(data))
              .toList())
          : [],
      weaknesses: json['weaknesses'] != null
          ? List<WeaknessesModel>.from(json['weaknesses']
              .map((data) => WeaknessesModel.fromJson(data))
              .toList())
          : [],
      resistances: json['resistances'] != null
          ? List<ResistancesModel>.from(json['resistances']
              .map((data) => ResistancesModel.fromJson(data))
              .toList())
          : [],
    );
  }

  @override
  String toString() {
    return '{id=$id, name=$name, urlImg=$imageUrl}';
  }
}
