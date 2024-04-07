// ignore_for_file: invalid_use_of_protected_member

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:test_intern/presentation/pages/home/home_controller.dart';
import 'package:test_intern/presentation/widget/bottom_builder_setting.dart';
import 'package:test_intern/presentation/widget/change_avatar.dart';
import 'package:test_intern/resources/export/core_export.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Obx(
          () => controller.isLoading.value
              ? Container(height: SizeApp.getMaxHeight(), alignment: Alignment.center, child: LoadingApp())
              : Padding(
                  padding: SizeApp.setEdgeInsetsOnly(
                    left: 10.sp,
                    right: 10.sp,
                    top: SizeApp.setSize(percent: .019),
                  ),
                  child: Column(children: <Widget>[
                    Row(
                      children: <Widget>[
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
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                            child: Container(
                              width: SizeApp.setSize(percent: 0.04),
                              height: SizeApp.setSize(percent: 0.04),
                              decoration: BoxDecoration(
                                color: ColorResources.GREY.withOpacity(.5),
                              ),
                              child: AppImage(ImagesPath.logoApp,
                                  width: SizeApp.setSizeWithWidth(percent: 0.1)), //add image location here
                            ),
                          ),
                        ),
                        Gap(15),
                        Text(
                          'Predo',
                          style: GoogleFonts.pacifico(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorResources.MAIN_APP,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.sp, left: 15.sp, right: 15.sp, bottom: 15.sp),
                      margin: EdgeInsets.only(
                          top: SizeApp.setSize(percent: .05),
                          left: SizeApp.setSizeWithWidth(percent: .02),
                          right: SizeApp.setSizeWithWidth(percent: .02),
                          bottom: SizeApp.setSize(percent: .035)),
                      decoration: BoxDecoration(
                          color: ColorResources.BGAPP,
                          borderRadius: BorderRadius.circular(10.sp),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 202, 204, 209).withOpacity(.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            )
                          ]),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("home_01".tr.toUpperCase()),
                            ],
                          ),
                          Gap(10),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => ChangeAvatarWidget(
                                    callBackPickFile: (file) {
                                      controller.getFileFromPicket(file);
                                    },
                                    imagePath: controller.user.value.avatar == ""
                                        ? ImagesPath.avataImg
                                        : controller.user.value.avatar,
                                    isEdit: true,
                                    isAvatar: true,
                                  ),
                                ),
                                Gap(20),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Gap(10),
                                      Text(
                                        controller.user.value.full_name ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                      Gap(2),
                                      Text(controller.user.value.email ?? '',
                                          maxLines: 1, overflow: TextOverflow.ellipsis),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recently viewed tasks".tr,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Obx(
                      () => controller.listTaskRecent.value.length == 0
                          ? InkWell(
                              onTap: () {
                                Get.toNamed(HomeRouter.CREATEPROJECT);
                              },
                              child: Column(
                                children: [
                                  Gap(20),
                                  AppImage(
                                    ImagesPath.imgHomeRecentEmpty,
                                    width: SizeApp.setSizeWithWidth(percent: .5),
                                  ),
                                  Gap(10),
                                  Text(
                                    "No recent tasks".tr,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                  ),
                                  Gap(20),
                                ],
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(
                                  top: SizeApp.setSize(percent: .02), bottom: SizeApp.setSize(percent: .04)),
                              constraints: BoxConstraints(
                                maxHeight: SizeApp.setSize(percent: .28),
                                minHeight: SizeApp.setSize(percent: .1),
                              ),
                              child: Obx(
                                () => GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  // shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2.7,
                                    crossAxisSpacing: 10.sp,
                                    mainAxisSpacing: 10.sp,
                                  ),
                                  itemBuilder: (context, index) {
                                    final task = controller.listTaskRecent.value[index];
                                    return InkWell(
                                      onTap: () {
                                        Get.toNamed(HomeRouter.TASKDETAIL, arguments: {'idTask': task.idTask});
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(5.sp),
                                          decoration: BoxDecoration(
                                            color: ColorResources.BGAPP,
                                            borderRadius: BorderRadius.circular(10.sp),
                                          ),
                                          child: Row(children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: AppImage(
                                                task.avatarProject ?? '',
                                                width: SizeApp.setSize(percent: .04),
                                                height: SizeApp.setSize(percent: .04),
                                              ),
                                            ),
                                            Gap(5),
                                            Expanded(
                                              child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      task.name ?? '',
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      task.nameProject ?? '',
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ]),
                                            ),
                                          ])),
                                    );
                                  },
                                  itemCount: controller.listTaskRecent.take(6).length,
                                ),
                              ),
                            ),
                    ),
                    feedback(),
                    Gap(20),
                  ]),
                ),
        ),
      ),
    );
  }

  Widget feedback() {
    return Container(
      width: SizeApp.getMaxWidth(),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorResources.GREY.withOpacity(.2)),
          boxShadow: [
            BoxShadow(
              color: ColorResources.WHITE.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("panel_01".tr, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
          Text("panel_02".tr,
              style: TextStyle(
                color: Colors.black,
              )),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
              onTap: () {
                CommonHelper.onTapHandler(callback: () {
                  controller.submitFeedback();
                });
              },
              child: Text("Send Feeback".tr, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }
}
