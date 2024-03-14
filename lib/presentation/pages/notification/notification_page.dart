import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/pages/notification/notification_controller.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});
  @override
  Widget build(BuildContext context) {
    // set màu thanh app bar

    return Scaffold(
      body: bodyEmpty(),
    );
  }

  Widget bodyEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
              ClipOval(
                child: AppImage(
                  ImagesPath.avataImg,
                  width: 30.sp,
                  height: 30.sp,
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
          child: Container(
            color: ColorResources.WHITE,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  child: Text(
                    'notification_002'.tr,
                    style: TextStyle(
                        fontSize: 12.5.sp, color: ColorResources.BLACK.withOpacity(.5), fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bodyItem() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10.sp),
          height: SizeApp.setSize(percent: .08),
          color: ColorResources.MAIN_APP,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Notification'.tr,
                style: TextStyle(color: ColorResources.WHITE, fontSize: 16.sp),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerRight,
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: ColorResources.WHITE,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
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
                    ClipOval(
                      child: AppImage(
                        ImagesPath.avataImg,
                        width: 30.sp,
                        height: 30.sp,
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
                                '[Oni18broken] Lỗi phông chữ ',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Võ Thị Thu Thúy  added an attachment to the issue',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12.sp, color: ColorResources.GREY),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text('View issue'.tr,
                                style: TextStyle(fontSize: 12.sp, color: ColorResources.MAIN_APP)),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'ONI-18-6',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12.sp, color: ColorResources.GREY),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
