// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:test_intern/presentation/pages/dashboard/dashboard_controller.dart';
import 'package:test_intern/services/connectivity/connectivity_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.put<ConnectivityController>(ConnectivityController());
  }
}
