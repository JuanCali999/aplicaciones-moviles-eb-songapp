// presentation/providers/auth_provider.dart
import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  User? user;
  String? error;
  bool isLoading = false;

  AuthProvider(this.loginUseCase);

  Future<void> login(String email, String password) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      user = await loginUseCase(email, password);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user!.token);
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}