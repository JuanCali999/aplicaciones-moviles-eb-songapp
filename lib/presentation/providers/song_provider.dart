// presentation/providers/song_provider.dart
import 'package:flutter/material.dart';
import '../../domain/entities/song.dart';
import '../../domain/usecases/get_songs_usecase.dart';

class SongProvider extends ChangeNotifier {
  final GetSongsUseCase getSongsUseCase;
  List<Song> songs = [];
  bool isLoading = false;
  String? error;

  SongProvider(this.getSongsUseCase);

  Future<void> fetchSongs() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      songs = await getSongsUseCase();
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}