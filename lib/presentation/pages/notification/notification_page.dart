// ignore_for_file: invalid_use_of_protected_member

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/core/hepler/common_helper.dart';
import 'package:test_intern/core/hepler/loading_app.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/core/hepler/smart_refresher.dart';
import 'package:test_intern/presentation/pages/notification/notification_controller.dart';
import 'package:test_intern/presentation/widget/bottom_builder_setting.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});
  @override
  Widget build(BuildContext context) {
    // set màu thanh app bar

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 15.0, right: 15.0, top: SizeApp.setSize(percent: .013), bottom: SizeApp.setSize(percent: .005)),
            color: ColorResources.BGAPP,
            child: Row(
              children: [
                Text('Notifications'.tr, style: TextStyle(fontSize: 20.sp)),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_list_rounded,
                      size: 24.sp,
                      color: ColorResources.BLACK.withOpacity(.5),
                    )),
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
                  child: CircleAvatar(
                    backgroundColor: ColorResources.GREY.withOpacity(.5),
                    child: AppImage(
                      ImagesPath.logoApp,
                      width: 30.sp,
                      height: 30.sp,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert_outlined,
                      size: 24.sp,
                      color: ColorResources.BLACK.withOpacity(.5),
                    )),
              ],
            ),
          ),
          Expanded(
              child:
                  //  bodyEmpty(),
                  bodyItem()),
        ],
      ),
    );
  }

  Widget bodyEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: ColorResources.WHITE,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppImage(
                ImagesPath.notificationEmpty,
                height: SizeApp.setSize(percent: .15),
              ),
              SizedBox(
                height: SizeApp.setSize(percent: .04),
              ),
              Text(
                'notification_001'.tr,
                style: TextStyle(fontSize: 18.sp, color: ColorResources.BLACK, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: SizeApp.setSizeWithWidth(percent: .9),
                child: Center(
                  child: Text(
                    'notification_002'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12.5.sp, color: ColorResources.BLACK.withOpacity(.5), fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bodyItem() {
    return AppSmartRefresher(
      onRefresh: () {
        controller.getNotification(isRefresh: true);
      },
      enablePullUp: true,
      enablePullDown: true,
      onLoading: () {
        controller.getNotification(isRefresh: false);
      },
      refreshController: controller.refreshController,
      child: Obx(() {
        if (controller.isLoading.value) {
          return LoadingApp(
            titleLoading: 'smart_refresh_008'.tr,
          );
        }
        if (!controller.isLoading.value && controller.notification.isEmpty) {
          return bodyEmpty();
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: controller.notification.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: ColorResources.GREY.withOpacity(.5), width: 1),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: ClipOval(
                      child: AppImage(
                        ImagesPath.avataImg,
                        width: 30.sp,
                        height: 30.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              controller.notification[index].title ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          controller.notification[index].description ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.sp, color: ColorResources.GREY),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!AppValidate.nullOrEmpty(controller.notification[index].refId?.taskId)) {
                              controller.routeToDetailTask(controller.notification[index].refId?.taskId ?? '');
                            }
                          },
                          child:
                              Text('View issue'.tr, style: TextStyle(fontSize: 12.sp, color: ColorResources.MAIN_APP)),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm')
                        .format(DateTime.parse(controller.notification[index].createdAt ?? '')),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.sp, color: ColorResources.GREY),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
