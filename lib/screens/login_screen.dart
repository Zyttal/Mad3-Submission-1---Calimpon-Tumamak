import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gorouter_and_sessions_activity/controller/auth_controller.dart';
import 'package:gorouter_and_sessions_activity/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "/login";
  static const String name = "Login Screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> formKey;
  late TextEditingController username, password;
  late FocusNode usernameFn, passwordFn;
  bool obscureBool = true;
  IconData currentSuffixIcon = Icons.visibility;

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

  void onSubmit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        await AuthController.I
            .login(username.text.trim(), password.text.trim());
        await AuthController.I.saveAuthState();
        Navigator.of(context).pushReplacementNamed(HomeScreen.route);
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Login Failed"),
            content: Text(e.toString()),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
        print("Login failed: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SafeArea(
          child: Container(
              height: 60,
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: ElevatedButton(
                onPressed: () {
                  onSubmit(context);
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
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: TextFormField(
                          focusNode: usernameFn,
                          controller: username,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter your text',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey),
                            prefixIcon: Icon(Icons.person),
                          ),
                          onEditingComplete: () {
                            usernameFn.unfocus();
                          },
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "A Username is required!"),
                            MinLengthValidator(4,
                                errorText:
                                    "Username needs to be at least 4 characters")
                          ]).call,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          focusNode: passwordFn,
                          controller: password,
                          obscureText: obscureBool,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter your password',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscureBool = !obscureBool;

                                    // Change suffix icon
                                    currentSuffixIcon = Icons.visibility_off;
                                  });
                                },
                                child: Icon(currentSuffixIcon),
                              )),
                          onEditingComplete: () {
                            passwordFn.unfocus();
                          },
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "A Password is required"),
                            PatternValidator(r'(?=.*?[!@#$%^&*(),.?":{}|<>])',
                                errorText:
                                    "Password must contain special characters"),
                            PatternValidator(r'(?=.*?[A-Z])',
                                errorText:
                                    "Password must contain uppercase letters"),
                            PatternValidator(r'(?=.*?[a-z])',
                                errorText:
                                    "Password must contain lowercase letters"),
                            PatternValidator(r'(?=.*?[0-9])',
                                errorText: "Password must contain numbers"),
                          ]).call,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
