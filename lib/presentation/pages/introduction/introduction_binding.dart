import 'package:get/get.dart';
//import 'package:template/presentation/pages/introduction/introduction_controller.dart';
import 'package:test_intern/presentation/pages/introduction/introduction_controller.dart';

class IntroductionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroductionController);
  }
}
