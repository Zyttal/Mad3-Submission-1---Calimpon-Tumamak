import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gorouter_and_sessions_activity/enum/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController with ChangeNotifier {
  static const String _authKey = 'authState';

  static void initialize() {
    GetIt.instance.registerSingleton<AuthController>(AuthController());
  }

  static AuthController get instance => GetIt.instance<AuthController>();
  static AuthController get I => GetIt.instance<AuthController>();

  AuthState _state = AuthState.unauthenticated;
  SimulatedAPI api = SimulatedAPI();

  AuthState get state => _state;

  set state(AuthState value) {
    _state = value;
    notifyListeners();
  }

  Future<bool> login(String userName, String password) async {
    bool isLoggedIn = await api.login(userName, password);
    if (isLoggedIn) {
      state = AuthState.authenticated;
    }
    return isLoggedIn;
  }

  Future<void> saveAuthState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_authKey, _state.index);

    int? savedIndex = prefs.getInt(_authKey);
    AuthState savedState =
        AuthState.values[savedIndex ?? AuthState.unauthenticated.index];
    print('Saved auth state: $_state (Index: $_authKey)');
  }

  Future<void> loadAuthState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AuthState savedState = AuthState
        .values[prefs.getInt(_authKey) ?? AuthState.unauthenticated.index];
    _state = savedState;
    notifyListeners();

    print('Loaded auth state: $_state');
  }
}

class SimulatedAPI {
  Map<String, String> users = {"testUser": "12345678Abc!"};

  Future<bool> login(String userName, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (users[userName] == null) throw Exception("User does not exist");
    if (users[userName] != password) {
      throw Exception("Password does not match!");
    }
    return users[userName] == password;
  }
}
