import 'package:estudosflutter/src/models/type/type.dart';

class Pokemon {
  final int id;
  final String name;
  final List<TypeModel> types;
  final String url;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.url,
  });
}
