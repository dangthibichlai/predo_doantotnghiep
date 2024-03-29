// ignore_for_file: invalid_use_of_protected_member

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:test_intern/core/enums/enums.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/app_input.dart';
import 'package:test_intern/core/hepler/common_helper.dart';
import 'package:test_intern/core/hepler/loading_app.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/core/hepler/smart_refresher.dart';
import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/presentation/pages/issue/issue_controller.dart';
import 'package:test_intern/presentation/pages/issue/ui_model.dart';
import 'package:test_intern/presentation/pages/task/ui_issue_type.dart';
import 'package:test_intern/presentation/widget/bottom_builder_setting.dart';
import 'package:test_intern/presentation/widget/card_title.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';

import '../../widget/title_custom.dart';

class IssuePage extends GetView<IssueController> {
  const IssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BGAPP,
      body: Padding(
        padding: SizeApp.setEdgeInsetsOnly(
          left: 10.sp,
          right: 10.sp,
          top: SizeApp.setSize(percent: .019),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    CommonHelper.onTapHandler(callback: () {
                      showFlexibleBottomSheet(
                        duration: Duration(milliseconds: 500),
                        minHeight: 0,
                        initHeight: 1,
                        maxHeight: 1,
                        context: context,
                        builder: buildBottomSheet,
                        isExpand: false,
                      );
                    });
                  },
                  child: Container(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      //add border radius here
                      child: Container(
                        width: SizeApp.setSize(percent: 0.04),
                        height: SizeApp.setSize(percent: 0.04),
                        decoration: const BoxDecoration(
                          color: ColorResources.GREY,
                        ),
                        child: Image.network(
                            'https://static.vecteezy.com/system/resources/previews/011/675/382/original/man-avatar-image-for-profile-png.png'),
                      ), //add image location here
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          controller.showSearch();
                        },
                        icon: Icon(Icons.search)),
                  ],
                ),
              ],
            ),
            TitleCustom(
              title: "Issues".tr,
            ),
            GestureDetector(
              onTap: () {
                showFlexibleBottomSheet(
                  minHeight: 0,
                  initHeight: 1,
                  maxHeight: 1,
                  context: context,
                  builder: _buildBottomSheet,
                  isExpand: false,
                );
              },
              child: Obx(
                () => CardTitle(
                  icon: filterList[controller.index.value].icon,
                  title: filterList[controller.index.value].title,
                  colorTitle: ColorResources.BLACK,
                  sizeTitle: 12.sp,
                  iconRight: Icons.keyboard_arrow_down_rounded,
                  sizeIconRight: 20.sp,
                ),
              ),
            ),
            Obx(
              () => controller.isShowSearch.value
                  ? Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                      child: AppInput(
                        onChanged: (value) {
                          controller.searchProjectFilter(value);
                        },
                        prefixIcon: (FocusNode) {
                          return Icon(
                            Icons.search,
                            color: ColorResources.BLACK.withOpacity(.5),
                            size: 20.sp,
                          );
                        },
                        height: SizeApp.setSize(percent: .07),
                        controller: controller.searchProject,
                        colorDisibleBorder: Color.fromARGB(255, 11, 196, 199),
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorResources.BLACK.withOpacity(.4)),
                        labelStyle: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK.withOpacity(.7)),
                        type: AppInputType.TEXT,
                        maxLine: 1,
                        hintText: "Search project...".tr,
                        isBorder: true,
                        fontSize: 14.sp,
                        fillColor: Colors.transparent,
                        underLine: UnderlineInputBorder(),
                      ),
                    )
                  : SizedBox.shrink(),
            ),
            Obx(() => controller.filteredDataList.value.length == 0 && controller.isLoading.value != true
                ? bodyEmpy()
                : bodyItem()),
          ],
        ),
      ),
    );
  }

  Widget bodyItem() {
    return Obx(
      () => Expanded(
        child: Container(
          width: SizeApp.getMaxWidth(),
          margin: EdgeInsets.only(top: 20.sp, bottom: 20.sp),
          padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 10.sp, bottom: 10.sp),
          decoration: BoxDecoration(
            color: ColorResources.WHITE,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: AppSmartRefresher(
              onRefresh: () {
                controller.changeOption(controller.option.value, true);
              },
              enablePullUp: true,
              enablePullDown: true,
              onLoading: () {
                controller.changeOption(controller.option.value, false);
              },
              refreshController: controller.refreshController,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final item = controller.filteredDataList.value[index];
                  final uiIssueTypeItem = UIIssueType.getUIIssueType(
                      issueTypeValues.reverse[item.issueType] ?? IssueType.USER_STORY.toString());

                  if (controller.isLoading.value) {
                    return LoadingApp(
                      titleLoading: 'smart_refresh_008'.tr,
                    );
                  }
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 7.0, top: 7.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  // color: item.color ?? ColorResources.GREEN,
                                  color: uiIssueTypeItem?.color ?? ColorResources.GREEN,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                height: 16.sp,
                                width: 16.sp,
                                child: Icon(
                                  //item.icon ??
                                  uiIssueTypeItem?.icon ?? Icons.bookmark_outlined,
                                  color: ColorResources.WHITE,
                                  size: 12.sp,
                                ),
                              ),
                              Gap(10.sp),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: SizeApp.setSizeWithWidth(percent: .7),
                                    child: Text(
                                      controller.filteredDataList.value[index].title ?? "",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      //item.name ?? "",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                          color: ColorResources.BLACK.withOpacity(.5)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeApp.setSizeWithWidth(percent: .7),
                                    child: Text(
                                      controller.filteredDataList.value[index].key ?? "",
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w300,
                                          color: ColorResources.BLACK.withOpacity(.5)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: controller.filteredDataList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: ColorResources.GREY.withOpacity(.2),
                  );
                },
              )),
        ),
      ),
    );
  }

  Widget bodyEmpy() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImage(
            ImagesPath.issueImage,
            width: SizeApp.setSizeWithWidth(percent: .28),
          ),
          Gap(50),
          Center(
            child: Text(
              'No issues to show'.tr,
              style: TextStyle(
                fontSize: 18.sp,
                color: ColorResources.BLACK,
              ),
            ),
          ),
          SizedBox(
            width: SizeApp.setSizeWithWidth(percent: .7),
            height: SizeApp.setSize(percent: .1),
            child: Text(
              'issue_When you'.tr,
              style: TextStyle(
                fontSize: 16.sp,
                color: ColorResources.BLACK.withOpacity(.5),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Scaffold(
      backgroundColor: ColorResources.BGAPP,
      body: Padding(
        padding: EdgeInsets.only(top: SizeApp.setSize(percent: .04), left: 10.sp, right: 10.sp),
        child: Column(
          children: [
            headerBottomSheet(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // TitleCustom(
                    //   title: "Recent filters",
                    //   sizeTitle: 11.sp,
                    // ),
                    // ListView.builder(
                    //     shrinkWrap: true,
                    //     physics: NeverScrollableScrollPhysics(),
                    //     itemBuilder: (context, index) => CardTitle(
                    //           icon: Icons.person_2_outlined,
                    //           title: 'My open issues'.tr,
                    //           colorTitle: ColorResources.BLACK,
                    //           sizeTitle: 12.sp,
                    //           iconRight: Icons.star_border_rounded,
                    //           sizeIconRight: 24.sp,
                    //         ),
                    //     itemCount: 3),
                    Padding(
                      padding: SizeApp.setEdgeInsetsOnly(top: 10.sp, bottom: 5.sp),
                      child: TitleCustom(
                        title: "Default filters".tr,
                        sizeTitle: 11.sp,
                      ),
                    ),
                    defaultBottomSheet(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget defaultBottomSheet() {
    return Container(
      height: SizeApp.setSize(percent: .375),
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
        color: ColorResources.WHITE,
        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
      ),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final item = filterList[index];
          return InkWell(
            onTap: () {
              controller.changeIndex(index);
              controller.changeOption(item.option, true);
              Get.back();
            },
            child: CardTitle(
              padding: SizeApp.setEdgeInsetsOnly(
                left: 10.sp,
                right: 3.sp,
                top: 1.sp,
                bottom: 1.sp,
              ),
              margin: EdgeInsets.all(0),
              icon: item.icon,
              title: item.title,
              colorTitle: ColorResources.BLACK,
              sizeTitle: 12.sp,
              iconRight: Icons.star_border_rounded,
              sizeIconRight: 24.sp,
              colorIconRight: ColorResources.GREY,
            ),
          );
        },
        itemCount: filterList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: SizeApp.setEdgeInsetsOnly(
              left: 10.sp,
              right: 10.sp,
            ),
            child: Divider(color: ColorResources.GREY.withOpacity(.2)),
          );
        },
      ),
    );
  }

  Widget headerBottomSheet() {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
          onPressed: () {
            Get.back();
          },
          // opticalSize là

          icon: Icon(
            Icons.arrow_back_rounded,
            fill: 0,
          ),
        ),
        Text(
          'Filters',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
