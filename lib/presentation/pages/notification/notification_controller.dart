// ignore_for_file: use_setters_to_change_properties

import 'package:get/get.dart';
import 'package:test_intern/repositories/exception/notification_reponsitory.dart';

class NotificationController extends GetxController {
  NotificationRepository _notificationRepository = Get.find<NotificationRepository>();
  RxList notification = [].obs;
  @override
  void onInit() {
    getNotification();
    super.onInit();
  }

  Future<void> getNotification() async {
    await _notificationRepository.getNoti(
      '1',
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

  @override
  void onClose() {
    super.onClose();
  }
}
