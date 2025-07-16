import '../../domain/entities/comment.dart';

class CommentModel extends Comment {
  CommentModel({
    required String userName,
    required String comment,
    required int rating,
    required DateTime date,
  }) : super(
    userName: userName,
    comment: comment,
    rating: rating,
    date: date,
  );

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    userName: "${json['user']['firstName']} ${json['user']['lastName']}",
    comment: json['comment'],
    rating: json['rating'],
    date: DateTime.parse(json['date']),
  );
}