import '../repositories/comment_repository.dart';

class AddCommentUseCase {
  final CommentRepository repository;
  AddCommentUseCase(this.repository);

  Future<void> call(String token, int songId, String comment, int rating) {
    return repository.addComment(token, songId, comment, rating);
  }
}