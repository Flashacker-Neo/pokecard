import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:pokecard/custom/button.dart';
import 'package:pokecard/custom/custom_icon.dart';
import 'package:pokecard/custom/icon_button.dart';
import 'package:pokecard/models/card_pokemon.dart';
import 'package:pokecard/pages/view_card_page.dart';
import 'package:pokecard/services/cards_service.dart';
import 'package:pokecard/styles/colors.dart';

class ListCardsPage extends StatefulWidget {
  @override
  _ListCardsPageState createState() => _ListCardsPageState();
}

class _ListCardsPageState extends State<ListCardsPage> {
  TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  List<CardPokemon> _cards = [];

  @override
  void initState() {
    _getCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        title: Text('List cards'),
      ),
      body: Column(
        children: <Widget>[
          _searchBar(),
          _loadingAnimation(),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: _cards.length,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 8.0),
                    child: Card(
                      color: secondaryBackgroundColor,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget>[
                                CachedNetworkImage(
                                  height: 150,
                                  fit: BoxFit.cover,
                                  imageUrl: _cards[position].imageUrl,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            primaryColor),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    _cards[position].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 24, color: secondaryColor),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 3.0, 4.0, 0),
                                  color: thirdBackgroundColor,
                                  height: 2.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 12.0, 0, 3.0),
                                  child: Text(
                                    _getSuperAndSubType(_cards[position]),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                _getTypesIcons(_cards[position]),
                                Container(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 0, 8.0, 6.0),
                                  child: CustomButton(
                                    title: 'View card details',
                                    onPressed: () async {
                                      var result = await Navigator.pushNamed(
                                          context, '/view_card',
                                          arguments: ViewCardPageArguments(
                                              _cards[position]));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      color: secondaryBackgroundColor,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: TextField(
              controller: _searchController,
              autofocus: false,
              onEditingComplete: _searchCards,
              keyboardAppearance: Brightness.dark,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16.0),
                hintText: 'Search a pokemon...',
                hintStyle: TextStyle(color: secondaryColor),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: CustomIconButton(
                icon: Icons.search,
                onPressed: _searchCards,
              ))
        ],
      ),
    );
  }

  Widget _getTypesIcons(CardPokemon card) {
    List<Widget> typeList = [];

    typeList.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomIcon.get(card.types.length > 0 ? card.types[0] : null),
      ),
    );

    for (int i = 1; i < card.types.length; i++) {
      typeList.add(CustomIcon.get(card.types[i]));
    }
    return Row(
      children: typeList,
    );
  }

  String _getSuperAndSubType(CardPokemon card) {
    return (card.subtype.length > 1)
        ? card.supertype + ' - ' + card.subtype
        : card.supertype;
  }

  Widget _loadingAnimation() {
    if (_isLoading) {
      return CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(primaryColor),
      );
    } else if (_cards.isEmpty) {
      return Text(
        'No result found...',
        style: TextStyle(color: secondaryColor, fontSize: 16),
      );
    }
    return Container();
  }

  _getCards() async {
    setState(() {
      _isLoading = true;
    });
    _cards = await CardsService.getCards();
    setState(() {
      _isLoading = false;
    });
  }

  _searchCards() async {
    String inputText = _searchController.text;
    setState(() {
      _isLoading = true;
    });
    _cards = await CardsService.searchCardsByName(inputText);
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = false;
    });
  }
}
