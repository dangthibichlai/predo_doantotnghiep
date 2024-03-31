// To parse this JSON data, do
//
//     final commentModel = commentModelFromMap(jsonString);

import 'dart:convert';

CommentModel commentModelFromMap(String str) => CommentModel.fromMap(json.decode(str));

String commentModelToMap(CommentModel data) => json.encode(data.toMap());

///CreateCommentDto
class CommentModel {
  String content;
  List<String>? emote;
  bool? isDelete;
  List<String>? mention;
  String? reply;
  String? taskId;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  CommentModel({
    required this.content,
    this.emote,
    this.isDelete,
    this.mention,
    this.reply,
    this.taskId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  CommentModel copyWith({
    String? content,
    List<String>? emote,
    bool? isDelete,
    List<String>? mention,
    String? reply,
    String? taskId,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CommentModel(
        content: content ?? this.content,
        emote: emote ?? this.emote,
        isDelete: isDelete ?? this.isDelete,
        mention: mention ?? this.mention,
        reply: reply ?? this.reply,
        taskId: taskId ?? this.taskId,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CommentModel.fromMap(Map<String, dynamic> json) => CommentModel(
        content: json["content"],
        emote: json["emote"] == null ? [] : List<String>.from(json["emote"]!.map((x) => x)),
        isDelete: json["isDelete"],
        mention: json["mention"] == null ? [] : List<String>.from(json["mention"]!.map((x) => x)),
        reply: json["reply"],
        taskId: json["taskId"],
        userId: json["userId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "content": content,
        "emote": emote == null ? [] : List<dynamic>.from(emote!.map((x) => x)),
        "isDelete": isDelete,
        "mention": mention == null ? [] : List<dynamic>.from(mention!.map((x) => x)),
        "reply": reply,
        "taskId": taskId,
        "userId": userId,
      };
}
