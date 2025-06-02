
import 'package:bloc_app/presentation/data/models/pokemon_model.dart';
import 'package:dio/dio.dart';

class PokeApi {
  final Dio dio = Dio();
  final String server = 'https://pokeapi.co/api/v2/';
  final String endpoint = 'pokemon/ditto';

  Future<Pokemon> getPokemonApi() async {
    try {
      final response = await dio.get('$server$endpoint');
      return Pokemon.fromJson(response.data);
    } catch (e) {
      throw Exception('Gepo Pokemon Api - error');
    }
  }
}
