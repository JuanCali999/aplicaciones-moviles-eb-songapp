import 'package:flutter/material.dart';
import '../../domain/entities/song.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoritesProvider extends ChangeNotifier {
  List<Song> _favorites = [];

  List<Song> get favorites => _favorites;

  void addFavorite(Song song) {
    if (!_favorites.any((s) => s.id == song.id)) {
      _favorites.add(song);
      saveFavorites();
      notifyListeners();
    }
  }

  void removeFavorite(Song song) {
    _favorites.removeWhere((s) => s.id == song.id);
    saveFavorites();
    notifyListeners();
  }

  bool isFavorite(Song song) {
    return _favorites.any((s) => s.id == song.id);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getString('favorites');
    if (favs != null) {
      final List decoded = jsonDecode(favs);
      _favorites = decoded.map((e) => Song(
        id: e['id'],
        title: e['title'],
        artist: e['artist'],
        album: e['album'],
        year: e['year'],
        duration: e['duration'],
        genre: e['genre'],
        rating: (e['rating'] as num).toDouble(),
        image: e['image'],
      )).toList();
      notifyListeners();
    }
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('favorites', jsonEncode(_favorites.map((s) => {
      'id': s.id,
      'title': s.title,
      'artist': s.artist,
      'album': s.album,
      'year': s.year,
      'duration': s.duration,
      'genre': s.genre,
      'rating': s.rating,
      'image': s.image,
    }).toList()));
  }
}