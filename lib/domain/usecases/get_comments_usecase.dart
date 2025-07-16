import '../entities/comment.dart';
import '../repositories/comment_repository.dart';

class GetCommentsUseCase {
  final CommentRepository repository;
  GetCommentsUseCase(this.repository);

  Future<List<Comment>> call(int songId) {
    return repository.getComments(songId);
  }
}