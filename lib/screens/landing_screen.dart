import 'package:flutter/material.dart';
import 'package:gorouter_and_sessions_activity/routes.dart';
import 'package:gorouter_and_sessions_activity/screens/login_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});
  static const String route = '/';
  static const String name = "Landing Screen";
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      GlobalRouter.instance.router.go(LoginScreen.route);
    });
  }

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
