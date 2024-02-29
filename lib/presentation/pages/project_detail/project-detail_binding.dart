import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/project_detail/project-detail_controller.dart';
//import 'package:template/presentation/pages/project/project_controller.dart';

class ProjectDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectDetailController);
  }
}
