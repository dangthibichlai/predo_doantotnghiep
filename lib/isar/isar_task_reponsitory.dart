// ignore_for_file: avoid_positional_boolean_parameters

import 'package:isar/isar.dart';
import 'package:test_intern/isar/task_recent.dart';

class IsarTaskRepository {
  final Isar isar;

  IsarTaskRepository(this.isar);

  ///
  /// Paginate audio.
  ///
  Future<void> getAll({
    required Function(List<dynamic> record) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    try {
      // lấy  4 công việc  đầu tiên
      final List<dynamic> _result = await isar.taskRecents.where().limit(6).findAll();
      onSuccess(_result);
    } catch (e) {
      onError(e);
      return;
    }
  }

  // Future<void> deleteTaskById({
  //   required int id,
  //   required Function(bool result) onSuccess,
  //   required Function(dynamic error) onError,
  // }) async {
  //   try {
  //     bool result = false;
  //     await isar.writeTxn(() async {
  //       result = await isar.taskRecents.delete(id);
  //     });
  //     onSuccess(result);
  //   } catch (e) {
  //     print(e.toString());
  //     onError(e);
  //     return;
  //   }
  // }

// xóa taskRecents bằng idTask
  Future<void> deleteTaskByIdTask({
    required String idTask,
    required Function(bool result) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    try {
      bool result = false;
      await isar.writeTxn(() async {
        // Thay đổi điều kiện lọc ở đây để sử dụng idtaskRecents
        var taskRecentsToDelete = await isar.taskRecents.where().filter().idTaskEqualTo(idTask).findFirst();
        if (taskRecentsToDelete != null) {
          result = await isar.taskRecents.delete(taskRecentsToDelete.id);
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
        result = await isar.taskRecents.where().deleteAll();
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
    required dynamic task,
    required Function(int? id) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    try {
      int? id;
      await isar.writeTxn(() async {
        // chèn vào vị trí đầu
        id = await isar.taskRecents.put(task);
      });
      onSuccess(id);
    } catch (e) {
      onError(e);
      return;
    }
  }
}
