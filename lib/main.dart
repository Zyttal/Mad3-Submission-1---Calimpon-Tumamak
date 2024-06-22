import 'package:flutter/material.dart';
import 'package:gorouter_and_sessions_activity/routes.dart';
import 'themes/theme.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.appTheme,
    );
  }
}
