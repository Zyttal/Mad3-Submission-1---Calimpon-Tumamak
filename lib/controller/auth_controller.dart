import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gorouter_and_sessions_activity/enum/enum.dart';

class AuthController with ChangeNotifier {
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
}

class SimulatedAPI {
  Map<String, String> users = {"testUser": "12345678abc!"};

  Future<bool> login(String userName, String password) async {
    // Simulating a delay in authentication
    await Future.delayed(const Duration(seconds: 2));
    if (users[userName] == null) throw Exception("User does not exist");
    if (users[userName] == password) return true;
    return false;
  }
}
