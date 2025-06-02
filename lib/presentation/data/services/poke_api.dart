import 'package:bloc_app/presentation/data/models/pokemon_model.dart';
import 'package:bloc_app/presentation/screen/cubit/parameter_cubit.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PokeApi {
  final Dio dio;
  final ParameterCubit parameterCubit;

  PokeApi(this.dio, this.parameterCubit);

  Future<Pokemon> getPokemonApi() async {
    try {
      final currentServer = parameterCubit.state.server;
      final currentApi = parameterCubit.state.api;
      final baseUrl = currentServer.isNotEmpty 
          ? currentServer 
          : 'https://pokeapi.co/api/v2/';
      
      final endpoint = currentApi.isNotEmpty
          ? currentApi
          : 'pokemon/ditto';

      print('🔧 Using server: $baseUrl');
      print('🔧 Using API endpoint: $endpoint');

      final response = await dio.get('$baseUrl$endpoint', options: Options(
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
        ));
      return Pokemon.fromJson(response.data);
    } catch (e) {
      throw Exception('Gepo Pokemon Api - error');
    }
  }
}
