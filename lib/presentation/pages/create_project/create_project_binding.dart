import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:test_intern/presentation/pages/create_project/create_project_controller.dart';

class CreateProjectBingding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateProjectController>(() => CreateProjectController());
  }
}
