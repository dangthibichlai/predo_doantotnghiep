import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/kaban_project.dart/kaban_project_controller.dart';

class KaBanProjectBingding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KabanProjectController>(() => KabanProjectController());
  }
}