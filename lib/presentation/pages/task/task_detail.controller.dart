import 'package:test_intern/resources/export/core_export.dart';

class TaskDetailController extends GetxController {
  RxList<String> filterData = <String>[].obs;
  Rx<String> dataFilter = 'all'.tr.obs;
  TextEditingController decriptionTask = TextEditingController();
  TextEditingController commentTask = TextEditingController();

  @override
  void onInit() {
    decriptionTask.text.isEmpty ? decriptionTask.text = 'Add decription task...' : decriptionTask.text;
    filterData.addAll(<String>['TO DO'.tr, 'IN PROGRESS'.tr, 'DONE'.tr]);
    dataFilter.value = filterData[0];

    super.onInit();
  }

  void onChangFilter({required String value}) {
    dataFilter.value = value;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
