import 'package:animations/animations.dart';
import 'package:estudosflutter/src/models/pokemon/pokemon.dart';
import 'package:estudosflutter/src/models/type/type.dart';
import 'package:estudosflutter/src/screens/home/widgets/card_item_widget.dart';
import 'package:estudosflutter/src/screens/home/widgets/card_item_widget_expanded.dart';
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
      url: 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png',
      color: Colors.teal,
      subcolor: Colors.teal.shade400,
      maleDescription:
          'There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.',
      femaleDescription: '',
    ),
    Pokemon(
      id: 02,
      name: 'Ivysaur',
      types: [
        TypeModel(name: 'Grass', color: Colors.green),
        TypeModel(name: 'Poison', color: Colors.purple),
      ],
      url: 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/002.png',
      color: Colors.teal,
      subcolor: Colors.teal.shade400,
      maleDescription:
          'When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.',
      femaleDescription: '',
    ),
    Pokemon(
      id: 03,
      name: 'Venusaur',
      types: [
        TypeModel(name: 'Grass', color: Colors.green),
        TypeModel(name: 'Poison', color: Colors.purple),
      ],
      url: 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/003.png',
      color: Colors.teal,
      subcolor: Colors.teal.shade400,
      maleDescription:
          'Its plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.',
      femaleDescription: '',
    ),
    Pokemon(
      id: 04,
      name: 'Charmander',
      types: [
        TypeModel(name: 'Fire', color: Colors.red),
      ],
      url: 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/004.png',
      color: Colors.red.shade700,
      subcolor: Colors.red.shade400,
      maleDescription:
          'It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail.',
      femaleDescription: '',
    ),
    Pokemon(
      id: 05,
      name: 'Charmeleon',
      types: [
        TypeModel(name: 'Fire', color: Colors.red),
        TypeModel(name: 'Dragon', color: Colors.cyan),
      ],
      url: 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/005.png',
      color: Colors.red.shade700,
      subcolor: Colors.red.shade400,
      maleDescription:
          'It has a barbaric nature. In battle, it whips its fiery tail around and slashes away with sharp claws.',
      femaleDescription: '',
    ),
    Pokemon(
      id: 06,
      name: 'Charizard',
      types: [
        TypeModel(name: 'Fire', color: Colors.red),
        TypeModel(name: 'Dragon', color: Colors.cyan),
      ],
      url: 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/006.png',
      color: Colors.red.shade700,
      subcolor: Colors.red.shade400,
      maleDescription:
          'It spits fire that is hot enough to melt boulders. It may cause forest fires by blowing flames.',
      femaleDescription: '',
    ),
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
              itemBuilder: (_, index) => OpenContainer(
                  closedBuilder: (context, action) => CardItemWidget(
                        pokemon: pokemons[index],
                      ),
                  openBuilder: (context, action) => CardItemExpandedWidget(
                        pokemon: pokemons[index],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
