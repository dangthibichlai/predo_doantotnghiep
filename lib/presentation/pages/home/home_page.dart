// ignore_for_file: invalid_use_of_protected_member

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:test_intern/presentation/pages/home/home_controller.dart';
import 'package:test_intern/presentation/pages/home/ui_model.dart';
import 'package:test_intern/resources/export/core_export.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BGAPP,
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: LoadingApp())
            : Padding(
                padding: SizeApp.setEdgeInsetsOnly(
                  left: 10.sp,
                  right: 10.sp,
                  top: SizeApp.setSize(percent: .019),
                ),
                child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          CommonHelper.onTapHandler(callback: () {
                            showFlexibleBottomSheet(
                              duration: Duration(milliseconds: 500),
                              minHeight: 0,
                              initHeight: 1,
                              maxHeight: 1,
                              context: context,
                              builder: _buildBottomSheet,
                              isExpand: false,
                            );
                          });
                        },
                        child: Container(
                          // margin:  EdgeInsets.all(SizeApp.setSize(percent: .019)),
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
                      Gap(15),
                      Text(
                        controller.users.value[0].full_name ?? '',
                        style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400, fontSize: 16.sp, color: ColorResources.MAIN_APP),
                      ),
                      // Spacer(),
                      // IconButton(
                      //     iconSize: 30,
                      //     onPressed: () {},
                      //     icon: const Icon(
                      //       Icons.add_rounded,
                      //     ))
                    ],
                  ),
                  const SizedBox(
                    height: SizeApp.RADIUS_4X,
                  ),
                  Row(children: <Widget>[
                    Text(
                      'Quick access'.tr,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 15.sp),
                    ),
                  ]),
                  Container(
                    margin: const EdgeInsets.only(
                        left: SizeApp.RADIUS_2X, top: SizeApp.RADIUS_5X, right: SizeApp.RADIUS_2X),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: const EdgeInsets.all(SizeApp.RADIUS_2X),
                            child: AppImage(
                              ImagesPath.imgHomeAccessEmpty,
                              width: SizeApp.setSizeWithWidth(percent: 0.1),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Personalize this space'.tr,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 16.sp),
                              ),
                              const SizedBox(
                                height: SizeApp.RADIUS_2X,
                              ),
                              Text(
                                'Add your most important stuff here, for fast access'.tr,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 12.sp),
                              ),
                              const SizedBox(
                                height: SizeApp.RADIUS_2X,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Add items'.tr,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w500, fontSize: 14.sp, color: ColorResources.MAIN_APP),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: SizeApp.RADIUS_3X,
                  ),
                  Row(children: <Widget>[
                    Text(
                      'Recent items'.tr,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 15.sp),
                    ),
                  ]),
                  Container(
                    margin: const EdgeInsets.only(
                        left: SizeApp.RADIUS_2X, top: SizeApp.RADIUS_5X, right: SizeApp.RADIUS_2X),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: const EdgeInsets.all(SizeApp.RADIUS_2X),
                            child: AppImage(
                              ImagesPath.imgHomeRecentEmpty,
                              width: SizeApp.setSizeWithWidth(percent: 0.3),
                            ),
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Personalize this space'.tr,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 16.sp),
                              ),
                              const SizedBox(
                                height: SizeApp.RADIUS_2X,
                              ),
                              Text(
                                'Add your most important stuff here, for fast access'.tr,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.notoSans(fontWeight: FontWeight.w500, fontSize: 12.sp),
                              ),
                              const SizedBox(
                                height: SizeApp.RADIUS_2X,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Add items'.tr,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w500, fontSize: 14.sp, color: ColorResources.MAIN_APP),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
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
                              controller.users.value[0].full_name ?? '',
                              style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w400, fontSize: 13.sp, color: ColorResources.MAIN_APP),
                            ),
                            Text(
                              controller.users.value[0].email ?? '',
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
                            controller.ontapSetting(index);
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
}
