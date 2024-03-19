// To parse this JSON data, do
//
//     final projectModel = projectModelFromMap(jsonString);

import 'dart:convert';

ProjectModel projectModelFromMap(String str) => ProjectModel.fromMap(json.decode(str));

String projectModelToMap(ProjectModel data) => json.encode(data.toMap());

///CreateProjectDto
class ProjectModel {
  String? id;
  bool? isDelete;
  String? key;
  String? leader;
  List<Map<String, dynamic>>? members;
  String? name;

  ProjectModel({
    this.id,
    this.isDelete,
    this.key,
    this.leader,
    this.members,
    this.name,
  });

  ProjectModel copyWith({
    String? id,
    bool? isDelete,
    String? key,
    String? leader,
    List<Map<String, dynamic>>? members,
    String? name,
  }) =>
      ProjectModel(
        id: id ?? this.id,
        isDelete: isDelete ?? this.isDelete,
        key: key ?? this.key,
        leader: leader ?? this.leader,
        members: members ?? this.members,
        name: name ?? this.name,
      );

  factory ProjectModel.fromMap(Map<String, dynamic> json) => ProjectModel(
        id: json['_id'] != null ? json['_id'] as String : null,
        isDelete: json["isDelete"],
        key: json["key"],
        leader: json["leader"],
        members: json["members"] == null
            ? []
            : List<Map<String, dynamic>>.from(
                json["members"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "isDelete": isDelete,
        "key": key,
        "leader": leader,
        "members": members == null
            ? []
            : List<dynamic>.from(members!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "name": name,
      };
}
