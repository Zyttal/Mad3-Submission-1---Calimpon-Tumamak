import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_and_sessions_activity/screens/home_screen.dart';
import 'package:gorouter_and_sessions_activity/screens/login_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen();
      },
    )
  ],
);
