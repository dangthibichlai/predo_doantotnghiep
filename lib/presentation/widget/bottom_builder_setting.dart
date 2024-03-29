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
                      Container(
                        // margin:  EdgeInsets.all(SizeApp.setSize(percent: .019)),
                        child: ClipOval(
                          // borderRadius: const BorderRadius.all(Radius.circular(5.0)),
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
                      Gap(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Get.find<HomeController>().users.value[0].full_name ?? '',
                            style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w400, fontSize: 13.sp, color: ColorResources.MAIN_APP),
                          ),
                          Text(
                            Get.find<HomeController>().users.value[0].email ?? '',
                            style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w300, fontSize: 11.sp, color: ColorResources.BLACK),
                          ),
                        ],
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
