import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:test_intern/isar/rencetly_task_service.dart';
import 'package:test_intern/presentation/pages/home/home_controller.dart';

class HomeBingding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<RecentlyTask>(() => RecentlyTask());
  }
}
