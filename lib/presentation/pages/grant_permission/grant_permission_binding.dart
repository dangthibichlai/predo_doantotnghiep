import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/grant_permission/grant_permission_controller.dart';

class GrantPermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GrantPermissionController>(() => GrantPermissionController());
  }
}
