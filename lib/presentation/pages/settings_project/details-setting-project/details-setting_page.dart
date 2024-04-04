import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:test_intern/core/hepler/app_input.dart';
import 'package:test_intern/presentation/pages/project/ui_project.dart';
import 'package:test_intern/presentation/pages/settings_project/details-setting-project/details-setting_controller.dart';
import 'package:test_intern/resources/export/core_export.dart';

class DetailsSettingPage extends GetView<DetailsSettingController> {
  const DetailsSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: SizeApp.setSize(percent: .02),
            left: SizeApp.setSizeWithWidth(percent: .05),
            right: SizeApp.setSizeWithWidth(percent: .05),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios, size: 20.sp, color: ColorResources.GREY),
                  ),
                  Text(
                    'Details'.tr,
                    style: TextStyle(color: ColorResources.BLACK, fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      controller.updateProject(
                          controller.idProjectItem, controller.nameController.text, controller.keyController.text);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.sp),
                      child: Text(
                        'SAVE'.tr,
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(50),
              GestureDetector(
                onTap: () {
                  showFlexibleBottomSheet(
                    minHeight: 0,
                    initHeight: .5,
                    maxHeight: .5,
                    context: context,
                    builder: _buildBottomSheet,
                    isExpand: false,
                    bottomSheetBorderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Obx(
                      () => ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        //add border radius here
                        child: Container(
                          width: SizeApp.setSize(percent: .1),
                          height: SizeApp.setSize(percent: .1),
                          decoration: const BoxDecoration(
                            color: ColorResources.GREY,
                          ),
                          child: AppImage(controller.avatar.value),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          size: 13,
                          color: ColorResources.GREY,
                        ),
                        Text(
                          'Change avatar'.tr,
                          style: TextStyle(color: ColorResources.GREY, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppInput(
                height: SizeApp.setSize(percent: .03),
                type: AppInputType.TEXT,
                label: 'Name'.tr,
                controller: controller.nameController,
                labelStyle: TextStyle(
                  color: ColorResources.BLACK.withOpacity(.5),
                ),
                style: const TextStyle(
                  color: ColorResources.BLACK,
                ),
              ),
              Divider(
                color: ColorResources.GREY.withOpacity(.5),
              ),
              Gap(30),
              AppInput(
                isReadOnly: true,
                height: SizeApp.setSize(percent: .03),
                type: AppInputType.TEXT,
                label: 'Key'.tr,
                labelStyle: TextStyle(
                  color: ColorResources.BLACK.withOpacity(.5),
                ),
                controller: controller.keyController,
                style: const TextStyle(
                  color: ColorResources.BLACK,
                ),
              ),
              Divider(
                color: ColorResources.GREY.withOpacity(.5),
              ),
              Gap(20),
              InkWell(
                onTap: () {
                  Get.dialog(
                    DiologApp(
                      isInput: false,
                      title: 'Move to trash'.tr,
                      content: 'setting_detail'.tr,
                      nameButtonLeft: 'Move'.tr,
                      onTap: () {
                        // onTap delete
                        controller.deleteProject(controller.idProjectItem);
                      },
                    ),
                    barrierDismissible: true,
                    transitionCurve: Curves.easeInOut,
                    useSafeArea: true,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'MOVE TO TRASH'.tr,
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
      body: Padding(
        padding: EdgeInsets.only(top: SizeApp.setSize(percent: .01), left: 30.sp, right: 30.sp),
        child: Column(
          children: [
            Text(
              "Select an avatar".tr,
              style: TextStyle(color: ColorResources.BLACK, fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            Gap(20),
            Container(
              constraints: BoxConstraints(
                maxHeight: SizeApp.setSize(percent: .4),
                minHeight: SizeApp.setSize(percent: .1),
              ),
              child: GridView.builder(
                itemBuilder: (context, index) {
                  final item = listImageProject[index];
                  return GestureDetector(
                    onTap: () => controller.changeAvatar(index, item.id ?? 0),
                    child: Stack(
                      children: [
                        Positioned.fill(
                            child: Container(
                          margin: EdgeInsets.only(bottom: 5.sp, right: 5.sp),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            child: AppImage(
                              item.imageUrl ?? '',
                            ),
                          ),
                        )
                            // Container(
                            //   width: SizeApp.setSize(percent: .1),
                            //   height: SizeApp.setSize(percent: .1),
                            //   padding: EdgeInsets.only(top: 5.sp),
                            //   margin: EdgeInsets.only(bottom: 5.sp, right: 5.sp),
                            //   decoration: BoxDecoration(
                            //     color: CommonHelper.randomColorGenerator(),
                            //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            //   ),
                            //   child: Image.network(
                            //     'https://static.vecteezy.com/system/resources/previews/011/675/382/original/man-avatar-image-for-profile-png.png',
                            //     fit: BoxFit.fitHeight,
                            //   ),
                            // ),
                            ),
                        Obx(
                          () => controller.avatarIndex.value == index
                              ? Positioned(
                                  child: Icon(Icons.check_circle, size: 16.sp, color: ColorResources.GREEN),
                                  right: 0,
                                  bottom: 0)
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: listImageProject.length,
                physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 15.sp,
                  mainAxisSpacing: 15.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
