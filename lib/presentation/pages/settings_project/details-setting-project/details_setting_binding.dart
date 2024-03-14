import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/settings_project/details-setting-project/details-setting_controller.dart';

class DetailsSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsSettingController>(() => DetailsSettingController());
  }
}
