import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_and_sessions_activity/controller/auth_controller.dart';
import 'package:gorouter_and_sessions_activity/enum/enum.dart';
import 'package:gorouter_and_sessions_activity/screens/home_screen.dart';
import 'package:gorouter_and_sessions_activity/screens/landing_screen.dart';
import 'package:gorouter_and_sessions_activity/screens/login_screen.dart';

class GlobalRouter {
  static void initialize() {
    GetIt.instance.registerSingleton<GlobalRouter>(GlobalRouter());
  }

  static GlobalRouter get instance => GetIt.instance<GlobalRouter>();
  static GlobalRouter get I => GetIt.instance<GlobalRouter>();

  late GoRouter router;
  late GlobalKey<NavigatorState> _rootNavigatorKey;
  late GlobalKey<NavigatorState> _shellNavigatorKey;

  FutureOr<String?> handleRedirect(
      BuildContext context, GoRouterState state) async {
    if (state.matchedLocation == LandingScreen.route) {
      if (AuthController.I.state == AuthState.authenticated) {
        return null;
      } else {
        return LoginScreen.route;
      }
    } else if (state.matchedLocation == LoginScreen.route) {
      if (AuthController.I.state == AuthState.authenticated) {
        return HomeScreen.route;
      } else {
        return null;
      }
    }

    return null;
  }

  GlobalRouter() {
    _rootNavigatorKey = GlobalKey<NavigatorState>();
    _shellNavigatorKey = GlobalKey<NavigatorState>();
    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      redirect: handleRedirect,
      refreshListenable: AuthController.I,
      initialLocation: LoginScreen.route,
      // refreshListenable: ,
      routes: [
        GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: LoginScreen.route,
            name: LoginScreen.name,
            builder: (context, _) {
              return const LoginScreen();
            })
      ],
    );
  }
}
