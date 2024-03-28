import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/login/login_controller.dart';
import 'package:test_intern/presentation/pages/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => LoginController());
  }
}
