// ignore_for_file: use_setters_to_change_properties, invalid_use_of_protected_member


import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/hepler/app_input.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';
import 'package:test_intern/resources/di_container.dart';
import 'package:test_intern/services/share_preference._helper.dart';

class ProjectController extends GetxController {
  final ProjectReponsitory _cartRepository = GetIt.I.get<ProjectReponsitory>();
  RxList listProject = [].obs;
  RxList filteredProject = [].obs;
  RxBool isLoading = true.obs;
  String idUser = '';
  RxBool isShowSearch = false.obs;
  TextEditingController searchProject = TextEditingController();

  onInit() async {
    idUser = sl<SharedPreferenceHelper>().getIdUser;
    await getProject();
    super.onInit();
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
  }
}
