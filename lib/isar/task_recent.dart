import 'package:isar/isar.dart';
part 'task_recent.g.dart';

@collection
class TaskRecent {
  Id id = Isar.autoIncrement;

  String? idTask;
  String? idProject;
  String? nameProject;
  String? idUser;
  String? name;
  String? description;
  String? issueType;
  String? avatarProject;

  TaskRecent({
    this.idTask,
    this.idProject,
    this.idUser,
    this.name,
    this.description,
    this.nameProject,
    this.issueType,
    this.avatarProject,
  });
}
