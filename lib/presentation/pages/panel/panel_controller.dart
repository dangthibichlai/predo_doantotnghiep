// ignore_for_file: use_setters_to_change_properties

import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/repositories/task_reponsitory.dart';
import 'package:test_intern/resources/export/core_export.dart';

class PanelController extends GetxController {
  TaskReponsitory _taskReponsitory = GetIt.I.get<TaskReponsitory>();
  RxList<dynamic> allActivities = [].obs;
  RxList<TaskModel> listTask = <TaskModel>[].obs;

  String idUser = '';

  @override
  Future<void> onInit() async {
    idUser = sl<SharedPreferenceHelper>().getIdUser;
    await getTaskDetail();
    // await getNotification();
    super.onInit();
  }

  void routerToDetailTask(String idTask) {
    Get.toNamed(HomeRouter.TASKDETAIL, arguments: {'idTask': idTask});
  }

  Future<void> getTaskDetail() async {
    EasyLoading.show(status: 'loading'.tr);
    await _taskReponsitory.findTaskAssgnee(
      idUser,
      onSuccess: (data) {
        listTask.value = data;
        listTask.refresh();
        // lấy ra tất cả các activities của task
        allActivities.clear();
        for (var i = 0; i < listTask.length; i++) {
          if (listTask[i].activities != null) {
            allActivities.addAll(listTask[i].activities!.map((activity) => Activities.fromJson(activity)));
          }
        }
      },
      onError: (error) {
        print(error);
      },
    );
    EasyLoading.dismiss();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
