// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/isar/isar_task_reponsitory.dart';
import 'package:test_intern/isar/rencetly_task_service.dart';
import 'package:test_intern/isar/task_recent.dart';
import 'package:test_intern/models/auth_model.dart';
import 'package:test_intern/models/board_model.dart';
import 'package:test_intern/models/comment_model.dart';
import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/presentation/pages/issue/issue_controller.dart';
import 'package:test_intern/presentation/pages/panel/panel_controller.dart';
import 'package:test_intern/presentation/pages/project/project_controller.dart';
import 'package:test_intern/repositories/board_repository.dart';
import 'package:test_intern/repositories/comment_reponsitory.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';
import 'package:test_intern/repositories/task_reponsitory.dart';

import 'package:test_intern/resources/export/core_export.dart';
import 'package:test_intern/services/socket_io/socket_io.dart';

class TaskDetailController extends GetxController {
  RxList<String> filterData = <String>[].obs;
  Rx<String> dataFilter = 'all'.tr.obs;
  TextEditingController decriptionTask = TextEditingController();
  TextEditingController commentTask = TextEditingController();
  TextEditingController titleTask = TextEditingController();
  TextEditingController searchMember = TextEditingController();
  TextEditingController textComment = TextEditingController();
  RxString assigneeIdUser = ''.obs;
  RxString assigneeNameUser = ''.obs;
  TaskReponsitory _taskReponsitory = GetIt.I.get<TaskReponsitory>();
  ProjectReponsitory _projectReponsitory = GetIt.I.get<ProjectReponsitory>();
  BoardRepository _boardReponsitory = GetIt.I.get<BoardRepository>();
  CommentRepository _commentRepository = GetIt.I.get<CommentRepository>();
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
  RxString issueTypeName = ''.obs;
  RxDouble progress = 0.0.obs;
  RxBool isShowSubTask = true.obs;
  RxBool isShowAddSubTask = false.obs;
  TextEditingController nameSubTask = TextEditingController();
  final RefreshController refreshController = RefreshController();
  RxList<CommentModel> listComments = <CommentModel>[].obs;
  // final SocketIO _socket = GetIt.I.get<SocketIO>();
  RxBool isSendComment = false.obs;

  RxBool isfocusComment = false.obs;
  RecentlyTask recentlyTask = RecentlyTask();
  @override
  void onInit() async {
    idUser = sl<SharedPreferenceHelper>().getIdUser;
    idTask = Get.arguments['idTask'];
    // _socket.listen_to(idTask);
    await getTaskDetail();
    await getSubTask();
    await getComments();
    await featchData();

    await getMembers();

    super.onInit();
  }

  @override
  void onClose() {
    // _socket.reSetSocket();
  }

  void changeFocusComment() {
    isfocusComment.value = true;
    log("focus comment ${isfocusComment.value}");
  }

  void changeShowSubTask() {
    isShowSubTask.value = !isShowSubTask.value;
  }

  void changeShowAddSubTask() {
    isShowAddSubTask.value = !isShowAddSubTask.value;
  }

  void addTaskBoard(TaskModel taskModel) async {
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
    isLoading.value = true;
    await _taskReponsitory.findBoard(idTask, onSuccess: (data) async {
      idProject.value = data;
      _boardReponsitory.find(idProject.value, onSuccess: (data) {
        listBoard.value = data;
        listBoard.refresh();
        for (var item in listBoard) {
          filterData.add(item.name);
        }
        dataFilter.value = filterData[0];
        recentlyTask.addTaskRenctly(TaskRecent(
          idTask: idTask,
          idProject: idProject.value,
          name: titleTask.text,
          description: decriptionTask.text,
          issueType: issueTypeName.value,
          nameProject:
              Get.find<ProjectController>().listProject.where((element) => element.id == idProject.value).first.name,
          avatarProject:
              Get.find<ProjectController>().listProject.where((element) => element.id == idProject.value).first.avatar,
          // lấy tên project từ id project
        ));
      }, onError: (error) {});
    }, onError: (error) {});
    isLoading.value = false;
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
    await _projectReponsitory.getMembers(
      idUser,
      idProject.value,
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

  AuthModel getUser(String id) {
    AuthModel user = AuthModel();
    return user.getUser(id, listMembers.value as List<AuthModel>);
  }

  void updateTask() {
    _taskReponsitory.update(
      id: idTask,
      data: TaskModel(
        boardId: idBoard.value,
        title: titleTask.text,
        key: taskModel[0].key,
        parent: taskModel[0].parent,
        issueType: issueType,
        description: decriptionTask.text,
        assignee: assigneeIdUser.value,
      ),
      onSuccess: (data) async {
        idBoard.value = taskModel[0].boardId;
        await getTaskDetail();
        await getMembers();
        final kabanProjectController = Get.find<KabanProjectController>();
        kabanProjectController.getProject();
        Get.find<IssueController>()
            .getIssues(isRefresh: true, option: optionValues.reverse[OptionsType.MY_OPEN_ISSUE] ?? '');
        Get.find<PanelController>().getTaskDetail();
      },
      onError: (error) {},
    );
  }

  void showEditTitle() {
    isEditTitle.value = !isEditTitle.value;
  }

  void onChangFilter({required String value}) {
    dataFilter.value = value;
    // update lại vị trí boadId mới cho task
    idBoard.value = listBoard.where((element) => element.name == value).first.id;
    updateTask();
  }

  Future<void> getTaskDetail() async {
    await _taskReponsitory.find(
      idTask,
      onSuccess: (data) {
        taskModel = <TaskModel>[].obs;
        taskModel.add(data);
        taskModel.refresh();
        idBoard.value = taskModel.value[0].boardId;
        decriptionTask.text = taskModel.value[0].description ?? '';
        titleTask.text = taskModel.value[0].title ?? '';
        assigneeIdUser.value = taskModel.value[0].assignee ?? '';
        issueType = taskModel.value[0].issueType ?? IssueType.USER_STORY;
        issueTypeName.value = issueTypeValues.reverse[issueType] ?? '';
      },
      onError: (error) {},
    );
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
  }

  /// COMMENT
  Future<void> getComments() async {
    isSendComment.value = true;
    // listComments.clear();
    await _commentRepository.getComment(
      idTask,
      onSuccess: (data) {
        listComments.value = data;
        listComments.refresh();
      },
      onError: (error) {},
    );
    isSendComment.value = false;
  }

  Future<void> updateComment(CommentModel commentModel, String idComment) async {
    _commentRepository.update(
      id: idComment,
      data: commentModel,
      onSuccess: (data) async {
        // commentTask.clear();
        await getComments();
        listComments.refresh();
      },
      onError: (error) {},
    );
  }

  Future<void> deleteComment(String idComment) async {
    _commentRepository.delete(
      idComment,
      onSuccess: (data) async {
        commentTask.clear();
        await getComments();
        listComments.refresh();
        final _showToast = FToast();
        _showToast.init(Get.context!);
        _showToast.showToast(
            child: Container(
                alignment: Alignment.center,
                width: SizeApp.setSizeWithWidth(percent: 0.8),
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImage(
                      ImagesPath.logoApp,
                      width: 30.sp,
                      height: 30.sp,
                    ),
                    Gap(5.0),
                    const Text('Deleted comment success!'),
                  ],
                )));
      },
      onError: (error) {},
    );
  }

  Future<void> addComment() async {
    if (commentTask.text.isEmpty) return AppAlert().info(message: 'comment_empty'.tr);
    await _commentRepository.sendMessage(
      data: CommentModel(
        taskId: idTask,
        userId: idUser,
        content: commentTask.text,
      ),
      onSuccess: (data) async {
        commentTask.clear();
        await getComments();
        listComments.refresh();
        // _socket.socket.emit("predo_update_comment", data);
        FocusScope.of(Get.context!).unfocus();
      },
      onError: (error) {},
    );
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      final _showToast = FToast();
      _showToast.init(Get.context!);
      _showToast.showToast(
          child: Container(
              alignment: Alignment.center,
              width: SizeApp.setSizeWithWidth(percent: 0.6),
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppImage(
                    ImagesPath.logoApp,
                    width: 30.sp,
                    height: 30.sp,
                  ),
                  Gap(5.0),
                  const Text('Copied to clipboard!'),
                ],
              )));
    });
  }

  // xóa task
  Future<void> deleteTask() async {
    EasyLoading.show(status: 'loading'.tr);
    await _taskReponsitory.delete(
      id: idTask,
      onSuccess: (data) async {
        EasyLoading.dismiss();

        Get.back();
        final _showToast = FToast();
        _showToast.init(Get.context!);
        _showToast.showToast(
            child: Container(
                alignment: Alignment.center,
                width: SizeApp.setSizeWithWidth(percent: 0.8),
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImage(
                      ImagesPath.logoApp,
                      width: 30.sp,
                      height: 30.sp,
                    ),
                    Gap(5.0),
                    const Text('Deleted task success!'),
                  ],
                )));
        await Get.find<KabanProjectController>().getProject();
        Get.find<IssueController>()
            .getIssues(isRefresh: true, option: optionValues.reverse[OptionsType.MY_OPEN_ISSUE] ?? '');
        Get.find<PanelController>().getTaskDetail();
        RecentlyTask recentlyTask = RecentlyTask();
        recentlyTask.listTaskRenctly.removeWhere((element) => element.idTask == idTask);
        final recently = GetIt.I.get<IsarTaskRepository>();

        await recently.deleteTaskByIdTask(
          idTask: idTask,
          onSuccess: (data) {},
          onError: (error) {},
        );

        Get.back();
      },
      onError: (error) {
        EasyLoading.dismiss();
        AppAlert().info(message: error);
      },
    );
  }
}
