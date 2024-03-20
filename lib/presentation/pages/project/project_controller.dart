// ignore_for_file: use_setters_to_change_properties, invalid_use_of_protected_member

import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';
import 'package:test_intern/resources/di_container.dart';
import 'package:test_intern/services/share_preference._helper.dart';

class ProjectController extends GetxController {
  final ProjectReponsitory _cartRepository = GetIt.I.get<ProjectReponsitory>();
  RxList listProject = [].obs;
  RxBool isLoading = true.obs;
  String idUser = '';

  onInit() async {
    idUser = sl<SharedPreferenceHelper>().getIdUser;
    await getProject();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getProject() async {
    isLoading.value = true;
    await _cartRepository.find(
      idUser,
      onSuccess: (data) {
        listProject.value = data;
        listProject.refresh();
        log('listProject: ${listProject.value}');
        isLoading.value = false;
      },
      onError: (error) {
        print(error);
      },
    );
  }
}
