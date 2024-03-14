import '../../../resources/export/core_export.dart';

class ChooseChartController extends GetxController {
  RxList<String> filterData = <String>[].obs;
  Rx<String> dataFilter = 'all'.tr.obs;
  String title = '';
 var touchedIndex = (-1).obs;

  
  @override
  void onInit() {
    title = Get.arguments['title'] ?? 'Choose Type Chart';
    filterData.addAll(<String>['Theo công việc'.tr, 'Theo số lỗi'.tr, 'Theo thời gian'.tr]);
    dataFilter.value = filterData[0];
 
    //
    // Call API get tool collection.
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
  }
}
