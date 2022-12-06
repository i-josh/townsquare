// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;
import 'package:townsquare/ui/views/auth/sign_in/sign_in.dart' as _i3;
import 'package:townsquare/ui/views/auth/sign_up/sign_up.dart' as _i4;
import 'package:townsquare/ui/views/home/home.dart' as _i2;

class Routes {
  static const home = '/';

  static const signIn = '/sign-in';

  static const signUp = '/sign-up';

  static const all = <String>{
    home,
    signIn,
    signUp,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.home,
      page: _i2.Home,
    ),
    _i1.RouteDef(
      Routes.signIn,
      page: _i3.SignIn,
    ),
    _i1.RouteDef(
      Routes.signUp,
      page: _i4.SignUp,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Home: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.Home(),
        settings: data,
      );
    },
    _i3.SignIn: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.SignIn(),
        settings: data,
      );
    },
    _i4.SignUp: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SignUp(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i5.NavigationService {
  Future<dynamic> navigateToHome([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.home,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignIn([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signIn,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUp([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUp,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
