import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/chart/pie_chart/pie_chart_controller.dart';

class PieChartBingding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PieChartController>(() => PieChartController());
  }
}
