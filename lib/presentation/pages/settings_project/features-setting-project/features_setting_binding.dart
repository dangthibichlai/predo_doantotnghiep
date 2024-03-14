import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/settings_project/features-setting-project/features-setting_controller.dart';

class FeaturesSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeaturesSettingController>(() => FeaturesSettingController());
  }
}
