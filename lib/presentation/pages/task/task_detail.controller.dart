import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/repositories/task_repository.dart';
import 'package:test_intern/resources/export/core_export.dart';

class TaskDetailController extends GetxController {
  RxList<String> filterData = <String>[].obs;
  Rx<String> dataFilter = 'all'.tr.obs;
  TextEditingController decriptionTask = TextEditingController();
  TextEditingController commentTask = TextEditingController();
  TaskReponsitory _taskReponsitory = GetIt.I.get<TaskReponsitory>();
  TaskModel taskModel = TaskModel();

  @override
  void onInit() {
    decriptionTask.text.isEmpty ? decriptionTask.text = 'Add decription task...' : decriptionTask.text;
    filterData.addAll(<String>['TO DO'.tr, 'IN PROGRESS'.tr, 'DONE'.tr]);
    dataFilter.value = filterData[0];

    super.onInit();
  }

  void onChangFilter({required String value}) {
    dataFilter.value = value;
  }

  Future<void> getTaskDetail() async {
    await _taskReponsitory.find(
      'id',
      onError: (error) {},
      onSuccess: (data) {
        taskModel = data;
        log('Task detail: $taskModel');
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
