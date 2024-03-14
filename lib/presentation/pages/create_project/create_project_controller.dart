import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:slugify/slugify.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/models/project_model.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';
import 'package:test_intern/resources/export/core_export.dart';

class CreateProjectController extends GetxController {
  TextEditingController nameProjectController = TextEditingController();
  RxString keyProjectController = ''.obs;
  final ProjectReponsitory _cartRepository = GetIt.I.get<ProjectReponsitory>();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> addProject() {
    EasyLoading.show(status: 'product_detail_0011'.tr, dismissOnTap: false);
    final ProjectModel cart = ProjectModel();
    cart.name = nameProjectController.text;
    cart.key = keyProjectController.value;
   return _cartRepository.add(
      data: cart,
      onSuccess: (data) {
        AppAlert().success(message: 'Add success'.tr);
        EasyLoading.dismiss();
      },
      onError: (onError) {
        EasyLoading.dismiss();
      },
    );
  }

  void onNameFieldSubmitted(String value) {
    if (value.length > 2) {
      // Lấy 2 chữ cái đầu của chuỗi và chuyển thành chữ in hoa
      String projectKey = value.substring(0, 3).toUpperCase();
      keyProjectController.value = projectKey;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
