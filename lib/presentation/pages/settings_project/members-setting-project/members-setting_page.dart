// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:test_intern/core/hepler/app_input.dart';
import 'package:test_intern/presentation/pages/settings_project/members-setting-project/members-setting_controller.dart';
import 'package:test_intern/resources/export/core_export.dart';

class MembersSettingPage extends GetView<MembersController> {
  const MembersSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Members'.tr,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        actions: [
          Obx(
            () => !controller.isLoading.value
                ? AppButton(
                    margin: EdgeInsets.only(right: 10.sp),
                    width: SizeApp.setSizeWithWidth(percent: .35),
                    borderRadius: 5,
                    padding: EdgeInsets.all(4),
                    colorBG: ColorResources.MAIN_APP,
                    onTap: () {
                      Get.dialog(
                        Dialog(
                          child: Container(
                            padding: EdgeInsets.only(top: 20.sp, left: 10.sp, right: 10.sp, bottom: 20.sp),
                            width: SizeApp.getMaxWidth(),
                            constraints: BoxConstraints(
                              maxHeight: SizeApp.setSize(percent: .58),
                              minHeight: SizeApp.setSize(percent: .3),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorResources.WHITE,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Invite members".tr,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ColorResources.MAIN_APP.withOpacity(.7),
                                  ),
                                ),
                                Gap(5.sp),
                                SizedBox(
                                  width: SizeApp.getMaxWidth(),
                                  child: Center(
                                    child: Text(
                                      "experied".tr,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: ColorResources.RED.withOpacity(.5),
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(10.sp),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "path".tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: ColorResources.BLACK.withOpacity(.5),
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(10.sp),
                                Container(
                                  width: SizeApp.setSize(percent: .22),
                                  height: SizeApp.setSize(percent: .22),
                                  color: ColorResources.MAIN_APP.withOpacity(.2),
                                  child: QrImageView(
                                    data: controller.linkProject,
                                    version: QrVersions.auto,
                                    size: SizeApp.setSize(percent: .22),
                                  ),
                                ),
                                Gap(10.sp),
                                SizedBox(
                                  width: SizeApp.getMaxWidth(),
                                  child: Center(
                                    child: Text(
                                      controller.linkProject,
                                      textWidthBasis: TextWidthBasis.longestLine,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: ColorResources.BLACK.withOpacity(.5),
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(10.sp),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel".tr),
                                    ),
                                    AppButton(
                                        padding: EdgeInsets.all(8),
                                        colorBorder: ColorResources.GREY.withOpacity(.5),
                                        onTap: () {
                                          controller.copyToClipboard(context);
                                        },
                                        label: "Copy".tr,
                                        colorText: ColorResources.MAIN_APP.withOpacity(.7),
                                        type: AppButtonType.OUTLINE,
                                        width: 80.sp,
                                        borderRadius: 5,
                                        fontSizedLabel: 12.sp)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        barrierDismissible: true,
                        transitionCurve: Curves.easeInOut,
                        useSafeArea: true,
                      );
                    },
                    label: "Add members".tr,
                    fontSizedLabel: 12.sp,
                  )
                : SizedBox(),
          )
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: LoadingApp())
            : Padding(
                padding: EdgeInsets.only(
                    left: SizeApp.setSizeWithWidth(percent: .05),
                    top: SizeApp.setSize(percent: .02),
                    right: SizeApp.setSizeWithWidth(percent: .05)),
                child: Column(children: [
                  AppInput(
                    onChanged: (value) {
                      controller.filterMembers(value);
                    },
                    prefixIcon: (FocusNode) {
                      return Icon(
                        Icons.search,
                        color: ColorResources.BLACK.withOpacity(.5),
                        size: 20.sp,
                      );
                    },
                    height: SizeApp.setSize(percent: .07),
                    controller: controller.searchMember,
                    colorDisibleBorder: Color.fromARGB(255, 11, 196, 199),
                    style: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorResources.BLACK.withOpacity(.4)),
                    labelStyle: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK.withOpacity(.7)),
                    type: AppInputType.TEXT,
                    maxLine: 1,
                    hintText: "Search members...".tr,
                    isBorder: true,
                    fontSize: 14.sp,
                    fillColor: Colors.transparent,
                    underLine: UnderlineInputBorder(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.sp),
                    constraints: BoxConstraints(
                      maxHeight: SizeApp.setSize(percent: .35),
                      minHeight: SizeApp.setSize(percent: .1),
                    ),
                    child: Obx(
                      () => controller.filteredMembers.value.length == 0
                          ? Center(
                              child: Text(
                                "No members found".tr,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorResources.BLACK.withOpacity(.5),
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller.filteredMembers.value.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child: Obx(
                                    () => Container(
                                      margin: EdgeInsets.only(bottom: 10.sp),
                                      padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                                      height: SizeApp.setSize(percent: .07),
                                      decoration: BoxDecoration(
                                        // color: ColorResources.WHITE ,
                                        color: ColorResources.WHITE,
                                        border: Border(
                                          bottom: BorderSide(
                                            color: ColorResources.GREY.withOpacity(.5),
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 14.sp,
                                            backgroundColor: ColorResources.GREY.withOpacity(.1),
                                            child: Icon(
                                              Icons.person_2_rounded,
                                              color: ColorResources.GREY.withOpacity(.5),
                                              size: 16.sp,
                                            ),
                                          ),
                                          Gap(10.sp),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller.filteredMembers.value[index].full_name ?? "",
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorResources.BLACK.withOpacity(.8),
                                                ),
                                              ),
                                              controller.idLeader == controller.filteredMembers.value[index].id
                                                  ? Text(
                                                      "Manager".tr,
                                                      style: TextStyle(
                                                        fontSize: 10.sp,
                                                        fontWeight: FontWeight.w500,
                                                        color: ColorResources.BLACK.withOpacity(.3),
                                                      ),
                                                    )
                                                  : Text(
                                                      "Members".tr,
                                                      style: TextStyle(
                                                        fontSize: 10.sp,
                                                        fontWeight: FontWeight.w500,
                                                        color: ColorResources.BLACK.withOpacity(.3),
                                                      ),
                                                    )
                                            ],
                                          ),
                                          Spacer(),
                                          controller.idLeader == controller.filteredMembers.value[index].id
                                              ? Icon(
                                                  Icons.star,
                                                  color: ColorResources.YELLOW.withOpacity(.5),
                                                  size: 20.sp,
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    log(controller.filteredMembers.value[index].id);
                                                    controller.deleteMember(controller.filteredMembers.value[index].id);
                                                  },
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: ColorResources.GREY.withOpacity(.5),
                                                    size: 20.sp,
                                                  ),
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  )
                ]),
              ),
      ),
    );
  }
}
