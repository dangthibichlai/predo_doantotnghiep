// To parse this JSON data, do
//
//     final taskModel = taskModelFromMap(jsonString);

import 'dart:convert';

TaskModel taskModelFromMap(String str) => TaskModel.fromMap(json.decode(str));

String taskModelToMap(TaskModel data) => json.encode(data.toMap());

///CreateTaskDto
class TaskModel {
  Map<String, dynamic>? activities;
  String? assignee;
  String boardId;
  String? description;
  bool? isDelete;
  IssueType issueType;
  String key;
  String? parent;
  String? title;

  TaskModel({
    this.activities,
    this.assignee,
    required this.boardId,
    this.description,
    this.isDelete,
    required this.issueType,
    required this.key,
    this.parent,
    this.title,
  });

  TaskModel copyWith({
    Map<String, dynamic>? activities,
    String? assignee,
    String? boardId,
    String? description,
    bool? isDelete,
    IssueType? issueType,
    String? key,
    String? parent,
    String? title,
  }) =>
      TaskModel(
        activities: activities ?? this.activities,
        assignee: assignee ?? this.assignee,
        boardId: boardId ?? this.boardId,
        description: description ?? this.description,
        isDelete: isDelete ?? this.isDelete,
        issueType: issueType ?? this.issueType,
        key: key ?? this.key,
        parent: parent ?? this.parent,
        title: title ?? this.title,
      );

  factory TaskModel.fromMap(Map<String, dynamic> json) => TaskModel(
        activities: Map.from(json["activities"]!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        assignee: json["assignee"],
        boardId: json["boardId"],
        description: json["description"],
        isDelete: json["isDelete"],
        issueType: issueTypeValues.map[json["issueType"]]!,
        key: json["key"],
        parent: json["parent"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "activities": Map.from(activities!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "assignee": assignee,
        "boardId": boardId,
        "description": description,
        "isDelete": isDelete,
        "issueType": issueTypeValues.reverse[issueType],
        "key": key,
        "parent": parent,
        "title": title,
      };
}

enum IssueType { BUG, EPIC, USER_STORY }

final issueTypeValues = EnumValues({"BUG": IssueType.BUG, "EPIC": IssueType.EPIC, "USER_STORY": IssueType.USER_STORY});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
