// ignore_for_file: use_setters_to_change_properties

import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_intern/models/board_model.dart';
import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/presentation/pages/kaban_project.dart/UI_modelChart.dart';
import 'package:test_intern/repositories/board_repository.dart';
import 'package:test_intern/repositories/task_repository.dart';
import 'package:test_intern/resources/export/core_export.dart';

class KabanProjectController extends GetxController {
  String idProject = '';
  String nameProject = '';

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
    idProject = Get.arguments['idProject'];
    nameProject = Get.arguments['nameProject'];
    getProject(idProject);
    super.onInit();
  }

  @override
  void onClose() {
    refreshController.dispose();

    super.onClose();
  }

  void getProject(String id) async {
    await _boardRepository.find(
      id,
      onSuccess: (data) {
        listBorad.value = data;
        listBorad.refresh();
        // ignore: invalid_use_of_protected_member
        log('board: ${listBorad.toList()}');
        if (isLoading.value) {
          isLoading.value = false;
        }
      },
      onError: (onError) {},
    );
  }

  void addTaskBoard(TaskModel taskModel) async {
    await _taskReponsitory.add(
      data: taskModel,
      onSuccess: (data) {
        log('add task success ${listBorad.toList()}');
        listBorad.refresh();
      },
      onError: (e) {
        log('Error task at $e');
      },
    );
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
            TaskModel(boardId: idBoard, title: nameColumn.text, issueType: IssueType.USER_STORY, key: "Test"),
          );
          // onTap add
        },
      ),
      barrierDismissible: true,
      transitionCurve: Curves.easeInOut,
      useSafeArea: true,
    );
  }

  void renameColumnPopup() {
    Get.dialog(
      DiologApp(
        title: 'Rename column'.tr,
        nameButtonLeft: 'Rename'.tr,
        inputController: renameColumn,
        onTap: () {
          // onTap rename
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

  void changPageDetail() {
    Get.toNamed(HomeRouter.SETTINGDETAIL);
  }
}
