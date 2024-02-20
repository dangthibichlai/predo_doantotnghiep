import 'package:get/get.dart';
//import 'package:template/presentation/pages/project/project_controller.dart';
import 'package:test_intern/presentation/pages/project/project_controller.dart';

class ProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectController);
  }
}
