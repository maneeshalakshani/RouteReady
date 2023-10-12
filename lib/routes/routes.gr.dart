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

import '../pages/fine/fine_view.dart' as _i4;
import '../pages/main/main_view.dart' as _i2;
import '../pages/scanner_detail/scanner_detail_view.dart' as _i3;
import '../pages/welcome/welcome_view.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.WelcomeView(),
      );
    },
    MainRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainView(),
      );
    },
    ScannerDetailRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ScannerDetailView(),
      );
    },
    FineRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.FineView(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          WelcomeRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          MainRoute.name,
          path: '/main-view',
        ),
        _i5.RouteConfig(
          ScannerDetailRoute.name,
          path: '/scanner-detail-view',
        ),
        _i5.RouteConfig(
          FineRoute.name,
          path: '/fine-view',
        ),
      ];
}

/// generated route for
/// [_i1.WelcomeView]
class WelcomeRoute extends _i5.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i2.MainView]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main-view',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.ScannerDetailView]
class ScannerDetailRoute extends _i5.PageRouteInfo<void> {
  const ScannerDetailRoute()
      : super(
          ScannerDetailRoute.name,
          path: '/scanner-detail-view',
        );

  static const String name = 'ScannerDetailRoute';
}

/// generated route for
/// [_i4.FineView]
class FineRoute extends _i5.PageRouteInfo<void> {
  const FineRoute()
      : super(
          FineRoute.name,
          path: '/fine-view',
        );

  static const String name = 'FineRoute';
}
