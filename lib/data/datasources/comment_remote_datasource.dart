import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/comment_model.dart';

class CommentRemoteDatasource {
  final String baseUrl = 'https://songapp-bkbpafhnhmhwbjbs.eastus-01.azurewebsites.net/api';

  Future<List<CommentModel>> getComments(int songId) async {
    final response = await http.get(Uri.parse('$baseUrl/comments/$songId'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => CommentModel.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener comentarios');
    }
  }

  Future<void> addComment({
    required String token,
    required int songId,
    required String comment,
    required int rating,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/comments'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'songId': songId,
        'comment': comment,
        'rating': rating,
      }),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error al agregar comentario');
    }
  }
}