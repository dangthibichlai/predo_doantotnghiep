// To parse this JSON data, do
//
//     final taskModel = taskModelFromMap(jsonString);

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
  String? createdAt;
  String? updatedAt;

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
    String? createdAt,
    String? updatedAt,
    IssueType? issueType,
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
      activities: json['activities'] as List<dynamic>?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
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

  Activities({
    this.description,
    this.id,
  });

  Activities copyWith({
    String? description,
    String? id,
  }) {
    return Activities(
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      '_id': id,
    };
  }

  factory Activities.fromJson(Map<String, dynamic> json) {
    return Activities(
      description: json['description'] as String?,
      id: json['_id'] as String?,
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
