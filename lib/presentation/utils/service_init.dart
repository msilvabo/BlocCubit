
import 'package:bloc_app/presentation/domain/repository/poke_repository.dart';
import 'package:bloc_app/presentation/screen/cubit/counter_cubit.dart';
import 'package:bloc_app/presentation/screen/cubit/counter_cubit_withoutCopywith.dart';
import 'package:bloc_app/presentation/screen/pages/splash/splash_state.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceInit(){
  getIt.registerSingleton(CounterCubit(pokeRepository: PokeRepository()));
  getIt.registerSingleton(CounterCubitWithoutcopywith(pokeRepository: PokeRepository()));
  getIt.registerSingleton(SplashCubit());
}