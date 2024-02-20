import 'package:get/get.dart';
//import 'package:template/presentation/pages/panel/panel_controller.dart';
import 'package:test_intern/presentation/pages/panel/panel_controller.dart';

class PanelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PanelController);
  }
}
