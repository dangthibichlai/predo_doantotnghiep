import 'package:test_intern/resources/export/core_export.dart';

class GenerateDialog extends StatelessWidget {
  const GenerateDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AppImage(
            ImagesPath.backgraoundGeneral,
            width: SizeApp.getMaxWidth(),
          ),
        ),
        Container(
          margin: SizeApp.setEdgeInsetsSymmetric(
            horizontal: SizeApp.setSizeWithWidth(percent: .1),
          ),
          width: SizeApp.getMaxWidth(),
          height: SizeApp.getMaxHeight(),
          child: Column(
            children: [
              AppImage(
                ImagesPath.premiumIcon,
                width: SizeApp.setSize(percent: .4),
              ),
              Text(
                'text_speech_06'.tr,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(height: SizeApp.setSize(percent: .03)),
              const LinearProgressIndicator(
                backgroundColor: ColorResources.WHITE,
                color: ColorResources.MAIN_APP,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
