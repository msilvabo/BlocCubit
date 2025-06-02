import 'package:bloc/bloc.dart';
import 'package:bloc_app/presentation/domain/repository/poke_repository.dart';
import 'package:bloc_app/presentation/screen/cubit/counter_state_withoutCopywith.dart';
import 'package:bloc_app/presentation/data/models/pokemon_model.dart';

class CounterCubitWithoutcopywith extends Cubit<CounterStateWithoutCopyWith> {
  CounterCubitWithoutcopywith({required PokeRepository pokeRepository})
    : _pokeRepository = pokeRepository,
      super(StateLoading());

  final PokeRepository _pokeRepository;
  late Pokemon pokemon;

  void increment() {
  if (state is StateSuccess) {
    final currentState = state as StateSuccess;
    emit(StateSuccess(
      currentState.pokemon,
      contador: currentState.contador + 1,
    ));
  } else if (pokemon != null) {
    // Si hay un pokemon pero no está en StateSuccess
    emit(StateSuccess(pokemon, contador: 1));
  }
  // Si no hay pokemon ni StateSuccess, no hacemos nada
}

  Future<void> fakeGetData() async {
    // print('fakeGetData');
    try {
      final currentContador =
          state is StateSuccess ? (state as StateSuccess).contador : 10;
      emit(StateLoading());
      await Future.delayed(Duration(milliseconds: 1500), () async {
        pokemon = await _pokeRepository.getPokemon();
        emit(StateSuccess(pokemon, contador: currentContador));
      });
    } catch (e) {
      emit(StateError(e.toString()));
    }
  }
}
