// ignore_for_file: use_setters_to_change_properties

import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';

class ProjectController extends GetxController {
  final ProjectReponsitory _cartRepository = GetIt.I.get<ProjectReponsitory>();
  RxList listProject = [].obs;
  RxBool isLoading = true.obs;

  onInit() {
    getProject();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getProject() async {
    EasyLoading.show(status: 'loading'.tr);
    await _cartRepository.get(
      onSuccess: (data) {
        listProject.assignAll(data);
        listProject.refresh();
        log('listProject: ${listProject.value}');
      },
      onError: (error) {
        print(error);
      },
    );
    EasyLoading.dismiss();
  }
}
