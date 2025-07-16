import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Favoritos')),
      body: favProvider.favorites.isEmpty
          ? Center(child: Text('No hay favoritos'))
          : ListView.builder(
              itemCount: favProvider.favorites.length,
              itemBuilder: (context, index) {
                final song = favProvider.favorites[index];
                return ListTile(
                  leading: Image.network(song.image, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(song.title),
                  subtitle: Text('${song.artist} - ${song.genre}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => favProvider.removeFavorite(song),
                  ),
                );
              },
            ),
    );
  }
}