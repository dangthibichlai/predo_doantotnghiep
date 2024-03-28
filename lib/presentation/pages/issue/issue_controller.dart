// ignore_for_file: use_setters_to_change_properties

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_intern/repositories/task_reponsitory.dart';
import 'package:test_intern/resources/export/core_export.dart';

class IssueController extends GetxController {
  TaskReponsitory _taskReponsitory = GetIt.I.get<TaskReponsitory>();
  RxList listData = [].obs;
  final RefreshController refreshController = RefreshController();
  String idUser = '';

  int _startPage = 1;
  RxBool isLoading = true.obs;

  final int _limitPage = 10;

  @override
  Future<void> onInit() async {
    idUser = sl<SharedPreferenceHelper>().getIdUser;
    await getDoneIssues(isRefresh: true);
    super.onInit();
  }

  void getIssuetyByFillter(int index) {
    switch (index) {
      case 0:
        print('All');
        break;
      case 1:
        print('Open');
        break;
      case 2:
        print('Closed');
        break;
      case 3:
        print('My Issue');
        break;
      default:
    }
  }

  Future<void> getDoneIssues({required bool isRefresh}) async {
    if (isRefresh) {
      _startPage = 1;
      isLoading.value = true;
      listData.clear();
      refreshController.resetNoData();
    } else {
      _startPage++;
    }
    await _taskReponsitory.paginate(
      idUser,
      "status=DONE",
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
          if (isLoading.value) {
            isLoading.value = false;
          }
        }
      },
      onError: (error) {
        print(error);
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
