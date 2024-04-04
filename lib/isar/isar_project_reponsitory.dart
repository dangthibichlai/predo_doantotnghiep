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
      final List<dynamic> _result = await isar.projects.where().findAll();
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
