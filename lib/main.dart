import 'package:flutter/material.dart';
import 'package:gorouter_and_sessions_activity/controller/auth_controller.dart';
import 'package:gorouter_and_sessions_activity/routes.dart';
import 'themes/theme.dart';

void main() {
  AuthController.initialize();
  GlobalRouter.initialize();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GlobalRouter.I.router,
      theme: AppTheme.appTheme,
    );
  }
}
