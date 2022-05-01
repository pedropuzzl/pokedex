import 'package:estudosflutter/src/models/pokemon/pokemon.dart';
import 'package:estudosflutter/src/models/type/type.dart';
import 'package:estudosflutter/src/screens/home/widgets/card_item_widget.dart';
import 'package:estudosflutter/src/screens/home/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isEnable = false;
  final List<Pokemon> pokemons = [
    Pokemon(
        id: 01,
        name: 'Bulbassaur',
        types: [
          TypeModel(name: 'Grass', color: Colors.green),
          TypeModel(name: 'Poison', color: Colors.purple),
        ],
        url:
            'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png'),
    Pokemon(
        id: 02,
        name: 'Ivysaur',
        types: [
          TypeModel(name: 'Grass', color: Colors.green),
          TypeModel(name: 'Poison', color: Colors.purple),
        ],
        url:
            'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/002.png'),
    Pokemon(
        id: 03,
        name: 'Venusaur',
        types: [
          TypeModel(name: 'Grass', color: Colors.green),
          TypeModel(name: 'Poison', color: Colors.purple),
        ],
        url:
            'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/003.png'),
    Pokemon(
        id: 04,
        name: 'Charmander',
        types: [
          TypeModel(name: 'Fire', color: Colors.red),
        ],
        url:
            'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/004.png'),
    Pokemon(
        id: 05,
        name: 'Charmeleon',
        types: [
          TypeModel(name: 'Fire', color: Colors.red),
          TypeModel(name: 'Dragon', color: Colors.cyan),
        ],
        url:
            'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/005.png'),
    Pokemon(
        id: 06,
        name: 'Charizard',
        types: [
          TypeModel(name: 'Fire', color: Colors.red),
          TypeModel(name: 'Dragon', color: Colors.cyan),
        ],
        url:
            'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/006.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: pokemons.length,
              padding: const EdgeInsets.all(0),
              itemBuilder: (_, index) => CardItemWidget(
                pokemon: pokemons[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
