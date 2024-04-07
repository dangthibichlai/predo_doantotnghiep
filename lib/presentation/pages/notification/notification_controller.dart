// ignore_for_file: use_setters_to_change_properties

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/repositories/exception/notification_reponsitory.dart';
import 'package:test_intern/resources/export/core_export.dart';

class NotificationController extends GetxController {
  final NotificationRepository _notificationRepository = GetIt.I.get<NotificationRepository>();
  RxList notification = [].obs;
  String idUser = '';
  int _startPage = 1;
  RxBool isLoading = false.obs;

  final int _limitPage = 10;
  final RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    idUser = sl<SharedPreferenceHelper>().getIdUser;

    getNotification(isRefresh: true);
    super.onInit();
  }

  void delete() {
    // 
    EasyLoading.show(status: 'Loading...');
    _notificationRepository.delete(
        filter: '/delete-by-user',
        onSuccess: (data) {
          EasyLoading.dismiss();
          AppAlert().success(message: 'Delete_success'.tr);
          getNotification(isRefresh: true);
        },
        onError: (e) {
          EasyLoading.dismiss();
        });
  }

  Future<void> getNotification({required bool isRefresh}) async {
    if (isRefresh) {
      _startPage = 1;
      isLoading.value = true;
      notification.clear();
      refreshController.resetNoData();
    } else {
      _startPage++;
    }
    await _notificationRepository.paginate(
      idUser,
      _startPage,
      _limitPage,
      onSuccess: (data) {
        if (data.isEmpty) {
          if (isLoading.value) {
            isLoading.value = false;
          }
          refreshController.loadNoData();
          refreshController.refreshCompleted();
        } else {
          if (isRefresh) {
            refreshController.refreshCompleted();
          } else {
            refreshController.loadComplete();
          }

          notification.addAll(data);
          if (isLoading.value) {
            isLoading.value = false;
          }
        }
        print('isLoad: ${isLoading.value}');
      },
      onError: (error) {
        print(error);
      },
    );
  }

  void routeToDetailTask(String id) {
    Get.toNamed(HomeRouter.TASKDETAIL, arguments: {'idTask': id});
  }

  @override
  void onClose() {
    super.onClose();
  }
}
