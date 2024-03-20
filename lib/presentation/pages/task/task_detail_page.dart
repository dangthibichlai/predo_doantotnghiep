// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:test_intern/core/hepler/app_dropdown.dart';
import 'package:test_intern/core/hepler/app_input.dart';
import 'package:test_intern/presentation/pages/task/task_detail.controller.dart';
import 'package:test_intern/resources/export/core_export.dart';

class TaskDetailPage extends GetView<TaskDetailController> {
  const TaskDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: LoadingApp(
                titleLoading: 'diy_001'.tr,
              ),
            );
          }
          return Stack(
            children: [
              Positioned.fill(
                child: SafeArea(
                  child: Column(
                    children: [
                      _header(),
                      Expanded(
                          child: Obx(
                        () => SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                              top: 35.0,
                              bottom: 70.sp,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ColorResources.GREEN,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      height: 16.sp,
                                      width: 16.sp,
                                      child: Icon(
                                        Icons.bookmark_outlined,
                                        color: ColorResources.WHITE,
                                        size: 12.sp,
                                      ),
                                    ),
                                    Gap(10.sp),
                                    Text(
                                      controller.taskModel.value[0].key ?? "",
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          color: ColorResources.BLACK
                                              .withOpacity(.5)),
                                    ),
                                  ],
                                ),
                                Gap(5.sp),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              print("Edit Title");
                                              log("TITLE");
                                              CommonHelper.onTapHandler(
                                                  callback: () {
                                                controller.showEditTitle();
                                              });
                                            },
                                            child: AppInput(
                                              controller: controller.titleTask,
                                              onSubmitted: (p0) {
                                                log("Submit title");
                                                controller.updateTitleTask();
                                              },
                                              onTap: () {
                                                print("Edit Title");
                                              },
                                              colorDisibleBorder:
                                                  Color.fromARGB(
                                                      255, 11, 196, 199),
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorResources.BLACK
                                                      .withOpacity(.4)),
                                              labelStyle: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorResources.BLACK
                                                      .withOpacity(.7)),
                                              type: AppInputType.TEXT,
                                              maxLine: 1,
                                              hintText: controller
                                                  .taskModel.value[0].title,
                                              isBorder: true,
                                              fontSize: 14.sp,
                                              fillColor: Colors.transparent,
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          Obx(() {
                                            return controller.isEditTitle.value
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 5.sp),
                                                    child: Divider(
                                                      height: 1,
                                                      color: ColorResources
                                                          .MAIN_APP
                                                          .withOpacity(.2),
                                                    ),
                                                  )
                                                : SizedBox();
                                          }),
                                          Obx(
                                            () => controller.isEditTitle.value
                                                ? SizedBox(
                                                    height: 20.sp,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              Icons.close,
                                                              size: 20.sp,
                                                              color: ColorResources
                                                                  .MAIN_APP
                                                                  .withOpacity(
                                                                      .5),
                                                            )),
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              Icons.check,
                                                              size: 22.sp,
                                                              color: ColorResources
                                                                  .MAIN_APP
                                                                  .withOpacity(
                                                                      .5),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                : SizedBox(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 20.sp,
                                      backgroundColor:
                                          ColorResources.GREY.withOpacity(.1),
                                      child: Icon(
                                        Icons.person_2_rounded,
                                        color:
                                            ColorResources.GREY.withOpacity(.5),
                                        size: 30.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(15.sp),
                                _dropdown(),
                                Gap(25.sp),
                                InkWell(
                                  onTap: () {
                                    Get.dialog(
                                      _diolog(),
                                      barrierDismissible: true,
                                      transitionCurve: Curves.easeInOut,
                                      useSafeArea: true,
                                    );
                                  },
                                  child: Obx(
                                    () => AppInput(
                                      allowEdit: false,
                                      height: 70.sp,
                                      controller: controller.decriptionTask,
                                      autofocus: true,
                                      colorDisibleBorder:
                                          Color.fromARGB(255, 11, 196, 199),
                                      label: "Description".tr,
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w300,
                                          color: ColorResources.BLACK
                                              .withOpacity(.4)),
                                      labelStyle: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: ColorResources.BLACK
                                              .withOpacity(.7)),
                                      type: AppInputType.TEXT,
                                      maxLine: 4,
                                      hintText: controller.taskModel.value[0]
                                                  .description ==
                                              ''
                                          ? "Add description..."
                                          : '',
                                      isBorder: true,
                                      fontSize: 14.sp,
                                      fillColor: Colors.transparent,
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                Gap(5.sp),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Attachment",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: ColorResources.BLACK,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(25.sp),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _attachItem(
                                      Icons.camera_enhance_outlined,
                                      "Take photo",
                                    ),
                                    _attachItem(
                                      Icons.camera_alt,
                                      "Record video",
                                    ),
                                    _attachItem(
                                      Icons.file_copy_outlined,
                                      "Choose file",
                                    ),
                                    _attachItem(
                                      Icons.radio_button_checked,
                                      "Record sreen",
                                    )
                                  ],
                                ),
                                Gap(20.sp),
                                Divider(
                                  color: ColorResources.GREY.withOpacity(.2),
                                ),
                                _issueTypeBody(),
                              ],
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorResources.WHITE,
                    boxShadow: [
                      BoxShadow(
                        color: ColorResources.GREY.withOpacity(.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: AppInput(
                    hintText: "Add comment",
                    height: 60.sp,
                    controller: controller.commentTask,
                    autofocus: false,
                    colorDisibleBorder: Color.fromARGB(255, 11, 196, 199),
                    type: AppInputType.TEXT,
                    maxLine: 1,
                    isBorder: true,
                    fontSize: 14.sp,
                    fillColor: Colors.transparent,
                    borderSide: BorderSide.none,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _issueTypeBody() {
    return Column(
      children: [
        Gap(5.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Issue type',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: ColorResources.BLACK),
            ),
          ],
        ),
        Gap(5.sp),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorResources.GREEN,
                borderRadius: BorderRadius.circular(3),
              ),
              height: 16.sp,
              width: 16.sp,
              child: Icon(
                Icons.bookmark_outlined,
                color: ColorResources.WHITE,
                size: 12.sp,
              ),
            ),
            Gap(10.sp),
            Text(
              'Task',
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorResources.BLACK.withOpacity(.5)),
            ),
          ],
        ),
        Gap(15.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Assignee',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: ColorResources.BLACK),
            ),
          ],
        ),
        Gap(5.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Text(
              controller.taskModel.value[0].assignee == ""
                  ? "Unassigned"
                  : controller.taskModel.value[0].assignee ?? "",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: ColorResources.BLACK.withOpacity(.5),
              ),
            ),
          ],
        ),
        Gap(15.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Labels',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: ColorResources.BLACK),
            ),
          ],
        ),
        Gap(35.sp),
        Gap(15.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'More',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorResources.MAIN_APP),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Activity:',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorResources.BLACK),
            ),
            Text(
              'Comments',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorResources.MAIN_APP),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImage(
              ImagesPath.notificationEmpty,
              width: SizeApp.setSizeWithWidth(percent: .25),
            ),
            Gap(20),
            Text(
              'Add comment',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorResources.MAIN_APP),
            ),
          ],
        ),
      ],
    );
  }

  Widget _attachItem(IconData icon, String title) {
    return SizedBox(
      width: SizeApp.setSizeWithWidth(percent: .2),
      child: Column(
        children: [
          Icon(icon, size: 20.sp, color: ColorResources.MAIN_APP),
          Text(title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10.sp,
                color: ColorResources.MAIN_APP,
              )),
        ],
      ),
    );
  }

  Widget _dropdown() {
    return Row(
      children: [
        Obx(
          () => AppropDownButton<String>(
            iconDropdown: Icon(
              Icons.arrow_drop_down_outlined,
              color: controller.dataFilter.value == "TO DO"
                  ? ColorResources.BLACK.withOpacity(.5)
                  : ColorResources.WHITE,
            ),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: controller.dataFilter.value == "TO DO"
                  ? ColorResources.BLACK.withOpacity(.5)
                  : ColorResources.WHITE,
            ),
            borderRadius: SizeApp.RADIUS_2X,
            height: SizeApp.setSize(percent: .05),
            backgroundColor: controller.dataFilter.value == "TO DO"
                ? ColorResources.GREY.withOpacity(.1)
                : controller.dataFilter.value == "IN PROGRESS"
                    ? ColorResources.MAIN_APP
                    : controller.dataFilter.value == "DONE"
                        ? Color.fromARGB(255, 6, 135, 111)
                        : ColorResources.GREY.withOpacity(.1),
            width: controller.dataFilter.value == "IN PROGRESS"
                ? SizeApp.setSizeWithWidth(percent: .4)
                : SizeApp.setSizeWithWidth(percent: .3),
            value: controller.dataFilter.value,
            data: controller.filterData.value,
            isRequired: false,
            onChanged: (data) {
              CommonHelper.onTapHandler(callback: () {
                controller.onChangFilter(value: data.toString());
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _diolog() {
    return DiologApp(
      inputController: controller.decriptionTask,
      onTap: () {
        controller.updateDecriptTask();
        Get.back();
      },
      title: 'Add Column',
      nameButtonLeft: 'Add',
      nameButtonRight: 'Cancel',
    );
  }

  Widget _header() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close,
            size: 22.sp,
            color: ColorResources.BLACK.withOpacity(.5),
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.remove_red_eye_outlined,
            size: 22.sp,
            color: ColorResources.BLACK.withOpacity(.5),
          ),
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(-45 * 3.1415927 / 180),
          child: IconButton(
            icon: Icon(
              Icons.attachment,
              size: 22.sp,
            ),
            color: ColorResources.BLACK.withOpacity(.5),
            onPressed: () {},
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            size: 22.sp,
            color: ColorResources.BLACK.withOpacity(.5),
          ),
        ),
      ],
    );
  }
}
