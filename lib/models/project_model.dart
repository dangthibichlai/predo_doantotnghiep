// To parse this JSON data, do
//
//     final projectModel = projectModelFromMap(jsonString);

import 'dart:convert';

ProjectModel projectModelFromMap(String str) => ProjectModel.fromMap(json.decode(str));

String projectModelToMap(ProjectModel data) => json.encode(data.toMap());

///CreateProjectDto
class ProjectModel {
  bool? isDelete;
  List<Map<String, dynamic>>? issueType;
  String? key;
  String? leader;
  List<Map<String, dynamic>>? members;
  String? name;

  ProjectModel({
    this.isDelete,
    this.issueType,
    this.key,
    this.leader,
    this.members,
    this.name,
  });

  ProjectModel copyWith({
    bool? isDelete,
    List<Map<String, dynamic>>? issueType,
    String? key,
    String? leader,
    List<Map<String, dynamic>>? members,
    String? name,
  }) =>
      ProjectModel(
        isDelete: isDelete ?? this.isDelete,
        issueType: issueType ?? this.issueType,
        key: key ?? this.key,
        leader: leader ?? this.leader,
        members: members ?? this.members,
        name: name ?? this.name,
      );

  factory ProjectModel.fromMap(Map<String, dynamic> json) => ProjectModel(
        isDelete: json["isDelete"],
        issueType: json["issueType"] == null
            ? []
            : List<Map<String, dynamic>>.from(
                json["issueType"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
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
        "issueType": issueType == null
            ? []
            : List<dynamic>.from(issueType!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "key": key,
        "leader": leader,
        "members": members == null
            ? []
            : List<dynamic>.from(members!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "name": name,
      };
}
