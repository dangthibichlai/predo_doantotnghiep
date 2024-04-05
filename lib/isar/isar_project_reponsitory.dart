// ignore_for_file: avoid_positional_boolean_parameters

import 'package:isar/isar.dart';
import 'package:test_intern/isar/project.dart';

class IsarProjectRepository {
  final Isar isar;

  IsarProjectRepository(this.isar);

  ///
  /// Paginate audio.
  ///
  Future<void> getAll({
    required Function(List<dynamic> record) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    try {
      // lấy 4 project đầu tiên
      final List<dynamic> _result = await isar.projects.where().limit(4).findAll();
      onSuccess(_result);
    } catch (e) {
      onError(e);
      return;
    }
  }

  Future<void> deleteProjectById({
    required int id,
    required Function(bool result) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    try {
      bool result = false;
      await isar.writeTxn(() async {
        result = await isar.projects.delete(id);
      });
      onSuccess(result);
    } catch (e) {
      print(e.toString());
      onError(e);
      return;
    }
  }

// xóa project bằng idProject
  Future<void> deleteProjectByIdProject({
    required String idProject,
    required Function(bool result) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    try {
      bool result = false;
      await isar.writeTxn(() async {
        // Thay đổi điều kiện lọc ở đây để sử dụng idProject
        var projectToDelete = await isar.projects.where().filter().idProjectEqualTo(idProject).findFirst();
        if (projectToDelete != null) {
          result = await isar.projects.delete(projectToDelete.id);
        }
      });
      onSuccess(result);
    } catch (e) {
      print(e.toString());
      onError(e);
      return;
    }
  }

  Future<void> deleteAll({
    required Function(int result) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    try {
      int result = 0;
      await isar.writeTxn(() async {
        result = await isar.projects.where().deleteAll();
      });
      onSuccess(result);
    } catch (e) {
      print(e.toString());
      onError(e);
      return;
    }
  }

  ///
  /// Paginate audio.
  ///
  Future<void> insertAndUpdate({
    required dynamic project,
    required Function(int? id) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    try {
      int? id;
      await isar.writeTxn(() async {
        id = await isar.projects.put(project); // insert & update
      });
      onSuccess(id);
    } catch (e) {
      onError(e);
      return;
    }
  }
}