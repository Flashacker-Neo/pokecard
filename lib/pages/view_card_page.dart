import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecard/custom/custom_icon.dart';
import 'package:pokecard/models/card_pokemon.dart';
import 'package:pokecard/styles/colors.dart';

class ViewCardPageArguments {
  CardPokemon card;
  ViewCardPageArguments(this.card);
}

class ViewCardPage extends StatefulWidget {
  @override
  _ViewCardPageState createState() => _ViewCardPageState();
}

class _ViewCardPageState extends State<ViewCardPage> {
  CardPokemon _card;

  @override
  Widget build(BuildContext context) {
    // Get CardPokemon
    final ViewCardPageArguments card =
        ModalRoute.of(context).settings.arguments;
    if (card != null) {
      _card = card.card;
    }

    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        title: Text('View card details'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: secondaryBackgroundColor,
              child: _mainWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainWidget() {
    if (_card != null) {
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                  margin: EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(color: thirdBackgroundColor),
                  child: Row(
                    children: <Widget>[
                      Text(
                        _card.name,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        '${_card.supertype} - ${_card.subtype}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: secondaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(
                width: 240,
                imageUrl: _card.imageUrlHiRes,
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ],
          ),
          _informations(),
        ],
      );
    } else {
      return Text('Nothing to show', textAlign: TextAlign.center);
    }
  }

  Widget _informations() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 24, 4, 8),
          child: Container(
            height: 2,
            color: thirdBackgroundColor,
          ),
        ),
        _dataRow('Types', _getTypesIcons()),
        _dataRow('HP',
            Text(_card.hp == 'None' ? 'N/A' : _card.hp, style: _styleData())),
        _dataRow('Weaknesses', _getWeaknesses()),
        _dataRow('Resistances', _getResistances()),
        _dataRow('Retreat cost', _getRetreatCost()),
        _dataRow(
            'Artist',
            Text(_card.artist != '' ? _card.artist : 'N/A',
                style: _styleData())),
        _dataRow(
            'Rarity',
            Text(_card.rarity != '' ? _card.rarity : 'N/A',
                style: _styleData())),
        _dataRow('Set',
            Text(_card.set != '' ? _card.set : 'N/A', style: _styleData())),
      ],
    );
  }

  Widget _getTypesIcons() {
    List<Widget> typeList = [];

    typeList.add(
      Padding(
        padding: const EdgeInsets.only(right: 4),
        child: CustomIcon.get(_card.types.length > 0 ? _card.types[0] : null),
      ),
    );

    for (int i = 1; i < _card.types.length; i++) {
      typeList.add(Padding(
        padding: const EdgeInsets.only(right: 4),
        child: CustomIcon.get(_card.types[i]),
      ));
    }

    if (_card.types.length > 0) {
      return Row(
        children: typeList,
      );
    }
    return Text(
      'N/A',
      style: _styleData(),
    );
  }

  Widget _getRetreatCost() {
    List<Widget> retreatCostList = [];

    retreatCostList.add(
      Padding(
        padding: const EdgeInsets.only(right: 4),
        child: CustomIcon.get(
            _card.retreatCost.length > 0 ? _card.retreatCost[0] : null),
      ),
    );

    for (int i = 1; i < _card.retreatCost.length; i++) {
      retreatCostList.add(Padding(
        padding: const EdgeInsets.only(right: 4),
        child: CustomIcon.get(_card.retreatCost[i]),
      ));
    }

    if (_card.retreatCost.length > 0) {
      return Row(
        children: retreatCostList,
      );
    }
    return Text(
      'N/A',
      style: _styleData(),
    );
  }

  Widget _getWeaknesses() {
    List<Widget> weaknessesList = [];

    if (_card.weaknesses != null && _card.weaknesses.length > 0) {
      for (int i = 0; i < _card.weaknesses.length; i++) {
        weaknessesList.add(Padding(
          padding: const EdgeInsets.only(right: 5),
          child: CustomIcon.get(_card.weaknesses[i].type),
        ));

        weaknessesList.add(Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            _card.weaknesses[i].value,
            style: _styleData(),
          ),
        ));
      }
      return Row(
        children: weaknessesList,
      );
    }
    return Text(
      'N/A',
      style: _styleData(),
    );
  }

  Widget _getResistances() {
    List<Widget> resistancesList = [];

    if (_card.resistances != null && _card.resistances.length > 0) {
      for (int i = 0; i < _card.resistances.length; i++) {
        resistancesList.add(Padding(
          padding: const EdgeInsets.only(right: 5),
          child: CustomIcon.get(_card.resistances[i].type),
        ));

        resistancesList.add(Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            _card.resistances[i].value,
            style: _styleData(),
          ),
        ));
      }
      return Row(
        children: resistancesList,
      );
    }
    return Text(
      'N/A',
      style: _styleData(),
    );
  }

  Widget _dataRow(String title, Widget content) {
    List<Widget> result = [];

    result.add(Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 10, 0, 10),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        Container(
          width: 12,
          height: 20,
        ),
        Expanded(flex: 2, child: content)
      ],
    ));

    result.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 2,
        color: thirdBackgroundColor,
      ),
    ));

    return Column(
      children: result,
    );
  }

  TextStyle _styleData() {
    return TextStyle(color: secondaryColor, fontSize: 16);
  }
}
