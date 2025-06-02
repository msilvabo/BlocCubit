import 'dart:developer';

import 'package:bloc_app/presentation/screen/cubit/counter_cubit_withoutCopywith.dart';
import 'package:bloc_app/presentation/screen/cubit/counter_state_withoutCopywith.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const WithoutCopywithPage());

class WithoutCopywithPage extends StatelessWidget {
  const WithoutCopywithPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubitWithoutcopywith>();
    counterCubit.fakeGetData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Listener - Bloc Consumer - Counter Page'),
      ),
      body:
          BlocBuilder<CounterCubitWithoutcopywith, CounterStateWithoutCopyWith>(
            builder: (context, state) {
              if (state is StateInitial) {
                return const Center(child: Text('initial'));
              }
              if (state is StateLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is StateSuccess) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Contador ${state.contador}', style: TextStyle(fontSize: 25)),
                      Text('Pokemon: Ditto', style: TextStyle(fontSize: 25)),
                      ...state.pokemon.abilities.map(
                        (e) => Text(e.ability.name),
                      ),
                    ],
                  ),
                );
              }
              if (state is StateError) {
                return Center(child: Text('Error ${state.message}'));
              }
              return const SizedBox();
            },
          ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: Icon(Icons.add),
            onPressed: () {
              counterCubit.increment();
            },
          ),
          FloatingActionButton(
            heroTag: '2',
            child: Icon(Icons.refresh),
            onPressed: () {
              counterCubit.fakeGetData();
            },
          ),
        ],
      ),
    );
  }
}
