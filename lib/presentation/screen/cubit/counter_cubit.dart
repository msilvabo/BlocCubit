import 'package:bloc/bloc.dart';
import 'package:bloc_app/presentation/domain/repository/poke_repository.dart';
import 'package:bloc_app/presentation/screen/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this.pokeRepository) : super(CounterInitial());

  final PokeRepository _pokeRepository;

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  Future<void> fakeGetData() async {
    // print('fakeGetData');
    try {
      emit(state.copyWith(status: CounterStatus.loading));
      await Future.delayed(Duration(milliseconds: 1000), () async {
        final pokemon = await _pokeRepository.getPokemon();
        emit(state.copyWith(counter: 10, pokemon: pokemon));
      });
      emit(state.copyWith(status: CounterStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CounterStatus.error));
    }
  }
}
