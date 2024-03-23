// ignore_for_file: use_setters_to_change_properties

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/repositories/exception/notification_reponsitory.dart';
import 'package:test_intern/resources/di_container.dart';
import 'package:test_intern/services/share_preference._helper.dart';

class NotificationController extends GetxController {
  final NotificationRepository _notificationRepository = GetIt.I.get<NotificationRepository>();
  RxList notification = [].obs;
  String idUser = '';
  @override
  void onInit() {
    idUser = sl<SharedPreferenceHelper>().getIdUser;

    getNotification();
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

  @override
  void onClose() {
    super.onClose();
  }
}
