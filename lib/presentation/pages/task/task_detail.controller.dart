// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/models/auth_model.dart';
import 'package:test_intern/models/board_model.dart';
import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/repositories/board_repository.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';
import 'package:test_intern/repositories/task_reponsitory.dart';
import 'package:test_intern/resources/export/core_export.dart';

class TaskDetailController extends GetxController {
  RxList<String> filterData = <String>[].obs;
  Rx<String> dataFilter = 'all'.tr.obs;
  TextEditingController decriptionTask = TextEditingController();
  TextEditingController commentTask = TextEditingController();
  TextEditingController titleTask = TextEditingController();
  TextEditingController searchMember = TextEditingController();
  RxString assigneeIdUser = ''.obs;
  RxString assigneeNameUser = ''.obs;
  TaskReponsitory _taskReponsitory = GetIt.I.get<TaskReponsitory>();
  ProjectReponsitory _projectReponsitory = GetIt.I.get<ProjectReponsitory>();
  BoardRepository _boardReponsitory = GetIt.I.get<BoardRepository>();
  RxList taskModel = <TaskModel>[].obs;
  RxList listMembers = <AuthModel>[].obs;
  RxList filteredMembers = <AuthModel>[].obs;
  RxList listBoard = <BoardModel>[].obs;
  RxList listSubTask = <TaskModel>[].obs;
  String idUser = '';
  String idTask = Get.arguments['idTask'];
  RxString idProject = ''.obs;
  RxString idBoard = ''.obs;
  RxBool isLoading = true.obs;
  RxBool isEditTitle = false.obs;
  IssueType issueType = IssueType.USER_STORY;
  RxDouble progress = 0.0.obs;
  RxBool isShowSubTask = false.obs;
  TextEditingController nameSubTask = TextEditingController();

  @override
  void onInit() async {
    idUser = sl<SharedPreferenceHelper>().getIdUser;
    idTask = Get.arguments['idTask'];
    await getTaskDetail();
    await getMembers();
    await featchData();
    await getSubTask();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeShowSubTask() {
    isShowSubTask.value = !isShowSubTask.value;
  }


  void addTaskBoard(TaskModel taskModel) async {
    Get.back();
    EasyLoading.show(status: 'loading'.tr);
    await _taskReponsitory.add(
      data: taskModel,
      onSuccess: (data) async {
        EasyLoading.dismiss();
        nameSubTask.clear();
        await getSubTask();
        listSubTask.refresh();
        update();
      },
      onError: (e) {
        EasyLoading.dismiss();
        AppAlert().info(message: e);

        log('Error task at $e');
      },
    );
  }

  Future<void> featchData() async {
    await _taskReponsitory.findBoard(idTask, onSuccess: (data) async {
      idProject.value = data;
      _boardReponsitory.find(idProject.value, onSuccess: (data) {
        listBoard.value = data;
        listBoard.refresh();
        for (var item in listBoard) {
          filterData.add(item.name);
        }
        dataFilter.value = filterData[0];
      }, onError: (error) {});
    }, onError: (error) {});
  }

  void filterMembers(String query) {
    filteredMembers.value = listMembers.where((member) {
      return member.full_name!.toUpperCase().contains(query.toUpperCase());
    }).toList();
    filteredMembers.refresh();
  }

  Future<void> getMembers() async {
    listMembers.clear();
    filteredMembers.clear();
    await _projectReponsitory.findProjectID(
      idUser,
      onSuccess: (data) {
        listMembers.value.addAll(data);
        listMembers.refresh();
        filteredMembers.addAll(data);
        filteredMembers.refresh();
        assigneeNameUser.value = listMembers.where((element) => element.id == assigneeIdUser.value).first.full_name;
      },
      onError: (error) {},
    );
  }

  void updateTask() {
    _taskReponsitory.update(
      id: idTask,
      data: TaskModel(
        boardId: taskModel[0].boardId,
        title: titleTask.text,
        key: taskModel[0].key,
        issueType: issueType,
        description: decriptionTask.text,
        assignee: assigneeIdUser.value,
      ),
      onSuccess: (data) async {
        idBoard.value = taskModel[0].boardId;
        await getTaskDetail();
        await getMembers();
      },
      onError: (error) {},
    );
  }

  void showEditTitle() {
    isEditTitle.value = !isEditTitle.value;
  }

  void onChangFilter({required String value}) {
    dataFilter.value = value;
  }

  Future<void> getTaskDetail() async {
    await _taskReponsitory.find(
      idTask,
      onSuccess: (data) {
        taskModel = <TaskModel>[].obs;
        taskModel.add(data);
        taskModel.refresh();
        decriptionTask.text = taskModel.value[0].description ?? '';
        titleTask.text = taskModel.value[0].title ?? '';
        assigneeIdUser.value = taskModel.value[0].assignee ?? '';
        issueType = taskModel.value[0].issueType ?? '';
      },
      onError: (error) {},
    );
    isLoading.value = false;
  }

  Future<void> getSubTask() async {
    listSubTask.clear();
    await _taskReponsitory.getSubtask(
      idTask,
      filter: '/get-sub-tasks',
      onSuccess: (data) {
        listSubTask.value = data;
        listSubTask.refresh();
        int count = 0;
        for (var item in listSubTask) {
          if (item.status == Status.DONE) {
            count++;
          }
        }
        progress.value = count / listSubTask.length;
      },
      onError: (error) {},
    );
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
