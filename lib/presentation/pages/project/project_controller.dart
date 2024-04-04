// ignore_for_file: use_setters_to_change_properties, invalid_use_of_protected_member

import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/hepler/app_input.dart';
import 'package:test_intern/isar/isar_project_reponsitory.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';
import 'package:test_intern/resources/di_container.dart';
import 'package:test_intern/services/share_preference._helper.dart';

class ProjectController extends GetxController {
  final ProjectReponsitory _cartRepository = GetIt.I.get<ProjectReponsitory>();
  IsarProjectRepository isarProjectRepository = GetIt.I.get<IsarProjectRepository>();
  RxList listProject = [].obs;
  RxList listProjectRenctly = [].obs;
  RxList filteredProject = [].obs;
  RxBool isLoading = true.obs;
  String idUser = '';
  RxBool isShowSearch = false.obs;
  TextEditingController searchProject = TextEditingController();

  onInit() async {
    idUser = sl<SharedPreferenceHelper>().getIdUser;
    await getProject();
    await getDataIsar();
    super.onInit();
  }

  // kiểm tra id  đã tồn tại trong listProjectRenctly chưa
  bool checkProjectRenctly(String id) {
    for (var i = 0; i < listProjectRenctly.length; i++) {
      if (listProjectRenctly[i].idProject == id) {
        return true;
      }
    }
    return false;
  }

// add  project vừa xem và listProjectRenctly
  Future<void> addProjectRenctly(data) async {
    if (checkProjectRenctly(data.idProject)) {
      listProjectRenctly.value.removeWhere((element) => element.idProject == data.idProject);

      await isarProjectRepository.deleteProjectById(
        id: data.id,
        onSuccess: (data) {
          log("list project isar del: $data");
        },
        onError: (error) {
          print(error);
        },
      );
      listProjectRenctly.refresh();
    }

    listProjectRenctly.value.insert(0, data);
    listProjectRenctly.refresh();
    await isarProjectRepository.insertAndUpdate(
      project: data,
      onSuccess: (data) {
        log("list project isar insert: $data");
      },
      onError: (error) {
        print(error);
      },
    );
  }

  Future<void> getDataIsar() async {
    isLoading.value = true;

    await isarProjectRepository.getAll(onSuccess: (data) {
      if (data.isNotEmpty) {
        listProjectRenctly.value = data;
        listProjectRenctly.refresh();
      }

      isLoading.value = false;
    }, onError: (e) {
      print(e);
    });
  }

  void showSearch() {
    isShowSearch.value = !isShowSearch.value;
  }

  void searchProjectFilter(String value) {
    filteredProject.value = listProject.where((element) {
      return element.name.toLowerCase().contains(value.toLowerCase());
    }).toList();
    filteredProject.refresh();
  }

  @override
  void onClose() {
    searchProject.dispose();

    super.onClose();
  }

  getProject() async {
    isLoading.value = true;
    await _cartRepository.find(
      idUser,
      onSuccess: (data) {
        listProject.value = data;
        filteredProject.value = data;

        listProject.refresh();
        isLoading.value = false;
      },
      onError: (error) {
        print(error);
      },
    );
    isLoading.value = false;
  }
}
