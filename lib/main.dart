import 'package:bloc_app/presentation/screen/cubit/counter_cubit.dart';
import 'package:bloc_app/presentation/screen/cubit/counter_cubit_withoutCopywith.dart';
import 'package:bloc_app/presentation/screen/pages/splash/splash_state.dart';
import 'package:bloc_app/presentation/utils/service_init.dart';
import 'package:bloc_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  serviceInit();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CounterCubit>(), lazy: false),
        BlocProvider(create: (context) => getIt<CounterCubitWithoutcopywith>(), lazy: false),
        BlocProvider(create: (context) => getIt<SplashCubit>(), lazy: false),
      ],
      child: const MainApp(),
    );
  }
}        

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   body: Center(
      //     child: Text('Hello World!'),
      //   ),
      // ),
    );
  }
}
