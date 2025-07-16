// domain/entities/song.dart
class Song {
  final int id;
  final String title;
  final String artist;
  final String album;
  final int year;
  final int duration;
  final String genre;
  final double rating;
  final String image;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.year,
    required this.duration,
    required this.genre,
    required this.rating,
    required this.image,
  });
}