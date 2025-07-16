// domain/usecases/get_songs_usecase.dart
import '../entities/song.dart';
import '../repositories/song_repository.dart';

class GetSongsUseCase {
  final SongRepository repository;
  GetSongsUseCase(this.repository);

  Future<List<Song>> call() {
    return repository.getSongs();
  }
}