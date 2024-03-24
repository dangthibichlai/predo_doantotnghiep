// ignore_for_file: use_setters_to_change_properties, invalid_use_of_protected_member

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_intern/models/auth_model.dart';
import 'package:test_intern/models/project_model.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';
import 'package:test_intern/resources/di_container.dart';
import 'package:test_intern/resources/end-point.dart';
import 'package:test_intern/resources/export/core_export.dart';
import 'package:test_intern/services/share_preference._helper.dart';

class MembersController extends GetxController {
  ProjectReponsitory _projectReponsitory = ProjectReponsitory();
  var listMembers = <AuthModel>[].obs;
  RxList filteredMembers = <AuthModel>[].obs;
  String idProjectItem = Get.arguments['idProject'];
  String linkProject = '';
  RxString idLeader = ''.obs;

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
    await _projectReponsitory.findProjectID(
      idUser,
      onSuccess: (data) {
        listMembers.value.addAll(data);
        listMembers.refresh();
        filteredMembers.addAll(data);
        filteredMembers.refresh();
      },
      onError: (error) {},
    );
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
    Clipboard.setData(ClipboardData(text: linkProject));
  }

  @override
  void onClose() {
    super.onClose();
  }
}
