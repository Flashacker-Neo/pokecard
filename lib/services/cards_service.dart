import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:pokecard/models/card_pokemon.dart';

class CardsService {
  static final String apiUrl = 'https://api.pokemontcg.io/v1/cards';

  static Future<CardPokemon> getCardById(String id) async {
    var response = await http.get(apiUrl + '/' + id);
    Map<String, dynamic> responseJSON = jsonDecode(response.body);
    CardPokemon card = CardPokemon.fromJson(responseJSON['card']);

    await DefaultCacheManager().downloadFile(card.imageUrl);

    return card;
  }

  static Future<List<CardPokemon>> getCards() async {
    var response = await http.get(apiUrl);
    Map<String, dynamic> responseJSON = jsonDecode(response.body);

    List<CardPokemon> cards = List<CardPokemon>.from(
        responseJSON['cards'].map((e) => CardPokemon.fromJson(e)).toList());

    return cards;
  }

  static Future<List<CardPokemon>> searchCardsByName(String name) async {
    var response = await http.get(apiUrl + '?name=' + name);
    Map<String, dynamic> responseJSON = jsonDecode(response.body);

    List<CardPokemon> cards = List<CardPokemon>.from(
        responseJSON['cards'].map((e) => CardPokemon.fromJson(e)).toList());

    return cards;
  }

  static Future<List<CardPokemon>> searchCardsByType(String type) async {
    var response = await http.get(apiUrl + '?types=' + type);
    Map<String, dynamic> responseJSON = jsonDecode(response.body);

    List<CardPokemon> cards = List<CardPokemon>.from(
        responseJSON['cards'].map((e) => CardPokemon.fromJson(e)).toList());

    return cards;
  }
}
