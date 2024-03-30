// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/cupertino.dart';
import 'package:test_intern/presentation/pages/grant_permission/grant_permission_component/grant_permission_banner.dart';
import 'package:test_intern/presentation/pages/grant_permission/grant_permission_controller.dart';
import 'package:test_intern/resources/export/core_export.dart';

class GrantPermissionPage extends GetView<GrantPermissionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00001A),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              child: SizedBox(
                  height: SizeApp.setSize(percent: .2),
                  width: SizeApp.getMaxWidth(),
                  child: AppImage(ImagesPath.premiumIcon))),
          const GrantPermissionBanner(),

          // Body.
          Positioned.fill(
            child: Padding(
              padding: SizeApp.setEdgeInsetsOnly(
                bottom: SizeApp.setSize(percent: .08),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: SizeApp.setSize(percent: .28),
                        width: SizeApp.getMaxWidth(),
                        margin: SizeApp.setEdgeInsetsSymmetric(
                          horizontal: SizeApp.SPACE_HORIZONTAL_SCREEN,
                          vertical: SizeApp.setSize(percent: .05),
                        ),
                        decoration: BoxDecoration(
                          color: ColorResources.WHITE,
                          borderRadius: SizeApp.setBorderRadiusAll(radius: SizeApp.RADIUS_3X),
                        ),
                        padding: SizeApp.setEdgeInsetsOnly(
                          left: SizeApp.setSizeWithWidth(percent: .02),
                          right: SizeApp.setSizeWithWidth(percent: .02),
                          top: SizeApp.setSizeWithWidth(percent: .27),
                          // bottom: SizeApp.SPACE_2X,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: SizeApp.setEdgeInsetsOnly(bottom: SizeApp.SPACE_2X),
                              child: Text(
                                'permission_01'.tr,
                                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                      color: ColorResources.BLACK,
                                    ),
                              ),
                            ),
                            Text(
                              'permission_02'.tr,
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorResources.BLACK.withOpacity(.5),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppImage(ImagesPath.premiumIcon_2, width: SizeApp.setSizeWithWidth(percent: .2)),
                      const SizedBox(width: SizeApp.SPACE_2X),
                      AppImage(ImagesPath.premiumIcon_3, width: SizeApp.setSizeWithWidth(percent: .17)),
                      const SizedBox(width: SizeApp.SPACE_4X),
                      AppImage(ImagesPath.premiumIcon_4, width: SizeApp.setSizeWithWidth(percent: .17)),
                    ],
                  ),
                  // Body.
                  Container(
                    margin: SizeApp.setEdgeInsetsSymmetric(
                      horizontal: SizeApp.SPACE_HORIZONTAL_SCREEN,
                      vertical: SizeApp.SPACE_5X,
                    ),
                    padding: SizeApp.setEdgeInsetsAll(SizeApp.SPACE_3X),
                    width: SizeApp.getMaxWidth(),
                    decoration: BoxDecoration(
                      color: ColorResources.WHITE.withOpacity(.2),
                      borderRadius: SizeApp.setBorderRadiusAll(radius: SizeApp.RADIUS_3X),
                    ),
                    child: Obx(() {
                      return Column(
                        children: [
                          Padding(
                            padding: SizeApp.setEdgeInsetsOnly(bottom: SizeApp.SPACE_2X),
                            child: _permission(
                              context: context,
                              title: 'permission_03'.tr,
                              valueSwitch: controller.notificationStatus.value,
                              onChangeSwitch: (val) {
                                controller.requestPermissionsNotification();
                              },
                            ),
                          ),
                          Padding(
                            padding: SizeApp.setEdgeInsetsOnly(bottom: SizeApp.SPACE_2X),
                            child: _permission(
                              context: context,
                              title: 'permission_04'.tr,
                              valueSwitch: controller.recordStatus.value,
                              onChangeSwitch: (val) {
                                controller.requestPermissionsRecord();
                              },
                            ),
                          ),
                          _permission(
                            context: context,
                            title: 'permission_05'.tr,
                            valueSwitch: controller.cameraStatus.value,
                            onChangeSwitch: (val) {
                              controller.requestPermissionsCamera();
                            },
                          ),
                        ],
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            // height: SizeApp.setSize(percent: .2),
            left: SizeApp.setSizeWithWidth(percent: .36),
            top: SizeApp.setSizeWithWidth(percent: .28),
            child: AppImage(
              ImagesPath.premiumIcon_1,
              height: SizeApp.setSize(percent: .22),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: SizeApp.setEdgeInsetsOnly(top: SizeApp.SPACE_2X),
        child: InkWell(
          onTap: () {
            CommonHelper.onTapHandler(callback: () {
              Get.back();
            });
          },
          child: const Icon(
            Icons.close,
            size: 30,
            color: ColorResources.WHITE,
          ),
        ),
      ),
    );
  }

  Row _permission({
    required BuildContext context,
    required String title,
    required bool valueSwitch,
    required Function(bool value) onChangeSwitch,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w600, color: ColorResources.WHITE),
          ),
        ),
        Transform.scale(
          scale: 0.8,
          child: CupertinoSwitch(
            activeColor: Colors.orange,
            trackColor: ColorResources.LIGHT_GREY,
            thumbColor: ColorResources.WHITE,
            value: valueSwitch,
            onChanged: (value) {
              CommonHelper.onTapHandler(callback: () {
                onChangeSwitch(value);
              });
            },
          ),
        )
      ],
    );
  }
}
