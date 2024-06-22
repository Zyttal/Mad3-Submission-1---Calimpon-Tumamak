import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_and_sessions_activity/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String route = '/home';

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MAD3 Submission 1",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "by Calimpon and Tumamak",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
