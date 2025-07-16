import '../../domain/entities/comment.dart';
import '../../domain/repositories/comment_repository.dart';
import '../datasources/comment_remote_datasource.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDatasource datasource;
  CommentRepositoryImpl(this.datasource);

  @override
  Future<List<Comment>> getComments(int songId) {
    return datasource.getComments(songId);
  }

  @override
  Future<void> addComment(String token, int songId, String comment, int rating) {
    return datasource.addComment(token: token, songId: songId, comment: comment, rating: rating);
  }
}