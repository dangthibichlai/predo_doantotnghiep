import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_intern/resources/export/core_export.dart';

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({
    super.key,
    required this.title,
    required this.callBackSuccess,
    required this.callBackCancel,
  });
  final String title;
  final Function() callBackSuccess;
  final Function() callBackCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: SizeApp.setEdgeInsetsSymmetric(
        horizontal: SizeApp.setSizeWithWidth(percent: .12),
      ),
      width: SizeApp.getMaxWidth(),
      decoration: BoxDecoration(
        color: ColorResources.WHITE,
        borderRadius: SizeApp.setBorderRadiusAll(radius: SizeApp.RADIUS_3X),
      ),
      padding: SizeApp.setEdgeInsetsAll(SizeApp.SPACE_HORIZONTAL_SCREEN),
      child: Column(
        children: [
          AppImage(
            ImagesPath.permissionIcOpen,
            width: SizeApp.setSize(percent: .13),
          ),
          Padding(
            padding: SizeApp.setEdgeInsetsSymmetric(
              vertical: SizeApp.SPACE_5X,
              horizontal: SizeApp.SPACE_1X,
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorResources.BLACK,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                colorBG: ColorResources.WHITE,
                margin: EdgeInsets.zero,
                padding: SizeApp.setEdgeInsetsSymmetric(vertical: SizeApp.SPACE_3X),
                borderRadius: SizeApp.RADIUS_3X,
                fontSizedLabel: 14.sp,
                width: SizeApp.setSizeWithWidth(percent: .3),
                onTap: () {
                  Get.back();
                  callBackCancel();
                },
                colorText: ColorResources.BLACK,
                label: 'permission_07'.tr,
                type: AppButtonType.OUTLINE,
              ),
              SizedBox(width: 12.w),
              AppButton(
                margin: EdgeInsets.zero,
                padding: SizeApp.setEdgeInsetsSymmetric(vertical: SizeApp.SPACE_3X),
                borderRadius: SizeApp.RADIUS_3X,
                fontSizedLabel: 14.sp,
                width: SizeApp.setSizeWithWidth(percent: .3),
                onTap: () {
                  Get.back();
                  callBackSuccess();
                },
                label: 'permission_06'.tr,
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
