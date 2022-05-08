import 'package:estudosflutter/src/models/type/type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../type/weakness.dart';

class Pokemon {
  final int id;
  final String name;
  final List<TypeModel> types;
  final String url;
  final Color color;
  final Color subcolor;
  final String maleDescription;
  final String femaleDescription;
  final Sex sex;
  final double height;
  final double weight;
  final String category;
  final String abilities;
  final List<Weak> weakness;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.url,
    required this.color,
    required this.subcolor,
    required this.maleDescription,
    required this.femaleDescription,
    required this.height,
    required this.weight,
    required this.category,
    required this.abilities,
    required this.weakness,
    this.sex = Sex.male,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json['name'],
        id: json['id'],
        types: [
          TypeModel(name: 'Grass', color: Colors.green),
          TypeModel(name: 'Poison', color: Colors.purple),
        ],
        url:
            'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png',
        color: Colors.teal,
        subcolor: Colors.teal.shade400,
        maleDescription:
            'There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.',
        femaleDescription: '',
        height: 0.7,
        abilities: 'Overgrow',
        category: 'Seed',
        weight: 6.9,
        weakness: [
          Weak(name: 'Fire', color: Colors.red),
          Weak(name: 'Psychic', color: Colors.pink),
          Weak(name: 'Flying', color: Colors.grey),
          Weak(name: 'Ice', color: Colors.cyan),
        ],
      );
}

enum Sex { male, female }
