// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../screens/compartments_screen/compartments_view.dart' as _i3;
import '../screens/home_screen/home_view.dart' as _i2;
import '../start_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    StartScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartScreen(),
      );
    },
    HomeView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    CompartmentsView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CompartmentsView(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          StartScreen.name,
          path: '/',
        ),
        _i4.RouteConfig(
          HomeView.name,
          path: '/home-view',
        ),
        _i4.RouteConfig(
          CompartmentsView.name,
          path: '/compartments-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartScreen]
class StartScreen extends _i4.PageRouteInfo<void> {
  const StartScreen()
      : super(
          StartScreen.name,
          path: '/',
        );

  static const String name = 'StartScreen';
}

/// generated route for
/// [_i2.HomeView]
class HomeView extends _i4.PageRouteInfo<void> {
  const HomeView()
      : super(
          HomeView.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i3.CompartmentsView]
class CompartmentsView extends _i4.PageRouteInfo<void> {
  const CompartmentsView()
      : super(
          CompartmentsView.name,
          path: '/compartments-view',
        );

  static const String name = 'CompartmentsView';
}
