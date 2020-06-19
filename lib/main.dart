import 'package:flutter/material.dart';
import 'package:pokecard/routes/routes.dart';
import 'package:pokecard/styles/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PokeCard',
      initialRoute: '/list_cards',
      routes: routes,
      theme: themeData,
    );
  }
}
