import 'package:bloc_app/presentation/screen/cubit/counter_cubit.dart';
import 'package:bloc_app/presentation/screen/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const CounterPage());

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
    counterCubit.fakeGetData();
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          switch (state.status) {
            case CounterStatus.initial:
              return Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('initial'),
                  SizedBox(height: 15),
                  Text(
                      'Contador -- ${counterCubit.state.counter}',
                      style: TextStyle(fontSize: 35),
                    ),
                ],
              ));
            case CounterStatus.loading:
              return Center(child: CircularProgressIndicator());
            case CounterStatus.success:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Contador -- ${counterCubit.state.counter}',
                      style: TextStyle(fontSize: 35),
                    ),
                  ],
                ),
              );
            case CounterStatus.error:
              return Center(child: Text('Error'));
          }
        },
      ),
      floatingActionButton: 
        Column(
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
