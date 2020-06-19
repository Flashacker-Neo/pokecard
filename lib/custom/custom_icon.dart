import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIcon {
  static final Map<String, String> _icons = {
    'Fire': 'assets/icons/fire.png',
    'Grass': 'assets/icons/grass.png',
    'Water': 'assets/icons/water.png',
    'Lightning': 'assets/icons/lightning.png',
    'Darkness': 'assets/icons/darkness.png',
    'Colorless': 'assets/icons/colorless.png',
    'Psychic': 'assets/icons/psychic.png',
    'Dragon': 'assets/icons/dragon.png',
    'Fighting': 'assets/icons/fighting.png',
    'Fairy': 'assets/icons/fairy.png',
    'Metal': 'assets/icons/metal.png',
  };

  static Widget get(String icon) {
    if (_icons[icon] != null) {
      return Tab(
        icon: new Image.asset(_icons[icon]),
      );
    }
    return Container(
      height: 46,
    );
  }
}
