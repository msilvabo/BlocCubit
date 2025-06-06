import 'package:bloc_app/presentation/data/models/pokemon_model.dart';
import 'package:bloc_app/presentation/data/services/poke_api.dart';

class PokeRepository {
  PokeRepository({PokeApi? pokeApi}) : _pokeApi = pokeApi ?? PokeApi();

  final PokeApi _pokeApi;

  Future<Pokemon> getPokemon() async {
    try {
      return await _pokeApi.getPokemonApi();
    } catch (e) {
      throw Exception(' Get Pokemon Error');
    }
  }
}
