import 'package:auto_route/auto_route.dart';
import 'package:rent_calculator/screens/add_tenant_screen/add_tenant_screen.dart';
import 'package:rent_calculator/screens/buildings_screen/buildings_screen.dart';
import 'package:rent_calculator/screens/unit_details_screen/unit_details_screen.dart';
import 'package:rent_calculator/screens/units_screen/units_screen.dart';
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
  MaterialRoute(page: BuildingsScreen),
  MaterialRoute(page: UnitsScreen),
  MaterialRoute(page: UnitDetailsScreen),
  CustomRoute(
      page: AddTenantScreen,
      transitionsBuilder: TransitionsBuilders.slideBottom),
])
class $AppRouter {}
