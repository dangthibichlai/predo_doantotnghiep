import '../../../../resources/export/core_export.dart';

class PieChartController extends GetxController {
  var touchedIndex = (-1).obs;
  var options = Get.arguments['options'];
  var projectId = Get.arguments['projectId'];

  @override
  void onInit() {
    //
    // Call API get tool collection.
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
}
