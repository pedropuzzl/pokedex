import 'package:estudosflutter/src/models/pokemon/pokemon.dart';
import 'package:estudosflutter/src/services/graphql/graphql_helper.dart';
import 'package:estudosflutter/src/services/graphql/graqphl_pokemons.dart';
import 'package:http/http.dart' as http;

class PokedexAPI {
  GraphQLHelper _api = GraphQLHelper();

  getPokemons() async {
    var result = await _api.query(data: GraphqlPokemons.pokemons);
    List<Pokemon> list = result.data!['gen3_species']
        .map<Pokemon>((item) => Pokemon.fromJson(item))
        .toList();
  }
}
