// To parse this JSON data, do
//
//     final BoardModel = BoardModelFromMap(jsonString);

import 'dart:convert';

import 'package:test_intern/models/task_model.dart';

BoardModel BoardModelFromMap(String str) => BoardModel.fromMap(json.decode(str));

String BoardModelToMap(BoardModel data) => json.encode(data.toMap());

///BoardModel
class BoardModel {
  String? id;
  bool? isDelete;
  List<List<String>>? label;
  String name;
  double? position;
  String projectId;
  Status? status;
  List<TaskModel>? tasks;

  BoardModel({
    this.id,
    this.isDelete,
    this.label,
    required this.name,
    this.position,
    required this.projectId,
    this.status,
    this.tasks,
  });

  BoardModel copyWith({
    String? id,
    bool? isDelete,
    List<List<String>>? label,
    String? name,
    double? position,
    String? projectId,
    Status? status,
    List<TaskModel>? tasks,
  }) =>
      BoardModel(
        id: id ?? this.id,
        isDelete: isDelete ?? this.isDelete,
        label: label ?? this.label,
        name: name ?? this.name,
        position: position ?? this.position,
        projectId: projectId ?? this.projectId,
        status: status ?? this.status,
        tasks: tasks ?? this.tasks,
      );

  factory BoardModel.fromMap(Map<String, dynamic> json) => BoardModel(
        id: json["_id"],
        isDelete: json["isDelete"],
        label: json["label"] == null
            ? []
            : List<List<String>>.from(json["label"]!.map((x) => List<String>.from(x.map((x) => x)))),
        name: json["name"],
        position: json["position"]?.toDouble(),
        projectId: json["projectId"],
        status: statusValues.map[json["status"]]!,
        tasks: json["tasks"] == null ? [] : List<TaskModel>.from(json["tasks"].map((x) => TaskModel.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "isDelete": isDelete,
        "label": label == null ? [] : List<dynamic>.from(label!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "name": name,
        "position": position,
        "projectId": projectId,
        "status": statusValues.reverse[status],
        "tasks": tasks == null ? [] : List<dynamic>.from(tasks!.map((x) => x.toJson())),
      };
}

enum Status { DONE, IN_PROGRESS, TODO }

final statusValues = EnumValues({"DONE": Status.DONE, "IN_PROGRESS": Status.IN_PROGRESS, "TODO": Status.TODO});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
