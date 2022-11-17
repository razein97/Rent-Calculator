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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../screens/home_screen/home_view.dart' as _i2;
import '../screens/unit_details_screen/unit_details_view.dart' as _i4;
import '../screens/units_screen/units_view.dart' as _i3;
import '../start_screen.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    StartScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartScreen(),
      );
    },
    HomeView.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    UnitsView.name: (routeData) {
      final args = routeData.argsAs<UnitsViewArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.UnitsView(
          key: args.key,
          buildingID: args.buildingID,
          buildingName: args.buildingName,
        ),
      );
    },
    UnitDetailsView.name: (routeData) {
      final args = routeData.argsAs<UnitDetailsViewArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.UnitDetailsView(
          key: args.key,
          unitName: args.unitName,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          StartScreen.name,
          path: '/',
        ),
        _i5.RouteConfig(
          HomeView.name,
          path: '/home-view',
        ),
        _i5.RouteConfig(
          UnitsView.name,
          path: '/units-view',
        ),
        _i5.RouteConfig(
          UnitDetailsView.name,
          path: '/unit-details-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartScreen]
class StartScreen extends _i5.PageRouteInfo<void> {
  const StartScreen()
      : super(
          StartScreen.name,
          path: '/',
        );

  static const String name = 'StartScreen';
}

/// generated route for
/// [_i2.HomeView]
class HomeView extends _i5.PageRouteInfo<void> {
  const HomeView()
      : super(
          HomeView.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i3.UnitsView]
class UnitsView extends _i5.PageRouteInfo<UnitsViewArgs> {
  UnitsView({
    _i6.Key? key,
    required int buildingID,
    required String buildingName,
  }) : super(
          UnitsView.name,
          path: '/units-view',
          args: UnitsViewArgs(
            key: key,
            buildingID: buildingID,
            buildingName: buildingName,
          ),
        );

  static const String name = 'UnitsView';
}

class UnitsViewArgs {
  const UnitsViewArgs({
    this.key,
    required this.buildingID,
    required this.buildingName,
  });

  final _i6.Key? key;

  final int buildingID;

  final String buildingName;

  @override
  String toString() {
    return 'UnitsViewArgs{key: $key, buildingID: $buildingID, buildingName: $buildingName}';
  }
}

/// generated route for
/// [_i4.UnitDetailsView]
class UnitDetailsView extends _i5.PageRouteInfo<UnitDetailsViewArgs> {
  UnitDetailsView({
    _i6.Key? key,
    required String unitName,
  }) : super(
          UnitDetailsView.name,
          path: '/unit-details-view',
          args: UnitDetailsViewArgs(
            key: key,
            unitName: unitName,
          ),
        );

  static const String name = 'UnitDetailsView';
}

class UnitDetailsViewArgs {
  const UnitDetailsViewArgs({
    this.key,
    required this.unitName,
  });

  final _i6.Key? key;

  final String unitName;

  @override
  String toString() {
    return 'UnitDetailsViewArgs{key: $key, unitName: $unitName}';
  }
}
