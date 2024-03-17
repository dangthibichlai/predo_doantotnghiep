import 'package:get/get.dart';
//import 'package:template/presentation/pages/introduction/introduction_controller.dart';
import 'package:test_intern/presentation/pages/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
