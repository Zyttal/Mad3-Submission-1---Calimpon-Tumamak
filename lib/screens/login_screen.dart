import 'package:flutter/material.dart';
import 'package:gorouter_and_sessions_activity/widgets/input_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "/auth";
  static const String name = "Login Screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> formKey;
  late TextEditingController username, password;
  late FocusNode usernameFn, passwordFn;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    username = TextEditingController();
    password = TextEditingController();
    usernameFn = FocusNode();
    passwordFn = FocusNode();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    usernameFn.dispose();
    passwordFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SafeArea(
          child: Container(
              height: 60,
              margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Login"),
                style: ButtonStyle(),
              )),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputWidget(
                    focusNode: usernameFn,
                    controller: username,
                    icon: Icons.person,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputWidget(
                    focusNode: passwordFn,
                    controller: password,
                    icon: Icons.lock,
                    isPassword: true,
                    suffixIcon: Icons.remove_red_eye,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
