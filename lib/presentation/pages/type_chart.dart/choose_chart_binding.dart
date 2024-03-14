import 'package:test_intern/presentation/pages/type_chart.dart/choose_chart_controller.dart';

import '../../../resources/export/core_export.dart';

class ChooseChartBingding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseChartController>(() => ChooseChartController());
  }
}
