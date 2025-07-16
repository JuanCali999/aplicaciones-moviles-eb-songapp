// data/models/song_model.dart
import 'package:songapp/domain/entities/song.dart';

class SongModel extends Song {
  SongModel({
    required int id,
    required String title,
    required String artist,
    required String album,
    required int year,
    required int duration,
    required String genre,
    required double rating,
    required String image,
  }) : super(
    id: id,
    title: title,
    artist: artist,
    album: album,
    year: year,
    duration: duration,
    genre: genre,
    rating: rating,
    image: image,
  );

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
    id: json['id'],
    title: json['title'],
    artist: json['artist'],
    album: json['album'],
    year: json['year'],
    duration: json['duration'],
    genre: json['genre'],
    rating: (json['rating'] as num).toDouble(),
    image: json['image'],
  );
}