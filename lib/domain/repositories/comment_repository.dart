import '../entities/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> getComments(int songId);
  Future<void> addComment(String token, int songId, String comment, int rating);
}