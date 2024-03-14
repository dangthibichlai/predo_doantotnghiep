import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:test_intern/core/hepler/app_input.dart';
import 'package:test_intern/presentation/pages/settings_project/details-setting-project/details-setting_controller.dart';
import 'package:test_intern/resources/export/core_export.dart';

class DetailsSettingPage extends GetView<DetailsSettingController> {
  const DetailsSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project details".tr),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeApp.setSize(percent: .1),
            bottom: SizeApp.setSize(percent: .02),
            left: SizeApp.setSizeWithWidth(percent: .05),
            right: SizeApp.setSizeWithWidth(percent: .05),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      //add border radius here
                      child: Container(
                        width: SizeApp.setSize(percent: .1),
                        height: SizeApp.setSize(percent: .1),
                        decoration: const BoxDecoration(
                          color: ColorResources.GREY,
                        ),
                        child: Image.network(
                            'https://static.vecteezy.com/system/resources/previews/011/675/382/original/man-avatar-image-for-profile-png.png'),
                      ), //add image location here
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
                          'Change avatar',
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
                      content:
                          'The project (and every thing it contains) will be availble in the trash for 60 days, before being permanently deleted. Only app admins can restore projects from the trash'
                              .tr,
                      nameButtonLeft: 'Move'.tr,
                      onTap: () {
                        // onTap delete
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
                      'MOVE TO TRASH',
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
                  return GestureDetector(
                    onTap: () => controller.changeAvatar(index),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            width: SizeApp.setSize(percent: .1),
                            height: SizeApp.setSize(percent: .1),
                            padding: EdgeInsets.only(top: 5.sp),
                            margin: EdgeInsets.only(bottom: 5.sp, right: 5.sp),
                            decoration: BoxDecoration(
                              color: CommonHelper.randomColorGenerator(),
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Image.network(
                              'https://static.vecteezy.com/system/resources/previews/011/675/382/original/man-avatar-image-for-profile-png.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Obx(
                          () => controller.avatarIndex.value == index
                              ? Positioned(
                                  child: Icon(Icons.check_circle, size: 16.sp, color: ColorResources.MAIN_APP),
                                  right: 0,
                                  bottom: 0)
                              : SizedBox.shrink(),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
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
