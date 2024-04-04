import 'package:isar/isar.dart';

class TaskRecent {
  Id id = Isar.autoIncrement;

  String? idTask;
  String? idProject;
  String? nameProject;
  String? idUser;
  String? name;
  String? description;
  String? status;

  TaskRecent({
    this.idTask,
    this.idProject,
    this.idUser,
    this.name,
    this.description,
    this.status,
    this.nameProject,
  });
}
