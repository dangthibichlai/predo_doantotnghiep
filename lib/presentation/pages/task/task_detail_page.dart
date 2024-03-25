// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:test_intern/core/hepler/app_dropdown.dart';
import 'package:test_intern/core/hepler/app_input.dart';
import 'package:test_intern/presentation/pages/task/task_detail.controller.dart';
import 'package:test_intern/resources/export/core_export.dart';

class TaskDetailPage extends GetView<TaskDetailController> {
  final double bottomSheetHeight = 0.4.obs.value;

  TaskDetailPage({super.key});

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
                                          color: ColorResources.BLACK.withOpacity(.5)),
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
                                              CommonHelper.onTapHandler(callback: () {
                                                controller.showEditTitle();
                                              });
                                            },
                                            child: AppInput(
                                              controller: controller.titleTask,
                                              onSubmitted: (p0) {
                                                controller.updateTask();
                                              },
                                              onTap: () {
                                                CommonHelper.onTapHandler(callback: () {
                                                  controller.showEditTitle();
                                                });
                                              },
                                              colorDisibleBorder: Color.fromARGB(255, 11, 196, 199),
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorResources.BLACK.withOpacity(.4)),
                                              labelStyle: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorResources.BLACK.withOpacity(.7)),
                                              type: AppInputType.TEXT,
                                              maxLine: 1,
                                              hintText: controller.taskModel.value[0].title,
                                              isBorder: true,
                                              fontSize: 14.sp,
                                              fillColor: Colors.transparent,
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          Obx(() {
                                            return controller.isEditTitle.value
                                                ? Padding(
                                                    padding: EdgeInsets.only(right: 5.sp),
                                                    child: Divider(
                                                      height: 1,
                                                      color: ColorResources.MAIN_APP.withOpacity(.2),
                                                    ),
                                                  )
                                                : SizedBox();
                                          }),
                                          Obx(
                                            () => controller.isEditTitle.value
                                                ? SizedBox(
                                                    height: 30.sp,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {
                                                              CommonHelper.onTapHandler(callback: () {
                                                                controller.showEditTitle();
                                                                // an ban phim
                                                                FocusScope.of(context).unfocus();
                                                              });
                                                            },
                                                            icon: Icon(
                                                              Icons.close,
                                                              size: 20.sp,
                                                              color: ColorResources.MAIN_APP.withOpacity(.5),
                                                            )),
                                                        IconButton(
                                                            onPressed: () {
                                                              CommonHelper.onTapHandler(callback: () {
                                                                controller.showEditTitle();
                                                                controller.updateTask();
                                                                FocusScope.of(context).unfocus();
                                                              });
                                                            },
                                                            icon: Icon(
                                                              Icons.check,
                                                              size: 22.sp,
                                                              color: ColorResources.MAIN_APP.withOpacity(.5),
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
                                      backgroundColor: ColorResources.GREY.withOpacity(.1),
                                      child: Icon(
                                        Icons.person_2_rounded,
                                        color: ColorResources.GREY.withOpacity(.5),
                                        size: 30.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(15.sp),
                                _dropdown(),
                                Gap(25.sp),
                                Obx(
                                  () => AppInput(
                                    onSubmitted: (p0) {
                                      controller.updateTask();
                                    },
                                    height: 70.sp,
                                    controller: controller.decriptionTask,
                                    colorDisibleBorder: Color.fromARGB(255, 11, 196, 199),
                                    label: "Description".tr,
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w300,
                                        color: ColorResources.BLACK.withOpacity(.4)),
                                    labelStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: ColorResources.BLACK.withOpacity(.7)),
                                    type: AppInputType.TEXT,
                                    maxLine: 4,
                                    hintText:
                                        controller.taskModel.value[0].description == '' ? "Add description..." : '',
                                    isBorder: true,
                                    fontSize: 14.sp,
                                    fillColor: Colors.transparent,
                                    borderSide: BorderSide.none,
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                _subTask(),
                                _issueTypeBody(context),
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

  Widget _issueTypeBody(BuildContext context) {
    return Column(
      children: [
        Gap(5.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Issue type',
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300, color: ColorResources.BLACK),
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
              style:
                  TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK.withOpacity(.5)),
            ),
          ],
        ),
        Gap(15.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Assignee',
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300, color: ColorResources.BLACK),
            ),
          ],
        ),
        Gap(5.sp),
        InkWell(
          onTap: () {
            showFlexibleBottomSheet(
              minHeight: 0,
              initHeight: bottomSheetHeight,
              maxHeight: bottomSheetHeight,
              context: context,
              builder: _buildBottomSheet,
              isExpand: false,
              bottomSheetBorderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            );
          },
          child: Row(
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
              Obx(
                () => Text(
                  controller.assigneeNameUser.value.isEmpty ? "Unassigned" : controller.assigneeNameUser.value,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorResources.BLACK.withOpacity(.5),
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(15.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Labels',
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300, color: ColorResources.BLACK),
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
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.MAIN_APP),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Activity:',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK),
            ),
            Text(
              'Comments',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.MAIN_APP),
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
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.MAIN_APP),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 10.sp),
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
              style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorResources.BLACK.withOpacity(.4)),
              labelStyle:
                  TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK.withOpacity(.7)),
              type: AppInputType.TEXT,
              maxLine: 1,
              hintText: "Search members...",
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
                          "No members found",
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
                                      controller.filteredMembers.value[index].full_name ?? "",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: ColorResources.BLACK.withOpacity(.5),
                                      ),
                                    ),
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

  Widget _subTask() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Subtask',
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300, color: ColorResources.BLACK),
            ),
            Spacer(),
            Text(
              controller.listSubTask.length.toString(),
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300, color: ColorResources.BLACK),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 20.sp,
                color: ColorResources.MAIN_APP,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                width: SizeApp.setSizeWithWidth(percent: .91),
                child: TweenAnimationBuilder<double>(
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeInOut,
                    tween: Tween<double>(
                      begin: 0,
                      end: 1,
                    ),
                    builder: (context, value, _) {
                      return LinearProgressIndicator(
                        value: value,
                        valueColor: const AlwaysStoppedAnimation<Color>(ColorResources.GREEN),
                        backgroundColor: const Color.fromARGB(255, 108, 105, 105),
                        minHeight: 8,
                      );
                    }),
              ),
            ),
          ],
        ),
        Gap(20.sp),
        ListView.separated(
          shrinkWrap: true,
          itemCount: controller.listSubTask.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final subTask = controller.listSubTask[index];
            return InkWell(
              onTap: () {
                Get.find<TaskDetailController>().onInit();
              },
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    height: 20.sp,
                    width: 20.sp,
                    child: Icon(
                      Icons.call_missed_outgoing_outlined,
                      color: ColorResources.WHITE,
                      size: 16.sp,
                    ),
                  ),
                  Gap(10.sp),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subTask.title,
                        style: TextStyle(
                            fontSize: 11.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK.withOpacity(.5)),
                      ),
                      Row(
                        children: [
                          Text(
                            controller.taskModel.value[0].key ?? "",
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorResources.BLACK.withOpacity(.5)),
                          ),
                          Gap(20.sp),
                          Icon(
                            Icons.compare_arrows_rounded,
                            color: ColorResources.YELLOW,
                            size: 24.sp,
                          ),
                          Gap(10.sp),
                          Container(
                            padding: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 5.sp, bottom: 5.sp),
                            decoration: BoxDecoration(
                              color: ColorResources.GREY.withOpacity(.1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              "TO DO",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorResources.BLACK.withOpacity(.5)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Gap(20.sp);
          },
        ),
        Gap(20),
      ],
    );
  }

  Widget _dropdown() {
    return Row(
      children: [
        Obx(
          () => AppropDownButton<String>(
            iconDropdown: Icon(
              Icons.arrow_drop_down_outlined,
              color:
                  controller.dataFilter.value == "To Do" ? ColorResources.BLACK.withOpacity(.5) : ColorResources.WHITE,
            ),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color:
                  controller.dataFilter.value == "To Do" ? ColorResources.BLACK.withOpacity(.5) : ColorResources.WHITE,
            ),
            borderRadius: SizeApp.RADIUS_2X,
            height: SizeApp.setSize(percent: .05),
            backgroundColor: controller.dataFilter.value == "To Do"
                ? ColorResources.GREY.withOpacity(.1)
                : controller.dataFilter.value == "In Progress"
                    ? ColorResources.MAIN_APP
                    : controller.dataFilter.value == "Done"
                        ? Color.fromARGB(255, 6, 135, 111)
                        : ColorResources.GREY.withOpacity(.1),
            width: controller.dataFilter.value == "In Progress"
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
