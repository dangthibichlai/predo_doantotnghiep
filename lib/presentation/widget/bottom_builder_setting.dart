// ignore_for_file: invalid_use_of_protected_member

import 'package:test_intern/presentation/pages/home/home_controller.dart';
import 'package:test_intern/presentation/pages/home/ui_model.dart';
import 'package:test_intern/resources/export/core_export.dart';

Widget buildBottomSheet(
  BuildContext context,
  ScrollController scrollController,
  double bottomSheetOffset,
) {
  return Scaffold(
      backgroundColor: ColorResources.BGAPP,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: SizeApp.setSize(percent: .03),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        CommonHelper.onTapHandler(callback: () {
                          Get.back();
                        });
                      },
                      icon: Icon(Icons.close, color: ColorResources.GREY, size: 20.sp)),
                  Text('Settings', style: GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 16.sp)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: SizeApp.setSize(percent: .01),
                  left: SizeApp.setSizeWithWidth(percent: .05),
                  right: SizeApp.setSizeWithWidth(percent: .1)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: ClipOval(
                            child: AppImage(
                              Get.find<HomeController>().user.value.avatar == ""
                                  ? ImagesPath.logoApp
                                  : Get.find<HomeController>().user.value.avatar!,
                              width: SizeApp.setSizeWithWidth(percent: 0.1),
                              height: SizeApp.setSizeWithWidth(percent: 0.1),
                            ),
                          ),
                        ),
                      ),
                      Gap(15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Get.find<HomeController>().user.value.full_name ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w400, fontSize: 13.sp, color: ColorResources.MAIN_APP),
                            ),
                            Text(
                              Get.find<HomeController>().user.value.email ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w300, fontSize: 11.sp, color: ColorResources.BLACK),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(10),
            Divider(
              color: ColorResources.GREY.withOpacity(.2),
            ),
            Expanded(
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = uiModelHomeSetting[index];
                    return InkWell(
                        onTap: () {
                          Get.find<HomeController>().ontapSetting(index);
                        },
                        child: _settingHome(item.icon ?? Icons.settings, item.title ?? ''));
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: ColorResources.GREY.withOpacity(.2),
                    );
                  },
                  itemCount: uiModelHomeSetting.length),
            )
          ],
        ),
      ));
}

Widget _settingHome(IconData icon, String title) {
  return Padding(
    padding: EdgeInsets.only(
        left: SizeApp.setSizeWithWidth(percent: .05),
        right: SizeApp.setSizeWithWidth(percent: .1),
        top: 5.sp,
        bottom: 5.sp),
    child: Row(
      children: [
        Icon(icon, color: ColorResources.BLACK, size: 20.sp),
        Gap(20),
        Text(title.tr,
            style: GoogleFonts.lexend(fontWeight: FontWeight.w300, fontSize: 14.sp, color: ColorResources.BLACK)),
      ],
    ),
  );
}
