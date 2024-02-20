import 'package:flutter/material.dart';
import 'package:test_intern/core/hepler/common_helper.dart';
import 'package:test_intern/resources/app_color.dart';

class IntroButtonWidget extends StatelessWidget {
  const IntroButtonWidget({
    super.key,
    required this.callBack,
    this.width,
    this.padding,
    this.textStyle,
    required this.isShowStart,
  });

  final Function callBack;
  final double? width;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final bool isShowStart;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CommonHelper.onTapHandler(callback: () {
          callBack();
        });
      },
      child: Text(
        isShowStart ? 'Tiếp tục' : 'Bắt đầu',
        style: textStyle ??
            Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: ColorResources.WHITE,
                ),
      ),
    );
  }
}
