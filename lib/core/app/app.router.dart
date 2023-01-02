// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;
import 'package:townsquare/core/models/post.dart' as _i6;
import 'package:townsquare/ui/views/auth/sign_in/sign_in.dart' as _i3;
import 'package:townsquare/ui/views/auth/sign_up/sign_up.dart' as _i4;
import 'package:townsquare/ui/views/home/home.dart' as _i2;
import 'package:townsquare/ui/views/home/post_detail.dart' as _i5;

class Routes {
  static const home = '/';

  static const signIn = '/sign-in';

  static const signUp = '/sign-up';

  static const postDetail = '/post-detail';

  static const all = <String>{
    home,
    signIn,
    signUp,
    postDetail,
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
    _i1.RouteDef(
      Routes.postDetail,
      page: _i5.PostDetail,
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
    _i5.PostDetail: (data) {
      final args = data.getArgs<PostDetailArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i5.PostDetail(post: args.post, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PostDetailArguments {
  const PostDetailArguments({
    required this.post,
    this.key,
  });

  final _i6.Post post;

  final _i7.Key? key;
}

extension NavigatorStateExtension on _i8.NavigationService {
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

  Future<dynamic> navigateToPostDetail({
    required _i6.Post post,
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.postDetail,
        arguments: PostDetailArguments(post: post, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
