// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:bloc_app/presentation/data/models/pokemon_model.dart';

enum CounterStatus { initial, loading, success, error }

class CounterState extends Equatable {
  final int counter;
  final CounterStatus status;
  final Pokemon? pokemon;

  const CounterState({
    this.counter = 0, 
    this.status = CounterStatus.initial, 
    this.pokemon
  });

  CounterState copyWith({
    int? counter,
    CounterStatus? status,
    Pokemon? pokemon,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      status: status ?? this.status,
      pokemon: pokemon ?? this.pokemon,
    );
  }

  @override
  List<Object?> get props => [counter, status, pokemon];
}
