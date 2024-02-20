import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/resources/app_color.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: SizeApp.setSize(percent: .14),
        padding: SizeApp.setEdgeInsetsOnly(
          top: SizeApp.setSize(percent: .01),
          left: SizeApp.SPACE_HORIZONTAL_SCREEN,
          right: SizeApp.setSizeWithWidth(percent: .05),
        ),
        child: _bigTitle(context),
      ),
    );
  }

  Widget _bigTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: SizeApp.setEdgeInsetsOnly(bottom: SizeApp.SPACE_1X, top: SizeApp.SPACE_3X),
          child: Text(
            title,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: ColorResources.WHITE,
                  fontSize: 20.sp,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: ColorResources.WHITE,
                fontSize: 14.sp,
              ),
        ),
      ],
    );
  }
}
