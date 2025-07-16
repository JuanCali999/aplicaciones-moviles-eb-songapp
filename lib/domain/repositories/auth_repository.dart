// domain/repositories/auth_repository.dart
import 'package:songapp/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
}