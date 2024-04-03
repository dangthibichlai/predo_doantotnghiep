// ignore_for_file: invalid_use_of_protected_member

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:test_intern/presentation/pages/home/home_controller.dart';
import 'package:test_intern/presentation/widget/bottom_builder_setting.dart';

import '../../resources/export/core_export.dart';

class AvataHeaderWidget extends GetView<HomeController> {
  final bool? typeSquare;
  const AvataHeaderWidget({super.key, this.typeSquare = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: typeSquare ?? false
          ? Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: ClipOval(
                child: AppImage(
                  controller.avatar == "" ? ImagesPath.logoApp : controller.avatar,
                  width: SizeApp.setSizeWithWidth(percent: 0.1),
                  height: SizeApp.setSizeWithWidth(percent: 0.1),
                ),
              ),
            )
          : ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              //add border radius here
              child: Container(
                width: SizeApp.setSize(percent: 0.04),
                height: SizeApp.setSize(percent: 0.04),
                decoration: BoxDecoration(
                  color: ColorResources.GREY.withOpacity(.5),
                ),
                child: AppImage(
                    controller.avatar == ""
                        ? ImagesPath.logoApp
                        : controller.avatar,
                    width: SizeApp.setSizeWithWidth(percent: 0.1)), //add image location here
              ),
            ),
    );
  }
}
