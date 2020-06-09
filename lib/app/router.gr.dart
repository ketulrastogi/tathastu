// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tathastu/ui/views/auth_router/auth_router_view.dart';
import 'package:tathastu/ui/views/login/verifyphone/verifyphone_view.dart';
import 'package:tathastu/ui/views/login/verifysmscode/verifysmscode_view.dart';
import 'package:tathastu/ui/views/home/home_view.dart';
import 'package:tathastu/ui/views/user_registration/user_registration_view.dart';

abstract class Routes {
  static const authRouterView = '/';
  static const verifyPhoneView = '/verify-phone-view';
  static const verifySmsCodeView = '/verify-sms-code-view';
  static const homeView = '/home-view';
  static const userRegistrationView = '/user-registration-view';
  static const all = {
    authRouterView,
    verifyPhoneView,
    verifySmsCodeView,
    homeView,
    userRegistrationView,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.authRouterView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AuthRouterView(),
          settings: settings,
        );
      case Routes.verifyPhoneView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => VerifyPhoneView(),
          settings: settings,
        );
      case Routes.verifySmsCodeView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => VerifySmsCodeView(),
          settings: settings,
        );
      case Routes.homeView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.userRegistrationView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => UserRegistrationView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
