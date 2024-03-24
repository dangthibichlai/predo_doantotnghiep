import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/settings_project/members-setting-project/members-setting_controller.dart';

class MembersSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MembersController>(() => MembersController());
  }
}
