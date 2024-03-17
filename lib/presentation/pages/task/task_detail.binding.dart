import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/task/task_detail.controller.dart';

class TaskDetailBingding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskDetailController());
  }
}
