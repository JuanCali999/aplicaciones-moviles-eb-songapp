import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:songapp/presentation/screens/song_detail_screen.dart';
import '../providers/song_provider.dart';
import '../providers/favorites_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Llama a fetchSongs al iniciar la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SongProvider>(context, listen: false).fetchSongs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final songProvider = Provider.of<SongProvider>(context);
    final favProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Canciones')),
      body: songProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : songProvider.error != null
          ? Center(child: Text(songProvider.error!))
          : ListView.builder(
              itemCount: songProvider.songs.length,
              itemBuilder: (context, index) {
                final song = songProvider.songs[index];
                final isFav = favProvider.isFavorite(song);
                return ListTile(
                  leading: Image.network(
                    song.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(song.title),
                  subtitle: Text('${song.artist} - ${song.album}'),
                  trailing: IconButton(
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : null,
                    ),
                    onPressed: () {
                      isFav
                          ? favProvider.removeFavorite(song)
                          : favProvider.addFavorite(song);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SongDetailScreen(song: song),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => songProvider.fetchSongs(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
