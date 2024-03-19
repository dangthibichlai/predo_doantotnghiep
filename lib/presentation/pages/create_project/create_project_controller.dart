import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:slug_it/slug_it.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/models/project_model.dart';
import 'package:test_intern/presentation/pages/project/project_controller.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';
import 'package:test_intern/resources/export/core_export.dart';
import 'package:tiengviet/tiengviet.dart';

class CreateProjectController extends GetxController {
  TextEditingController nameProjectController = TextEditingController();
  RxString keyProjectController = ''.obs;
  final ProjectReponsitory _projectRepository = GetIt.I.get<ProjectReponsitory>();
  RxBool isShowErrorr = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  bool checkInput() {
    if (nameProjectController.text.isEmpty || nameProjectController.text.length < 4) {
      isShowErrorr.value = true;
      return false;
    }
    return true;
  }

  Future<void> addProject() {
    if (!checkInput()) {
      return Future.value();
    }
    onNameFieldSubmitted(nameProjectController.text);

    EasyLoading.show(status: 'product_detail_0011'.tr, dismissOnTap: false);
    final ProjectModel project = ProjectModel();
    project.name = nameProjectController.text;
    project.key = keyProjectController.value;
    project.leader = sl<SharedPreferenceHelper>().getIdUser;
    return _projectRepository.add(
      data: project,
      onSuccess: (data) {
        Get.find<ProjectController>().getProject();
        AppAlert().success(message: 'Add success'.tr);
        EasyLoading.dismiss();
        Get.offNamed(HomeRouter.KABANPROJECT, arguments: {'idProject': data.id, 'nameProject': data.name});
      },
      onError: (onError) {
        EasyLoading.dismiss();
      },
    );
  }

  void onNameFieldSubmitted(String value) {
    keyProjectController.value = "";
    // lấy 3 ký tự đầu tiên của tên dự án
    keyProjectController.value =
        TiengViet.parse(value.substring(0, 3)).replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toUpperCase();
  }

  @override
  void onClose() {
    nameProjectController.dispose();
    Get.focusScope!.unfocus();
    super.onClose();
  }
}
