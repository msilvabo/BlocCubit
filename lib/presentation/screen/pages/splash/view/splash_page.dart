
import 'package:bloc_app/presentation/screen/pages/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashCubit>().success();

    return Scaffold(
      appBar: AppBar(title: const Text('Cubit - Splash ')),
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.status == SplashStatus.success) {
            context.go('/listener');
            context.read<SplashCubit>().init();
          }
        },
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(Icons.airplane_ticket, size: 120),
              Text('Redireccionando'),
              CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SplashCubit>().success();
        },
      ),
    );
  }
}
