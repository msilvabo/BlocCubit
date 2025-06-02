import 'package:bloc_app/presentation/screen/pages/counter_listener_page.dart';
import 'package:bloc_app/presentation/screen/pages/counter_page.dart';
import 'package:bloc_app/presentation/screen/pages/splash/view/splash_page.dart';
import 'package:bloc_app/presentation/screen/pages/without_copywith_page.dart';
import 'package:bloc_app/presentation/screen/screen_page.dart';
import 'package:go_router/go_router.dart';


final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const ScreenPage(),
    ),
    GoRoute(
      path: '/counter',
      builder: (context, state) => const CounterPage(),
    ),
    GoRoute(
      path: '/listener',
      builder: (context, state) => const CounterListenerPage(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/withoutCopyWith',
      builder: (context, state) => const WithoutCopywithPage(),
    ),
  ]);    