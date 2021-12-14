import 'dart:convert';

import 'package:blog_app/model/user.dart';

class Comment {
  final String id;
  final String articleId;
  final User user;
  final String body;
  Comment({
    required this.id,
    required this.articleId,
    required this.user,
    required this.body,
  });

  Comment copyWith({
    String? id,
    String? articleId,
    User? user,
    String? body,
  }) {
    return Comment(
      id: id ?? this.id,
      articleId: articleId ?? this.articleId,
      user: user ?? this.user,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'articleId': articleId,
      'user': user.toMap(),
      'body': body,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'] ?? '',
      articleId: map['articleId'] ?? '',
      user: User.fromMap(map['user']),
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comment(id: $id, articleId: $articleId, user: $user, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Comment &&
        other.id == id &&
        other.articleId == articleId &&
        other.user == user &&
        other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^ articleId.hashCode ^ user.hashCode ^ body.hashCode;
  }
}
