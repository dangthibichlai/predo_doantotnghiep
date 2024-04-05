import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:test_intern/isar/rencetly_task_service.dart';
import 'package:test_intern/presentation/pages/dashboard/dashboard_controller.dart';
import 'package:test_intern/presentation/pages/home/home_controller.dart';
import 'package:test_intern/presentation/pages/issue/issue_controller.dart';
import 'package:test_intern/presentation/pages/notification/notification_controller.dart';
import 'package:test_intern/presentation/pages/panel/panel_controller.dart';
import 'package:test_intern/presentation/pages/project/project_controller.dart';

class DashboardBingding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ProjectController>(() => ProjectController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<PanelController>(() => PanelController());
    Get.lazyPut<IssueController>(() => IssueController());
    Get.lazyPut<RecentlyTask>(() => RecentlyTask());
  }
}
