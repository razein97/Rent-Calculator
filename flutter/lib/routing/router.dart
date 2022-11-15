import 'package:auto_route/auto_route.dart';
import 'package:rent_calculator/screens/compartments_screen/compartments_view.dart';
import 'package:rent_calculator/screens/home_screen/home_view.dart';
import 'package:rent_calculator/start_screen.dart';

// class AppRouter {
//   final GoRouter router = GoRouter(routes: <GoRoute>[
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const StartScreen(),
//     ),
//     GoRoute(
//       path: '/home',
//       builder: (context, state) => const HomeView(),
//     ),
//     GoRoute(
//       path: '/compartments',
//       builder: (context, state) => const CompartmentsView(),
//     ),
//   ]);
// }

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  MaterialRoute(page: StartScreen, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: CompartmentsView),
])
class $AppRouter {}
