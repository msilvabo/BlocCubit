import 'package:equatable/equatable.dart';

import 'package:bloc_app/presentation/data/models/pokemon_model.dart';

enum CounterStatusWithoutCopyWith { initial, loading, success, error }

class CounterStateWithoutCopyWith extends Equatable {
  @override
  List<Object?> get props => [];
}

class StateInitial extends CounterStateWithoutCopyWith {}

class StateLoading extends CounterStateWithoutCopyWith {}

class StateSuccess extends CounterStateWithoutCopyWith {
  final Pokemon pokemon;
  final int contador;
  StateSuccess(this.pokemon, {this.contador = 10});
  @override
  List<Object?> get props => [pokemon, contador];
}

class StateError extends CounterStateWithoutCopyWith {
  final String message;
  StateError(this.message);
  @override
  List<Object?> get props => [message];
}
