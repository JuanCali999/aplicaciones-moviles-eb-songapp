import 'package:flutter/material.dart';
import '../../domain/entities/comment.dart';
import '../../domain/usecases/get_comments_usecase.dart';
import '../../domain/usecases/add_comment_usecase.dart';

class CommentProvider extends ChangeNotifier {
  final GetCommentsUseCase getCommentsUseCase;
  final AddCommentUseCase addCommentUseCase;

  List<Comment> comments = [];
  bool isLoading = false;
  String? error;

  CommentProvider(this.getCommentsUseCase, this.addCommentUseCase);

  Future<void> fetchComments(int songId) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      comments = await getCommentsUseCase(songId);
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addComment(String token, int songId, String comment, int rating) async {
    try {
      await addCommentUseCase(token, songId, comment, rating);
      await fetchComments(songId);
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}