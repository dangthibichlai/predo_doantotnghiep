import 'package:isar/isar.dart';
part 'project.g.dart';

@collection
class Project {
  Id id = Isar.autoIncrement;

  String? idProject;
  bool? isDelete;
  String? key;
  String? leader;
  String? name;
  String? avatar;
  DateTime? createdAt;
  DateTime? updatedAt;

  Project({
   required this.id,
    this.idProject,
    this.isDelete,
    this.key,
    this.leader,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.avatar,
  });
}
