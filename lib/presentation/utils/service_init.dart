import 'package:bloc_app/presentation/data/services/poke_api.dart';
import 'package:bloc_app/presentation/domain/repository/poke_repository.dart';
import 'package:bloc_app/presentation/screen/cubit/counter_cubit.dart';
import 'package:bloc_app/presentation/screen/cubit/counter_cubit_withoutCopywith.dart';
import 'package:bloc_app/presentation/screen/cubit/parameter_cubit.dart';
import 'package:bloc_app/presentation/screen/cubit/parameter_state.dart';
import 'package:bloc_app/presentation/screen/pages/splash/splash_state.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

abstract class AppModule {
  @singleton
  Dio get dio => Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  @singleton
  PokeApi get pokeApi => PokeApi(getIt<Dio>());

  @singleton
  PokeRepository get pokeRepository => PokeRepository(getIt<PokeApi>());

  @singleton
  ParameterCubit get parameterCubit => ParameterCubit(ParameterState());
  
  @singleton
  CounterCubit get counterCubit => CounterCubit(
    getIt<PokeRepository>(),
    getIt<ParameterCubit>(),
  );


  void registerManualDependencies() {
  // Ejemplo: Si necesitaras registrar algo manualmente
  // getIt.registerFactory<MiClase>(() => MiClase());
}
}

// void serviceInit() {
//   getIt.registerSingleton(CounterCubit(pokeRepository: PokeRepository()));
//   getIt.registerSingleton(
//     CounterCubitWithoutcopywith(pokeRepository: PokeRepository()),
//   );
//   getIt.registerSingleton(SplashCubit());
// }
