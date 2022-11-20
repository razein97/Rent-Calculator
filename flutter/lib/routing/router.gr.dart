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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../screens/add_tenant_screen/add_tenant_screen.dart' as _i5;
import '../screens/buildings_screen/buildings_screen.dart' as _i2;
import '../screens/unit_details_screen/unit_details_screen.dart' as _i4;
import '../screens/units_screen/units_screen.dart' as _i3;
import '../start_screen.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    StartScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartScreen(),
      );
    },
    BuildingsScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.BuildingsScreen(),
      );
    },
    UnitsScreen.name: (routeData) {
      final args = routeData.argsAs<UnitsScreenArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.UnitsScreen(
          key: args.key,
          buildingID: args.buildingID,
          buildingName: args.buildingName,
        ),
      );
    },
    UnitDetailsScreen.name: (routeData) {
      final args = routeData.argsAs<UnitDetailsScreenArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.UnitDetailsScreen(
          key: args.key,
          unitName: args.unitName,
        ),
      );
    },
    AddTenantScreen.name: (routeData) {
      final args = routeData.argsAs<AddTenantScreenArgs>();
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.AddTenantScreen(
          key: args.key,
          buildingID: args.buildingID,
          unitID: args.unitID,
          unitName: args.unitName,
          unitRent: args.unitRent,
        ),
        transitionsBuilder: _i6.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          StartScreen.name,
          path: '/',
        ),
        _i6.RouteConfig(
          BuildingsScreen.name,
          path: '/buildings-screen',
        ),
        _i6.RouteConfig(
          UnitsScreen.name,
          path: '/units-screen',
        ),
        _i6.RouteConfig(
          UnitDetailsScreen.name,
          path: '/unit-details-screen',
        ),
        _i6.RouteConfig(
          AddTenantScreen.name,
          path: '/add-tenant-screen',
        ),
      ];
}

/// generated route for
/// [_i1.StartScreen]
class StartScreen extends _i6.PageRouteInfo<void> {
  const StartScreen()
      : super(
          StartScreen.name,
          path: '/',
        );

  static const String name = 'StartScreen';
}

/// generated route for
/// [_i2.BuildingsScreen]
class BuildingsScreen extends _i6.PageRouteInfo<void> {
  const BuildingsScreen()
      : super(
          BuildingsScreen.name,
          path: '/buildings-screen',
        );

  static const String name = 'BuildingsScreen';
}

/// generated route for
/// [_i3.UnitsScreen]
class UnitsScreen extends _i6.PageRouteInfo<UnitsScreenArgs> {
  UnitsScreen({
    _i7.Key? key,
    required int buildingID,
    required String buildingName,
  }) : super(
          UnitsScreen.name,
          path: '/units-screen',
          args: UnitsScreenArgs(
            key: key,
            buildingID: buildingID,
            buildingName: buildingName,
          ),
        );

  static const String name = 'UnitsScreen';
}

class UnitsScreenArgs {
  const UnitsScreenArgs({
    this.key,
    required this.buildingID,
    required this.buildingName,
  });

  final _i7.Key? key;

  final int buildingID;

  final String buildingName;

  @override
  String toString() {
    return 'UnitsScreenArgs{key: $key, buildingID: $buildingID, buildingName: $buildingName}';
  }
}

/// generated route for
/// [_i4.UnitDetailsScreen]
class UnitDetailsScreen extends _i6.PageRouteInfo<UnitDetailsScreenArgs> {
  UnitDetailsScreen({
    _i7.Key? key,
    required String unitName,
  }) : super(
          UnitDetailsScreen.name,
          path: '/unit-details-screen',
          args: UnitDetailsScreenArgs(
            key: key,
            unitName: unitName,
          ),
        );

  static const String name = 'UnitDetailsScreen';
}

class UnitDetailsScreenArgs {
  const UnitDetailsScreenArgs({
    this.key,
    required this.unitName,
  });

  final _i7.Key? key;

  final String unitName;

  @override
  String toString() {
    return 'UnitDetailsScreenArgs{key: $key, unitName: $unitName}';
  }
}

/// generated route for
/// [_i5.AddTenantScreen]
class AddTenantScreen extends _i6.PageRouteInfo<AddTenantScreenArgs> {
  AddTenantScreen({
    _i7.Key? key,
    required int buildingID,
    required int unitID,
    required String unitName,
    required double unitRent,
  }) : super(
          AddTenantScreen.name,
          path: '/add-tenant-screen',
          args: AddTenantScreenArgs(
            key: key,
            buildingID: buildingID,
            unitID: unitID,
            unitName: unitName,
            unitRent: unitRent,
          ),
        );

  static const String name = 'AddTenantScreen';
}

class AddTenantScreenArgs {
  const AddTenantScreenArgs({
    this.key,
    required this.buildingID,
    required this.unitID,
    required this.unitName,
    required this.unitRent,
  });

  final _i7.Key? key;

  final int buildingID;

  final int unitID;

  final String unitName;

  final double unitRent;

  @override
  String toString() {
    return 'AddTenantScreenArgs{key: $key, buildingID: $buildingID, unitID: $unitID, unitName: $unitName, unitRent: $unitRent}';
  }
}
