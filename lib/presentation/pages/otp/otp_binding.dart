import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/otp/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}
