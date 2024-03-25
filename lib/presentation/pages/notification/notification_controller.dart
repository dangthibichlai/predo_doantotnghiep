// ignore_for_file: use_setters_to_change_properties

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_intern/repositories/exception/notification_reponsitory.dart';
import 'package:test_intern/resources/di_container.dart';
import 'package:test_intern/resources/export/core_export.dart';
import 'package:test_intern/services/share_preference._helper.dart';

class NotificationController extends GetxController {
  final NotificationRepository _notificationRepository = GetIt.I.get<NotificationRepository>();
  RxList notification = [].obs;
  String idUser = '';
  int _startPage = 1;
  final int _limitPage = 10;
  final RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    idUser = sl<SharedPreferenceHelper>().getIdUser;

    getNotification( isRefresh: true);
    super.onInit();
  }

  Future<void> getNotification({required bool isRefresh}) async {
    if (isRefresh) {
      _startPage = 1;
      // isLoading.value = true;
      // diyModelList.clear();
      refreshController.resetNoData();
    } else {
      _startPage++;
    }
    await _notificationRepository.paginate(
      idUser,
      _startPage,
      _limitPage,
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

  void routeToDetailTask(String id) {
    Get.toNamed(HomeRouter.TASKDETAIL, arguments: {'idTask': id});
  }

  @override
  void onClose() {
    super.onClose();
  }
}
