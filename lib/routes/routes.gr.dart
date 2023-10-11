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

import '../pages/main/main_view.dart' as _i2;
import '../pages/scanner_detail/scanner_detail_view.dart' as _i3;
import '../pages/welcome/welcome_view.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.WelcomeView(),
      );
    },
    MainRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainView(),
      );
    },
    ScannerDetailRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ScannerDetailView(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          WelcomeRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          MainRoute.name,
          path: '/main-view',
        ),
        _i4.RouteConfig(
          ScannerDetailRoute.name,
          path: '/scanner-detail-view',
        ),
      ];
}

/// generated route for
/// [_i1.WelcomeView]
class WelcomeRoute extends _i4.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i2.MainView]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main-view',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.ScannerDetailView]
class ScannerDetailRoute extends _i4.PageRouteInfo<void> {
  const ScannerDetailRoute()
      : super(
          ScannerDetailRoute.name,
          path: '/scanner-detail-view',
        );

  static const String name = 'ScannerDetailRoute';
}
