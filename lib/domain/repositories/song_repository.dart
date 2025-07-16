// domain/repositories/song_repository.dart
import '../entities/song.dart';

abstract class SongRepository {
  Future<List<Song>> getSongs();
}