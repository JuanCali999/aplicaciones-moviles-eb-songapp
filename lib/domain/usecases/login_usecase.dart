// domain/usecases/login_usecase.dart
import 'package:songapp/domain/entities/user.dart';
import 'package:songapp/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<User> call(String email, String password) {
    return repository.login(email, password);
  }
}