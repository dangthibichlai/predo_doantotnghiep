import '../../../resources/export/core_export.dart';

class ChangeLanguagePage extends GetView<ChangeLanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      appBar: AppBar(
        backgroundColor: ColorResources.BACKGROUND,
        elevation: 0,
        title: Text(
          'change_language'.tr,
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorResources.WHITE,
              ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorResources.WHITE,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: CommonHelper.backGroundScaffold,
        ),
        width: SizeApp.getMaxWidth(),
        height: SizeApp.getMaxHeight(),
        child: GetBuilder(
          init: ChangeLanguageController(),
          builder: (ChangeLanguageController controller) {
            if (controller.isLoading) {
              return const Center(child: LoadingApp());
            }
            return GridView.builder(
              padding: SizeApp.setEdgeInsetsSymmetric(horizontal: SizeApp.SPACE_2X, vertical: SizeApp.SPACE_3X),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.multipleLanguages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: SizeApp.SPACE_1X,
                crossAxisSpacing: SizeApp.SPACE_1X,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    CommonHelper.onTapHandler(callback: () {
                      controller.onSelectLanguage(index);
                    });
                  },
                  child: Stack(
                    children: [
                      Positioned(
                        left: SizeApp.SPACE_1X,
                        top: SizeApp.SPACE_1X,
                        right: SizeApp.SPACE_1X,
                        bottom: 0,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: (controller.multipleLanguages[index]['isSelected'] as bool)
                                ? ColorResources.BACK_GROUND
                                : ColorResources.GREY.withOpacity(.05),
                            borderRadius: BorderRadius.circular(SizeApp.RADIUS_3X),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipOval(
                                child: AppImage(
                                  controller.multipleLanguages[index]['image'].toString(),
                                  width: SizeApp.setSize(percent: .08),
                                  height: SizeApp.setSize(percent: .08),
                                ),
                              ),
                              if (!(controller.multipleLanguages[index]['isSelected'] as bool))
                                Text(
                                  controller.multipleLanguages[index]['name'].toString(),
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: ColorResources.WHITE.withOpacity(.5),
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                            ],
                          ),
                        ),
                      ),
                      if (controller.multipleLanguages[index]['isSelected'] as bool)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: SizeApp.setEdgeInsetsAll(SizeApp.SPACE_1X),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  ColorResources.PRIMARY_1,
                                  ColorResources.PRIMARY_4,
                                ],
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: AppImage(
                              ImagesPath.iapIcDoneIcon,
                              width: SizeApp.setSize(percent: .015),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
