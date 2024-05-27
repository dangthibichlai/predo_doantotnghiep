// ignore_for_file: use_setters_to_change_properties

import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/repositories/task_reponsitory.dart';
import 'package:test_intern/resources/export/core_export.dart';

class IssueController extends GetxController {
  TaskReponsitory _taskReponsitory = GetIt.I.get<TaskReponsitory>();
  RxList listData = [].obs;
  final RefreshController refreshController = RefreshController();
  String idUser = '';
  RxString option = ''.obs;
  RxInt index = 0.obs;
  int _startPage = 1;
  final int _limitPage = 10;
  RxBool isLoading = true.obs;
  RxBool isShowSearch = false.obs;
  RxList filteredDataList = [].obs;
  TextEditingController searchProject = TextEditingController();


  @override
  Future<void> onInit() async {
    option.value = optionValues.reverse[OptionsType.MY_OPEN_ISSUE] ?? '';
    await getIssues(isRefresh: true, option: optionValues.reverse[OptionsType.MY_OPEN_ISSUE] ?? '');
    super.onInit();
  }

  void changeIndex(int value) {
    index.value = value;
  }

  void showSearch() {
    isShowSearch.value = !isShowSearch.value;
  }

  void searchProjectFilter(String value) {
    filteredDataList.value = listData.where((element) {
      return element.title.toLowerCase().contains(value.toLowerCase());
    }).toList();
    filteredDataList.refresh();
  }

  void changeOption(String value, bool isRefresh) {
    option.value = value;
    getIssues(isRefresh: isRefresh, option: value);
  }

  Future<void> getIssues({required bool isRefresh, required String option}) async {
    if (isRefresh) {
      _startPage = 1;
      isLoading.value = true;

      listData.clear();
      refreshController.resetNoData();
    } else {
      _startPage++;
    }
    await _taskReponsitory.paginate(
      _startPage,
      _limitPage,
      onSuccess: (data) {
        if (data.isEmpty) {
          if (isLoading.value) {
            isLoading.value = false;
          }
          refreshController.loadNoData();
          refreshController.refreshCompleted();
        } else {
          if (isRefresh) {
            refreshController.refreshCompleted();
          } else {
            refreshController.loadComplete();
          }

          listData.value = data;
          filteredDataList.value = data;

          if (isLoading.value) {
            isLoading.value = false;
          }
        }
      },
      onError: (error) {
        print(error);
      },
      option: option,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
