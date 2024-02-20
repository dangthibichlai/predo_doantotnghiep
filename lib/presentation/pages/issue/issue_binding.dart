import 'package:get/get.dart';
//import 'package:template/presentation/pages/issue/issue_controller.dart';
import 'package:test_intern/presentation/pages/issue/issue_controller.dart';

class IssueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IssueController);
  }
}
