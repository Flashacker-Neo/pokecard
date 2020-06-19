import 'package:flutter/cupertino.dart';
import 'package:pokecard/pages/list_cards_page.dart';
import 'package:pokecard/pages/view_card_page.dart';

Map<String, WidgetBuilder> routes = {
  '/list_cards': (_) {
    return ListCardsPage();
  },
  '/view_card': (_) {
    return ViewCardPage();
  }
};
