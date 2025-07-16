// data/repositories/song_repository_impl.dart
import 'package:songapp/domain/entities/song.dart';
import 'package:songapp/domain/repositories/song_repository.dart';
import 'package:songapp/data/datasources/song_remote_datasource.dart';

class SongRepositoryImpl implements SongRepository {
  final SongRemoteDatasource datasource;
  SongRepositoryImpl(this.datasource);

  @override
  Future<List<Song>> getSongs() async {
    return await datasource.getSongs();
  }
}