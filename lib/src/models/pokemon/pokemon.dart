import 'package:estudosflutter/src/models/type/type.dart';
import 'package:flutter/cupertino.dart';

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

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.url,
    required this.color,
    required this.subcolor,
    required this.maleDescription,
    required this.femaleDescription,
    this.sex = Sex.male,
  });
}

enum Sex { male, female }
