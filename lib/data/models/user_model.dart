// data/models/user_model.dart
class UserModel {
  final String token;
  final String firstName;
  final String lastName;
  final String email;

  UserModel({required this.token, required this.firstName, required this.lastName, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    token: json['token'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    email: json['email'],
  );
}