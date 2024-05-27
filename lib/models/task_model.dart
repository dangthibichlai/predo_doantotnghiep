// To parse this JSON data, do
//
//     final taskModel = taskModelFromMap(jsonString);

import 'package:test_intern/models/board_model.dart';
import 'package:test_intern/resources/export/core_export.dart';

///CreateTaskDto
class TaskModel {
  String? id;
  String? boardId;
  String? key;
  String? title;
  String? description;
  String? assignee;
  String? parent;
  IssueType? issueType;
  bool? isDelete;
  List<dynamic>? activities;
  DateTime? createdAt;
  DateTime? updatedAt;
  Status? status;
  DateTime? startDate;
  DateTime? endDate;

  TaskModel({
    this.id,
    this.boardId,
    this.key,
    this.title,
    this.description,
    this.assignee,
    this.parent,
    this.issueType,
    this.isDelete,
    this.activities,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.startDate,
    this.endDate,
  });

  TaskModel copyWith({
    String? id,
    String? boardId,
    String? key,
    String? title,
    String? description,
    String? assignee,
    String? parent,
    bool? isDelete,
    List<dynamic>? activities,
    DateTime? createdAt,
    DateTime? updatedAt,
    IssueType? issueType,
    Status? status,
      DateTime? startDate,
  DateTime? endDate

  }) {
    return TaskModel(
      id: id ?? this.id,
      boardId: boardId ?? this.boardId,
      key: key ?? this.key,
      title: title ?? this.title,
      description: description ?? this.description,
      assignee: assignee ?? this.assignee,
      parent: parent ?? this.parent,
      issueType: issueType ?? this.issueType,
      isDelete: isDelete ?? this.isDelete,
      activities: activities ?? this.activities,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'boardId': boardId ?? '',
      'key': key ?? '',
      'title': title ?? '',
      'description': description ?? '',
      'assignee': assignee ?? '',
      'parent': parent ?? '',
      'issueType': issueTypeValues.reverse[issueType] ?? IssueType.USER_STORY.toString(),
      'isDelete': isDelete ?? false,
      'activities': activities ?? [],
      "status": statusValues.reverse[status],
      'startDate': startDate ?? DateTime.now().toString(),
      'endDate': endDate ?? DateTime.now().toString(),


      // 'createdAt': createdAt ?? DateTime.now().toString(),
      // 'updatedAt': updatedAt ?? DateTime.now().toString(),
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['_id'] as String?,
      boardId: json['boardId'] as String?,
      key: json['key'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      assignee: json['assignee'] as String?,
      parent: json['parent'] as String?,
      issueType: issueTypeValues.map[json['issueType']],
      status: statusValues.map[json["status"]]!,
      activities: json['activities'] as List<dynamic>?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'].toString()).toLocal() : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'].toString()).toLocal() : null,
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate'].toString()).toLocal() : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate'].toString()).toLocal() : null,
      
    );
  }

  @override
  String toString() =>
      "TaskModel(id: $id,boardId: $boardId,key: $key,title: $title,description: $description,assignee: $assignee,parent: $parent,issueType: $issueType,activities: $activities,createdAt: $createdAt,updatedAt: $updatedAt)";

  @override
  int get hashCode =>
      Object.hash(id, boardId, key, title, description, assignee, parent, issueType, createdAt, updatedAt);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          boardId == other.boardId &&
          key == other.key &&
          title == other.title &&
          description == other.description &&
          assignee == other.assignee &&
          parent == other.parent &&
          issueType == other.issueType &&
          // isDelete == other.isDelete &&
          activities == other.activities &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt;
}

class Activities {
  String? description;
  String? id;
  String? userId;

  Activities({
    this.description,
    this.id,
    this.userId,
  });

  Activities copyWith({
    String? description,
    String? id,
    String? userId,
  }) {
    return Activities(
      description: description ?? this.description,
      id: id ?? this.id,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toJson() {
    return {'description': description, '_id': id, 'userId': userId};
  }

  factory Activities.fromJson(Map<String, dynamic> json) {
    return Activities(
      description: json['description'] as String?,
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
    );
  }

  @override
  String toString() => "Activities(description: $description,id: $id)";

  @override
  int get hashCode => Object.hash(description, id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Activities && runtimeType == other.runtimeType && description == other.description && id == other.id;
}

enum IssueType { BUG, EPIC, USER_STORY, SUB_TASK }

final issueTypeValues = EnumValues(
    {"BUG": IssueType.BUG, "EPIC": IssueType.EPIC, "USER_STORY": IssueType.USER_STORY, "SUB_TASK": IssueType.SUB_TASK});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

enum OptionsType { MY_OPEN_ISSUE, DONE_ISSUE, IN_PROGRESS_ISSUE, TO_DO_ISSUE, UNASSIGNED_ISSUE }

final optionValues = EnumValues({
  "MY_OPEN_ISSUES": OptionsType.MY_OPEN_ISSUE,
  "DONE_ISSUES": OptionsType.DONE_ISSUE,
  "IN_PROGRESS_ISSUES": OptionsType.IN_PROGRESS_ISSUE,
  "TO_DO_ISSUES": OptionsType.TO_DO_ISSUE,
  "UNASSIGNED_ISSUES": OptionsType.UNASSIGNED_ISSUE
});
