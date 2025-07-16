// domain/entities/user.dart
class User {
  final String token;
  final String firstName;
  final String lastName;
  final String email;

  User({required this.token, required this.firstName, required this.lastName, required this.email});
}