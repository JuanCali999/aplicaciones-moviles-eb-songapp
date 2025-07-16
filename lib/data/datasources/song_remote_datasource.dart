// data/datasources/song_remote_datasource.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/song_model.dart';

class SongRemoteDatasource {
  Future<List<SongModel>> getSongs() async {
    final response = await http.get(
      Uri.parse('https://songapp-bkbpafhnhmhwbjbs.eastus-01.azurewebsites.net/api/songs'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => SongModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener canciones');
    }
  }
}