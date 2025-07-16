// data/datasources/auth_remote_datasource.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class AuthRemoteDatasource {
  Future<UserModel> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://songapp-bkbpafhnhmhwbjbs.eastus-01.azurewebsites.net/api/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Credenciales inválidas');
    }
  }
}