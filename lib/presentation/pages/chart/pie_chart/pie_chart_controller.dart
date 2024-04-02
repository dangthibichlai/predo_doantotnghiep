import 'package:get_it/get_it.dart';
import 'package:test_intern/models/chart_model.dart';
import 'package:test_intern/repositories/chart_repository.dart';

import '../../../../resources/export/core_export.dart';

class PieChartController extends GetxController {
  var touchedIndex = (-1).obs;
  var options = Get.arguments['options'];
  var projectId = Get.arguments['projectId'];
  final ChartRepository _chartRepository = GetIt.I.get<ChartRepository>();
  var chartData;
  RxBool isLoading = true.obs;

  @override
  void onInit()async {
    //
    // Call API get tool collection.
  await  getChart();
    super.onInit();
  }

  @override
  void onClose() {
    //
    // Close stream.
    super.onClose();
  }

  void updateTouchedIndex(int index) {
    touchedIndex.value = index;
  }

  Future<void> getChart() async {
    isLoading.value = true;
    var filter = "";
    switch (options) {
      case 0:
        filter =
            'chartType=${chartTypeValues.reverse[ChartType.PIE_CHART]}&chartOption=${chartOptionValues.reverse[ChartOption.BY_TYPE]}';
        break;
      case 1:
        filter =
            'chartType=${chartTypeValues.reverse[ChartType.PIE_CHART]}&chartOption=${chartOptionValues.reverse[ChartOption.BY_ASSIGNEE]}';
        break;
      case 2:
        filter =
            'chartType=${chartTypeValues.reverse[ChartType.PIE_CHART]}&chartOption=${chartOptionValues.reverse[ChartOption.BY_STATUS]}';
        break;
      default:
        break;
    }
    await _chartRepository.getChart(projectId, filter, onSuccess: (data) {
      chartData = data;
      print(chartData);
    }, onError: (e) {});
    isLoading.value = false;
  }
}
