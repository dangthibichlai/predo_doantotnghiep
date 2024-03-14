// ignore_for_file: use_setters_to_change_properties

import 'dart:math';

import 'package:test_intern/resources/export/core_export.dart';

class DetailsSettingController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController keyController = TextEditingController();
  RxInt avatarIndex = 0.obs;
  Color color = Color.fromRGBO(0, 0, 0, 0.75);

  @override
  void onInit() {
    nameController.text = 'Test';
    keyController.text = 'Test';
    super.onInit();
  }

  void changeAvatar(int index) {
    avatarIndex.value = index;
  }

  @override
  void onClose() {
    super.onClose();
  }

  Color randomColorGenerator() {
    var r = new Random();
    return Color.fromRGBO(r.nextInt(256), r.nextInt(256), r.nextInt(256), 0.75);
  }
}
