class NotificationModel {
  String? id;
  String? userId;
  String? title;
  String? description;
  RefId? refId;
  bool? isDelete;
  String? createdAt;
  String? updatedAt;
  int? v;

  NotificationModel({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.refId,
    this.isDelete,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  NotificationModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    RefId? refId,
    bool? isDelete,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      refId: refId ?? this.refId,
      isDelete: isDelete ?? this.isDelete,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'refId': refId,
      'isDelete': isDelete,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      refId: json['refId'] == null ? null : RefId.fromJson(json['refId'] as Map<String, dynamic>),
      isDelete: json['isDelete'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );
  }

  @override
  String toString() =>
      "Response(id: $id,userId: $userId,title: $title,description: $description,refId: $refId,isDelete: $isDelete,createdAt: $createdAt,updatedAt: $updatedAt,v: $v)";

  @override
  int get hashCode => Object.hash(id, userId, title, description, refId, isDelete, createdAt, updatedAt, v);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          title == other.title &&
          description == other.description &&
          refId == other.refId &&
          isDelete == other.isDelete &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          v == other.v;
}

class RefId {
  String? userId;
  String? projectId;
  String? taskId;
  String? id;

  RefId({
    this.userId,
    this.projectId,
    this.taskId,
    this.id,
  });

  RefId copyWith({
    String? userId,
    String? projectId,
    String? taskId,
    String? id,
  }) {
    return RefId(
      userId: userId ?? this.userId,
      projectId: projectId ?? this.projectId,
      taskId: taskId ?? this.taskId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'projectId': projectId,
      'taskId': taskId,
      '_id': id,
    };
  }

  factory RefId.fromJson(Map<String, dynamic> json) {
    return RefId(
      userId: json['userId'] as String?,
      projectId: json['projectId'] as String?,
      taskId: json['taskId'] as String?,
      id: json['_id'] as String?,
    );
  }

  @override
  String toString() => "RefId(userId: $userId,projectId: $projectId,taskId: $taskId,id: $id)";

  @override
  int get hashCode => Object.hash(userId, projectId, taskId, id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RefId &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          projectId == other.projectId &&
          taskId == other.taskId &&
          id == other.id;
}
