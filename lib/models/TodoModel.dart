// To parse this JSON data, do
//
//     final todoModel = todoModelFromMap(jsonString);

import 'dart:convert';

List<TodoModel> todoModelFromMap(String str) =>
    List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromMap(x)));

String todoModelToMap(List<TodoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class TodoModel {
  int userId;
  int id;
  String title;
  bool completed;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromMap(Map<String, dynamic> json) => TodoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
