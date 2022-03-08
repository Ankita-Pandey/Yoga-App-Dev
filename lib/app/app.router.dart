// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/auth/create_account/create_account_view.dart';
import '../ui/auth/login/login_view.dart';
import '../ui/auth/phoneAuth/phone_auth_view.dart';
import '../ui/bmiUi/bmiui_view.dart';
import '../ui/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String createAccountView = '/create-account-view';
  static const String phoneAuthView = '/phone-auth-view';
  static const String bmiUiView = '/bmi-ui-view';
  static const String loginView = '/login-view';
  static const all = <String>{
    startUpView,
    createAccountView,
    phoneAuthView,
    bmiUiView,
    loginView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.createAccountView, page: CreateAccountView),
    RouteDef(Routes.phoneAuthView, page: PhoneAuthView),
    RouteDef(Routes.bmiUiView, page: BmiUiView),
    RouteDef(Routes.loginView, page: LoginView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    CreateAccountView: (data) {
      var args = data.getArgs<CreateAccountViewArguments>(
        orElse: () => CreateAccountViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CreateAccountView(key: args.key),
        settings: data,
      );
    },
    PhoneAuthView: (data) {
      var args = data.getArgs<PhoneAuthViewArguments>(
        orElse: () => PhoneAuthViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => PhoneAuthView(key: args.key),
        settings: data,
      );
    },
    BmiUiView: (data) {
      var args = data.getArgs<BmiUiViewArguments>(
        orElse: () => BmiUiViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => BmiUiView(key: args.key),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CreateAccountView arguments holder class
class CreateAccountViewArguments {
  final Key? key;
  CreateAccountViewArguments({this.key});
}

/// PhoneAuthView arguments holder class
class PhoneAuthViewArguments {
  final Key? key;
  PhoneAuthViewArguments({this.key});
}

/// BmiUiView arguments holder class
class BmiUiViewArguments {
  final Key? key;
  BmiUiViewArguments({this.key});
}

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}
