// ignore_for_file: invalid_use_of_protected_member

import 'package:get_it/get_it.dart';
import 'package:test_intern/isar/isar_task_reponsitory.dart';
import 'package:test_intern/presentation/pages/home/home_controller.dart';

import '../resources/export/core_export.dart';

class RecentlyTask extends GetxController {
  final recently = GetIt.I.get<IsarTaskRepository>();
  RxList listTaskRenctly = [].obs;
  RxBool isLoading = true.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    // await recently.deleteAll(onSuccess: (data) {
    //   print("delete all task success");
    // }, onError: (error) {
    //   print("delete all task error");
    // });
    await getDataIsar();
  }

  // kiểm tra id  đã tồn tại trong listProjectRenctly chưa nếu có r thì xóa đi và thêm lại ở vị trí đầu tiên
  bool checkTaskRenctly(String id) {
    for (var i = 0; i < listTaskRenctly.value.length; i++) {
      if (listTaskRenctly.value[i].idTask == id) {
        return true;
      }
    }
    return false;
  }

  Future<void> addTaskRenctly(data) async {
    await getDataIsar();
    for (var i = 0; i < listTaskRenctly.value.length; i++) {
      if (listTaskRenctly.value[i].idTask == data.idTask) {
        listTaskRenctly.value.removeAt(i);
        await recently.deleteTaskByIdTask(
          idTask: data.idTask,
          onSuccess: (data) {},
          onError: (error) {},
        );
      }
    }

    listTaskRenctly.value.insert(0, data);
    listTaskRenctly.refresh();
    await recently.insertAndUpdate(
      task: data,
      onSuccess: (data) {},
      onError: (error) {},
    );
    await Get.find<HomeController>().getTaskRecently();
  }

  Future<void> getDataIsar() async {
    isLoading.value = true;
    await recently.getAll(
      onSuccess: (data) {
        listTaskRenctly.value = data.reversed.toList();
        listTaskRenctly.refresh();
      },
      onError: (e) {},
    );
    isLoading.value = false;
  }
}
