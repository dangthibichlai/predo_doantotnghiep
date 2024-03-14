import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/change_language/change_language_controller.dart';

class ChangeLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeLanguageController>(() => ChangeLanguageController());
  }
}
