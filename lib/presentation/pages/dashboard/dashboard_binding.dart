import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:test_intern/presentation/pages/dashboard/dashboard_controller.dart';
import 'package:test_intern/presentation/pages/project/project_controller.dart';

class DashboardBingding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ProjectController>(() => ProjectController());
  }
}
