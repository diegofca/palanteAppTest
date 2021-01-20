// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../modules/calculate_detail/ui/calculate_detail_view.dart';
import '../modules/home/ui/home_view.dart';
import '../modules/userList/ui/user_list_view.dart';

class Routes {
  static const String homeView = '/';
  static const String calculateDetailView = '/calculate-detail-view';
  static const String usersListView = '/users-list-view';
  static const all = <String>{
    homeView,
    calculateDetailView,
    usersListView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.calculateDetailView, page: CalculateDetailView),
    RouteDef(Routes.usersListView, page: UsersListView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    CalculateDetailView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CalculateDetailView(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    UsersListView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UsersListView(),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };
}
