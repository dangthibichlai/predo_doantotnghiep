// ignore_for_file: use_setters_to_change_properties, invalid_use_of_protected_member

import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/models/board_model.dart';
import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/presentation/pages/kaban_project.dart/UI_modelChart.dart';
import 'package:test_intern/presentation/pages/panel/panel_controller.dart';
import 'package:test_intern/repositories/board_repository.dart';
import 'package:test_intern/repositories/task_reponsitory.dart';
import 'package:test_intern/resources/export/core_export.dart';

class KabanProjectController extends GetxController {
  String idProject = Get.arguments['idProject'];
  String nameProject = Get.arguments['nameProject'];
  String nameProjectItem = Get.arguments['nameProject'];
  String idProjectItem = Get.arguments['idProject'];
  String keyProjectItem = Get.arguments['keyProject'];
  TextEditingController nameBoard = TextEditingController();
  final RefreshController refreshController = RefreshController();
  RxInt currentIndexTab = 0.obs;
  TextEditingController nameColumn = TextEditingController();
  TextEditingController renameColumn = TextEditingController();
  TextEditingController nolimitColumn = TextEditingController();
  List<UiModelChart> listChart = [
    UiModelChart(
      nameChart: "Bar chart",
      description:
          "A bar chart or bar graph is a chart or graph that presents categorical data with rectangular bars with heights or lengths proportional to the values that they represent.",
      image: ImagesPath.imgBarChart1,
    ),
    UiModelChart(
      nameChart: "Bar chart",
      description:
          "A bar chart or bar graph is a chart or graph that presents categorical data with rectangular bars with heights or lengths proportional to the values that they represent.",
      image: ImagesPath.imgBarChart2,
    ),
    UiModelChart(
      nameChart: "Pie chart",
      description:
          "A pie chart is a circular statistical graphic, which is divided into slices to illustrate numerical proportion.",
      image: ImagesPath.imgPieChart1,
    ),
    UiModelChart(
      nameChart: "Pie chart",
      description:
          "A pie chart is a circular statistical graphic, which is divided into slices to illustrate numerical proportion.",
      image: ImagesPath.imgPieChart2,
    ),
    UiModelChart(
      nameChart: "Line chart",
      description:
          "A line chart or line graph is a type of chart which displays information as a series of data points called 'markers' connected by straight line segments.",
      image: ImagesPath.imgLine,
    ),
  ];
  final BoardRepository _boardRepository = GetIt.I.get<BoardRepository>();
  final TaskReponsitory _taskReponsitory = GetIt.I.get<TaskReponsitory>();
  RxBool isLoading = true.obs;
  RxList<BoardModel> listBorad = <BoardModel>[].obs;
  RxList<TaskModel> listTask = <TaskModel>[].obs;

  @override
  void onInit() {
    idProject = Get.arguments['idProject'] ?? idProjectItem;
    nameProject = Get.arguments['nameProject'] ?? nameProjectItem;
    getProject();
    super.onInit();
  }

  @override
  void onClose() {
    refreshController.dispose();

    super.onClose();
  }

  Future<void> getProject() async {
    listBorad.clear();
    isLoading.value = true;
    await _boardRepository.find(
      idProject,
      onSuccess: (data) {
        listBorad.value = data;
        listBorad.refresh();
      },
      onError: (onError) {
        EasyLoading.dismiss();
        AppAlert().info(message: onError);
      },
    );
    isLoading.value = false;
  }

  void addTaskBoard(TaskModel taskModel) async {
    Get.back();
    EasyLoading.show(status: 'loading'.tr);
    await _taskReponsitory.add(
      data: taskModel,
      onSuccess: (data) async {
        EasyLoading.dismiss();
        nameColumn.clear();
        await getProject();
        listBorad.refresh();
        update();
        Get.find<PanelController>().onInit();
      },
      onError: (e) {
        EasyLoading.dismiss();
        AppAlert().info(message: e);

        log('Error task at $e');
      },
    );
  }

  void routerTaskDetail(String id) {
    Get.toNamed(HomeRouter.TASKDETAIL, arguments: {'idTask': id});
  }

  void onChangeTabBar(int index) {
    currentIndexTab.value = index;
  }

  void cancelNewColumn() {
    nameColumn.clear();
    Get.back();
  }

  void createNewColumn(String idBoard) {
    Get.dialog(
      DiologApp(
        title: 'Add column'.tr,
        nameButtonLeft: 'Add'.tr,
        inputController: nameColumn,
        onTap: () {
          addTaskBoard(
            TaskModel(
              boardId: idBoard,
              title: nameColumn.text,
              issueType: IssueType.USER_STORY,
              createdAt: DateTime.now(),
              key: "Test",
            ),
          );
          // onTap add
        },
      ),
      barrierDismissible: true,
      transitionCurve: Curves.easeInOut,
      useSafeArea: true,
    );
  }

  void renameColumnPopup(String id, String name) {
    renameColumn.text = name;
    Get.dialog(
      DiologApp(
        title: 'Rename column'.tr,
        nameButtonLeft: 'Rename'.tr,
        inputController: renameColumn,
        onTap: () {
          updateBoard(id);
        },
      ),
      barrierDismissible: true,
      transitionCurve: Curves.easeInOut,
      useSafeArea: true,
    );
  }

  void limitColumnPopup() {
    Get.dialog(
      DiologApp(
        title: 'Column limit'.tr,
        nameButtonLeft: 'Save'.tr,
        content: 'We\'ll highlight this column if the number of issue passes this limit.'.tr,
        inputController: nolimitColumn,
        onTap: () {
          // onTap rename
        },
      ),
      barrierDismissible: true,
      transitionCurve: Curves.easeInOut,
      useSafeArea: true,
    );
  }

  void addBoard(BoardModel boardModel) {
    // EasyLoading.show(status: 'loading'.tr);
    isLoading.value = true;

    _boardRepository.add(
        data: boardModel,
        onSuccess: (data) {
          getProject();
          listBorad.refresh();

          EasyLoading.dismiss();
          Get.back();
        },
        onError: (e) {
          EasyLoading.dismiss();
          AppAlert().info(message: e);
          log('Error add board at $e');
        });
    isLoading.value = false;
  }

  void updateBoard(String id) {
    isLoading.value = true;
    _boardRepository.update(
      id: id,
      data: BoardModel(id: id, name: renameColumn.text, projectId: idProject),
      onSuccess: (data) {
        getProject();
        listBorad.refresh();
        EasyLoading.dismiss();
        Get.back();
      },
      onError: (e) {
        EasyLoading.dismiss();
        AppAlert().info(message: e);
        log('Error delete board at $e');
      },
    );

    isLoading.value = false;
  }

  void deleteBoard(String id) {
    isLoading.value = true;

    _boardRepository.delete(
      id: id,
      onSuccess: (data) {
        getProject();
        listBorad.refresh();
        EasyLoading.dismiss();
      },
      onError: (e) {
        EasyLoading.dismiss();
        AppAlert().info(message: e);
        log('Error delete board at $e');
      },
    );
    isLoading.value = true;
  }

  void changPageDetail() {
    Get.toNamed(HomeRouter.SETTINGDETAIL,
        arguments: {'nameProject': nameProject, 'keyProject': keyProjectItem, 'idProject': idProject});
  }

  void changPageMember() {
    Get.toNamed(HomeRouter.MEMBERS, arguments: {'idProject': idProject});
  }
}
