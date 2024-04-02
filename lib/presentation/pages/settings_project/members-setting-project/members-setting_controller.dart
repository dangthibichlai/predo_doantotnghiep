// ignore_for_file: use_setters_to_change_properties, invalid_use_of_protected_member

import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_intern/models/auth_model.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';
import 'package:test_intern/resources/end-point.dart';
import 'package:test_intern/resources/export/core_export.dart';

class MembersController extends GetxController {
  ProjectReponsitory _projectReponsitory = ProjectReponsitory();
  var listMembers = <AuthModel>[].obs;
  RxList filteredMembers = <AuthModel>[].obs;
  String idProjectItem = Get.arguments['idProject'];
  String linkProject = '';
  RxString idLeader = ''.obs;
  RxBool isLoading = true.obs;

  String idUser = '';
  TextEditingController searchMember = TextEditingController();

  @override
  void onInit() {
    idProjectItem = Get.arguments['idProject'];
    idUser = sl<SharedPreferenceHelper>().getIdUser;
    getMembers();
    getLinkProject();
    getLeader();
    super.onInit();
  }

  void deleteMember(String idUser) async {
    await _projectReponsitory.updateMember(
      idProject: idProjectItem,
      idMember: idUser,
      filter: "/remove-member",
      onSuccess: (data) {
        listMembers.removeWhere((element) => element.id == idUser);
        filteredMembers.removeWhere((element) => element.id == idUser);
        listMembers.refresh();
        filteredMembers.refresh();
      },
      onError: (error) {},
    );
  }

  Future<void> getLinkProject() async {
    await _projectReponsitory.findlLinkProject(
      idProjectItem,
      filter: "/get-invite-link",
      onSuccess: (data) {
        linkProject = data;
        linkProject = '${EndPoints.BASE_URL}/' + linkProject;
        log('linkProject: $linkProject');
      },
      onError: (error) {},
    );
  }

  void filterMembers(String query) {
    filteredMembers.value = listMembers.where((member) {
      final fullName = member.full_name!.toLowerCase();
      final searchQuery = query.toLowerCase();
      return fullName.contains(searchQuery) || fullName.startsWith(searchQuery);
    }).toList();
    filteredMembers.refresh();
  }

  Future<void> getMembers() async {
    isLoading.value = true;
    await _projectReponsitory.getMembers(
      idUser,
      idProjectItem,
      onSuccess: (data) {
        listMembers.value.addAll(data);
        listMembers.refresh();
        filteredMembers.addAll(data);
        filteredMembers.refresh();
      },
      onError: (error) {},
    );
    isLoading.value = false;
  }

  Future<void> getLeader() async {
    await _projectReponsitory.find(
      idUser,
      onSuccess: (data) {
        idLeader.value = data[0].leader!;
      },
      onError: (error) {},
    );
  }

  void copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: linkProject)).then((_) {
      final _showToast = FToast();
      _showToast.init(context);
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

  @override
  void onClose() {
    super.onClose();
  }
}
