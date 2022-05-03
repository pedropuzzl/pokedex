import 'package:estudosflutter/src/models/type/type.dart';
import 'package:flutter/cupertino.dart';
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
}

enum Sex { male, female }
