// ignore_for_file: use_setters_to_change_properties

import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/repositories/exception/notification_reponsitory.dart';
import 'package:test_intern/repositories/task_reponsitory.dart';
import 'package:test_intern/resources/di_container.dart';
import 'package:test_intern/resources/export/core_export.dart';
import 'package:test_intern/services/share_preference._helper.dart';

class PanelController extends GetxController {
  TaskReponsitory _taskReponsitory = GetIt.I.get<TaskReponsitory>();
  final NotificationRepository _notificationRepository = GetIt.I.get<NotificationRepository>();
  RxList notification = [].obs;
  RxList<dynamic> listTask = [].obs;

  String idUser = '';

  @override
  Future<void> onInit() async {
    idUser = sl<SharedPreferenceHelper>().getIdUser;
    await getTaskDetail();
    await getNotification();
    super.onInit();
  }

  Future<void> getNotification() async {
    await _notificationRepository.getNoti(
      idUser,
      onSuccess: (data) {
        notification.addAll(data);
        notification.refresh();
        print(data);
      },
      onError: (error) {
        print(error);
      },
    );
  }

  void routerToDetailTask(String idTask) {
    Get.toNamed(HomeRouter.TASKDETAIL, arguments: {'idTask': idTask});
  }

  Future<void> getTaskDetail() async {
    await _taskReponsitory.findTaskAssgnee(
      idUser,
      filter: "?assignee=",
      onSuccess: (data) {
        listTask.assignAll(data);
        listTask.refresh();
      },
      onError: (error) {
        print(error);
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
