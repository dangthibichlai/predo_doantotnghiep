// ignore_for_file: use_setters_to_change_properties

import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/models/project_model.dart';
import 'package:test_intern/presentation/pages/dashboard/dashboard_controller.dart';
import 'package:test_intern/presentation/pages/project/project_controller.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';
import 'package:test_intern/resources/export/core_export.dart';

class DetailsSettingController extends GetxController {
  String nameProjectItem = Get.arguments['nameProject'];
  String idProjectItem = Get.arguments['idProject'];
  String keyProjectItem = Get.arguments['keyProject'];
  TextEditingController nameController = TextEditingController();
  TextEditingController keyController = TextEditingController();
  final ProjectReponsitory _projectRepository =
      GetIt.I.get<ProjectReponsitory>();

  RxInt avatarIndex = 0.obs;
  Color color = Color.fromRGBO(0, 0, 0, 0.75);

  @override
  void onInit() {
    nameController.text = nameProjectItem;
    keyController.text = keyProjectItem;
    super.onInit();
  }

  void changeAvatar(int index) {
    avatarIndex.value = index;
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> deleteProject(String projectId) async {
    EasyLoading.show(status: "Deleting...", dismissOnTap: false);
    await _projectRepository.delete(
        id: projectId,
        onSuccess: (data) async {
          EasyLoading.dismiss();
          Get.find<ProjectController>().onInit();
          Get.find<DashboardController>().tabIndex = 1;
          Get.offNamed(HomeRouter.DASHBOARD);
        },
        onError: (e) {
          EasyLoading.dismiss();
          AppAlert().info(message: e);

          developer.log('Error task at $e');
        });
  }

  Future<void> updateProject(String projectId, String name, String key) async {
    EasyLoading.show(status: "Updating...", dismissOnTap: false);
    await _projectRepository.update(
        id: projectId,
        data: ProjectModel(name: name, key: key),
        onSuccess: (data) async {
          EasyLoading.dismiss();
          Get.find<ProjectController>().onInit();
          Get.back();
        },
        onError: (e) {
          EasyLoading.dismiss();
          AppAlert().info(message: e);

          developer.log('Error task at $e');
        });
  }

  Color randomColorGenerator() {
    var r = new Random();
    return Color.fromRGBO(r.nextInt(256), r.nextInt(256), r.nextInt(256), 0.75);
  }
}
