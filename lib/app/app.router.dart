// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as flutterPkj;
import 'package:flutter/material.dart';
import 'package:sharing_app/ui/views/home/home_view.dart' as homePkj;
import 'package:sharing_app/ui/views/startup/startup_view.dart' as startupPkj;
import 'package:stacked/stacked.dart' as stackedPkj;
import 'package:stacked_services/stacked_services.dart' as stackedServicesPkj;

class Routes {
  static const homeView = '/home-view';
  static const startupView = '/startup-view';
  static const adduserView = '/adduser-view';

  static const all = <String>{
    homeView,
    startupView,
    adduserView,
  };
}

class StackedRouter extends stackedPkj.RouterBase {
  final _routes = <stackedPkj.RouteDef>[
    stackedPkj.RouteDef(
      Routes.homeView,
      page: homePkj.HomeView,
    ),
    stackedPkj.RouteDef(
      Routes.startupView,
      page: startupPkj.StartupView,
    ),
  ];

  final _pagesMap = <Type, stackedPkj.StackedRouteFactory>{
    homePkj.HomeView: (data) {
      return flutterPkj.MaterialPageRoute<dynamic>(
        builder: (context) => const homePkj.HomeView(),
        settings: data,
      );
    },
    startupPkj.StartupView: (data) {
      return flutterPkj.MaterialPageRoute<dynamic>(
        builder: (context) => const startupPkj.StartupView(),
        settings: data,
      );
    },
  };

  @override
  List<stackedPkj.RouteDef> get routes => _routes;

  @override
  Map<Type, stackedPkj.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on stackedServicesPkj.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
