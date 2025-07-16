import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/song.dart';
import '../providers/favorites_provider.dart';
import '../providers/comment_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongDetailScreen extends StatefulWidget {
  final Song song;
  SongDetailScreen({required this.song});

  @override
  State<SongDetailScreen> createState() => _SongDetailScreenState();
}

class _SongDetailScreenState extends State<SongDetailScreen> {
  final _commentController = TextEditingController();
  int _rating = 5;

  String? _token;

  @override
  void initState() {
    super.initState();
    Provider.of<CommentProvider>(context, listen: false).fetchComments(widget.song.id);
    _loadToken();
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
    });
  }

  Widget buildCommentsSection(List comments, bool isLoading) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (comments == null || comments.isEmpty) {
      return Center(child: Text('¡Agrega tu primer comentario!'));
    }
    return Column(
      children: comments
          .where((c) => c != null)
          .map<Widget>((c) => ListTile(
        title: Text(c.userName?.toString() ?? 'Anónimo'),
        subtitle: Text(c.comment?.toString() ?? ''),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (i) => Icon(
            i < (c.rating ?? 0) ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 18,
          )),
        ),
      ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoritesProvider>(context);
    final commentProvider = Provider.of<CommentProvider>(context);

    final isFav = favProvider.isFavorite(widget.song);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.title),
        actions: [
          IconButton(
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: isFav ? Colors.red : null),
            onPressed: () {
              isFav
                  ? favProvider.removeFavorite(widget.song)
                  : favProvider.addFavorite(widget.song);
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Image.network(widget.song.image, height: 200, fit: BoxFit.cover),
          SizedBox(height: 16),
          Text(widget.song.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(widget.song.artist, style: TextStyle(fontSize: 18)),
          Text(widget.song.album),
          Text('Año: ${widget.song.year}'),
          Text('Duración: ${widget.song.duration} s'),
          Text('Género: ${widget.song.genre}'),
          Text('Calificación: ${widget.song.rating}'),
          Divider(),
          Text('Comentarios', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          buildCommentsSection(commentProvider.comments, commentProvider.isLoading),
          if (commentProvider.error != null)
            Text(commentProvider.error!, style: TextStyle(color: Colors.red)),
          Divider(),
          Text('Agregar comentario', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            controller: _commentController,
            decoration: InputDecoration(labelText: 'Comentario'),
          ),
          Row(
            children: [
              Text('Calificación:'),
              SizedBox(width: 8),
              Row(
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = index + 1;
                      });
                    },
                    splashRadius: 20,
                  );
                }),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: _token == null
                ? null
                : () async {
              await commentProvider.addComment(
                _token!,
                widget.song.id,
                _commentController.text,
                _rating,
              );
              if (commentProvider.error == null) {
                setState(() {
                  _commentController.clear();
                });
                FocusScope.of(context).unfocus();
              }
            },
            child: Text('Enviar'),
          ),
        ],
      ),
    );
  }
}