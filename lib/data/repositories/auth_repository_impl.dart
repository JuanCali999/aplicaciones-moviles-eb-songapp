// data/repositories/auth_repository_impl.dart
import 'package:songapp/domain/entities/user.dart';
import 'package:songapp/domain/repositories/auth_repository.dart';
import 'package:songapp/data/datasources/auth_remote_datasource.dart';
import 'package:songapp/data/models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource datasource;
  AuthRepositoryImpl(this.datasource);

  @override
  Future<User> login(String email, String password) async {
    final userModel = await datasource.login(email, password);
    return User(
      token: userModel.token,
      firstName: userModel.firstName,
      lastName: userModel.lastName,
      email: userModel.email,
    );
  }
}