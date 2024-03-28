import '../../../resources/export/core_export.dart';

class ChooseChartController extends GetxController {
  RxList<String> filterData = <String>[].obs;
  Rx<String> dataFilter = 'all'.tr.obs;
  String projectId = Get.arguments['projectId'];
  String title = '';
  RxInt index = 0.obs;
  var touchedIndex = (-1).obs;

  @override
  void onInit() {
    title = Get.arguments['title'] ?? 'Choose Type Chart';
    filterData.addAll(<String>['BY_TYPE'.tr, 'BY_ASSIGNEE'.tr, 'BY_STATUS'.tr]);

    dataFilter.value = filterData[0];

    super.onInit();
  }

  @override
  void onClose() {
    //
    // Close stream.
    filterData.close();
    super.onClose();
  }

  void updateTouchedIndex(int index) {
    touchedIndex.value = index;
  }

  void onChangFilter({required String value}) {
    dataFilter.value = value;
    index.value = filterData.indexOf(value);
  }
}
