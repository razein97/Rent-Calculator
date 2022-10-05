import 'package:go_router/go_router.dart';
import 'package:rent_calculator/screens/home_screen/home_view.dart';
import 'package:rent_calculator/startscreen.dart';

class AppRouter {
  final GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const StartScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeView(),
    ),
  ]);
}
