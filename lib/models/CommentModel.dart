// To parse this JSON data, do
//
//     final commentModel = commentModelFromMap(jsonString);

import 'dart:convert';

List<CommentModel> commentModelFromMap(String str) => List<CommentModel>.from(
    json.decode(str).map((x) => CommentModel.fromMap(x)));

String commentModelToMap(List<CommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CommentModel {
  int postId;
  int id;
  String name;
  String email;
  String body;

  CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentModel.fromMap(Map<String, dynamic> json) => CommentModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
