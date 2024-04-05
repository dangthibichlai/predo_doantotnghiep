import 'package:test_intern/resources/export/core_export.dart';

void chooseMediaOptionsDialog(
  BuildContext context, {
  Function? onCameraTap,
  Function? onGalleryTap,
}) {
  Get.bottomSheet(
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 9),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(
                horizontal: 17.w,
                vertical: SizeApp.SPACE_2X,
              ),
              child: const Icon(
                Icons.close,
                color: ColorResources.BLACK,
                size: 25,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                if (onCameraTap != null) onCameraTap();
                Get.back();
              },
              child: Column(
                children: [
                  AppImage(
                    ImagesPath.cameraIc,
                    height: 40.h,
                    colorIconsSvg: ColorResources.PRIMARY_1,
                  ),
                  const SizedBox(height: SizeApp.SPACE_2X),
                  Text(
                    'action_09'.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: ColorResources.BLACK,
                        ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if (onGalleryTap != null) onGalleryTap();
                Get.back();
              },
              child: Column(
                children: [
                  AppImage(
                    ImagesPath.icGallery,
                    height: 40.h,
                    colorIconsSvg: ColorResources.PRIMARY_1,
                  ),
                  const SizedBox(height: SizeApp.SPACE_1X),
                  Text(
                    'action_10'.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: ColorResources.BLACK,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 28)
      ],
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
  );
}
