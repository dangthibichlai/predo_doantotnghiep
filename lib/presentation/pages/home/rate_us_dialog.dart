import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test_intern/resources/export/core_export.dart';

class RateUsDialog extends StatefulWidget {
  const RateUsDialog({super.key, required this.callBack});

  final Function callBack;

  @override
  State<RateUsDialog> createState() => _RateUsDialogState();
}

class _RateUsDialogState extends State<RateUsDialog> {
  ///
  /// Declare the data.
  final List<String> _rateUsList = [
    ImagesPath.rateIc1Star,
    ImagesPath.rateIc2Star,
    ImagesPath.rateIc3Star,
    ImagesPath.rateIc4Star,
    ImagesPath.rateIc5Star,
  ];
  int? _currentRate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: SizeApp.setEdgeInsetsSymmetric(
            horizontal: SizeApp.setSizeWithWidth(percent: .15),
          ),
          width: SizeApp.getMaxWidth(),
          decoration: BoxDecoration(
            color: ColorResources.BROW,
            borderRadius: SizeApp.setBorderRadiusAll(radius: SizeApp.RADIUS_6X),
          ),
          child: Column(
            children: [
              AppImage(
                _currentRate == null ? ImagesPath.rateIc5Star : _rateUsList[_currentRate! - 1], //
                width: SizeApp.setSizeWithWidth(percent: .4),
              ),
              Padding(
                padding: SizeApp.setEdgeInsetsSymmetric(horizontal: SizeApp.SPACE_5X),
                child: Text(
                  'rate'.tr,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorResources.WHITE,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'rate_1'.tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(0xFF00B2FF),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: SizeApp.setEdgeInsetsOnly(
                      top: SizeApp.SPACE_3X,
                      left: SizeApp.SPACE_1X,
                    ),
                    child: AppImage(
                      ImagesPath.rateIcArrowRight,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: SizeApp.setEdgeInsetsOnly(
                  top: SizeApp.SPACE_2X,
                  bottom: SizeApp.SPACE_5X,
                ),
                child: RatingBar.builder(
                  unratedColor: ColorResources.WHITE,
                  glowColor: Colors.transparent,
                  initialRating: 5,
                  minRating: 1,
                  itemSize: 35,
                  maxRating: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, index) {
                    return AppImage(
                      (_currentRate != null && _currentRate! - 1 >= index)
                          ? ImagesPath.rateIcSelectStar
                          : ImagesPath.rateIcUnSelectStar,
                      width: SizeApp.setSize(percent: 0.01),
                      colorIconsSvg: ((_currentRate != null && _currentRate! - 1 >= index) || index == 4)
                          ? ColorResources.YELLOW
                          : ColorResources.WHITE,
                    );
                  },
                  onRatingUpdate: (rating) {
                    _currentRate = AppNumber.parseInt(rating);
                    setState(() {});
                  },
                ),
              ),
              AppButton(
                margin: SizeApp.setEdgeInsetsOnly(
                  left: SizeApp.SPACE_4X,
                  right: SizeApp.SPACE_4X,
                  bottom: SizeApp.SPACE_2X,
                ),
                colorBG: ColorResources.BACKGROUND,
                height: SizeApp.setSizeWithWidth(percent: .1),
                fontSizedLabel: 14.sp,
                label: 'setting_5'.tr,
                onTap: () {
                  Get.back();
                  widget.callBack(_currentRate);
                },
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: SizeApp.setEdgeInsetsOnly(bottom: SizeApp.SPACE_2X),
                  width: SizeApp.setSize(percent: .04),
                  height: SizeApp.setSize(percent: .04),
                  decoration: BoxDecoration(
                    color: ColorResources.WHITE.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.close,
                      color: ColorResources.WHITE,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
