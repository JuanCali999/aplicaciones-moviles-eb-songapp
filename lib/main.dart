import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:songapp/presentation/screens/main_tab_screen.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/screens/login_screen.dart';
import 'domain/usecases/login_usecase.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'presentation/providers/song_provider.dart';
import 'presentation/screens/home_screen.dart';
import 'domain/usecases/get_songs_usecase.dart';
import 'data/datasources/song_remote_datasource.dart';
import 'data/repositories/song_repository_impl.dart';
import 'presentation/providers/favorites_provider.dart';
import 'presentation/providers/comment_provider.dart';
import 'domain/usecases/get_comments_usecase.dart';
import 'domain/usecases/add_comment_usecase.dart';
import 'data/datasources/comment_remote_datasource.dart';
import 'data/repositories/comment_repository_impl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            LoginUseCase(
              AuthRepositoryImpl(
                AuthRemoteDatasource(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SongProvider(
            GetSongsUseCase(
              SongRepositoryImpl(
                SongRemoteDatasource(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()..loadFavorites()),
        ChangeNotifierProvider(
          create: (_) => CommentProvider(
            GetCommentsUseCase(
              CommentRepositoryImpl(
                CommentRemoteDatasource(),
              ),
            ),
            AddCommentUseCase(
              CommentRepositoryImpl(
                CommentRemoteDatasource(),
              ),
            ),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SongApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => MainTabScreen(),
      },
    );
  }
}