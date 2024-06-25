import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_and_sessions_activity/controller/auth_controller.dart';
import 'package:gorouter_and_sessions_activity/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String route = '/home';
  static const String name = 'Home';

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Home",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await AuthController.I.logout();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        // Set background color based on the button state
                        if (states.contains(WidgetState.pressed)) {
                          return Colors.purple.shade500; // Color when pressed
                        } else if (states.contains(WidgetState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.purple.shade700;
                      },
                    ),
                    foregroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      },
                    ),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
