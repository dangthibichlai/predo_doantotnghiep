// ignore_for_file: invalid_use_of_protected_member

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
  TextEditingController titleTask = TextEditingController();
  TaskReponsitory _taskReponsitory = GetIt.I.get<TaskReponsitory>();
  RxList taskModel = <TaskModel>[].obs;
  String idTask = Get.arguments['idTask'];

  RxBool isLoading = true.obs;
  RxBool isEditTitle = false.obs;

  @override
  void onInit() async {
    idTask = Get.arguments['idTask'];
    await getTaskDetail();
    filterData.addAll(<String>['TO DO'.tr, 'IN PROGRESS'.tr, 'DONE'.tr]);
    dataFilter.value = filterData[0];
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateDecriptTask() {
    _taskReponsitory.update(
      id: idTask,
      data: TaskModel(
        boardId: taskModel[0].boardId,
        title: taskModel[0].title,
        key: taskModel[0].key,
        issueType: taskModel[0].issueType,
        description: decriptionTask.text,
      ),
      onSuccess: (data) async {
        await getTaskDetail();
      },
      onError: (error) {},
    );
  }

  void updateTitleTask() {
    _taskReponsitory.update(
        id: idTask,
        data: TaskModel(
          boardId: taskModel[0].boardId,
          title: titleTask.text,
          key: taskModel[0].key,
          issueType: taskModel[0].issueType,
          description: taskModel[0].description,
        ),
        onSuccess: (data) async {},
        onError: (error) {});
  }

  void showEditTitle() {
    isEditTitle.value = true;
    log('isEditTitle: ${isEditTitle.value}');
  }

  void onChangFilter({required String value}) {
    dataFilter.value = value;
  }

  Future<void> getTaskDetail() async {
    await _taskReponsitory.find(
      idTask,
      onSuccess: (data) {
        taskModel = <TaskModel>[].obs;
        taskModel.add(data);
        taskModel.refresh();
        log('Task update: $taskModel');
        decriptionTask.text = taskModel.value[0].description ?? '';
        titleTask.text = taskModel.value[0].title ?? '';
      },
      onError: (error) {},
    );
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
