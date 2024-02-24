import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/resources/app_color.dart';

class CardTitle extends StatelessWidget {
  const CardTitle(
      {super.key,
      this.icon,
      this.title,
      this.onTap,
      this.subTitle,
      this.iconRight,
      this.onTapRight,
      this.sizeIcon,
      this.colorIcon,
      this.colorTitle,
      this.colorSubTitle,
      this.sizeTitle,
      this.sizeSubTitle,
      this.sizeIconRight,
      this.colorIconRight,
      this.colorBackgroundLeft,
      this.margin,
      this.padding,
      this.borderRadius});
  final IconData? icon;
  final String? title;
  final Function()? onTap;
  final String? subTitle;
  final IconData? iconRight;
  final Function()? onTapRight;
  final double? sizeIcon;
  final Color? colorIcon;
  final Color? colorTitle;
  final Color? colorSubTitle;
  final double? sizeTitle;
  final double? sizeSubTitle;
  final double? sizeIconRight;
  final Color? colorIconRight;
  final Color? colorBackgroundLeft;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          SizeApp.setEdgeInsetsOnly(
            left: 10.sp,
            right: 1.sp,
            top: 3.sp,
            bottom: 3.sp,
          ),
      margin: margin ?? SizeApp.setEdgeInsetsOnly(top: 5.sp),
      decoration: BoxDecoration(
        color: ColorResources.WHITE,
        borderRadius: borderRadius ?? BorderRadius.circular(10.0.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: SizeApp.setEdgeInsetsAll(5.sp),
                decoration: BoxDecoration(
                  color: colorBackgroundLeft ?? ColorResources.GREY.withOpacity(.2),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Icon(
                  icon,
                  color: ColorResources.BLACK.withOpacity(.5),
                  size: 18,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title ?? '',
                    style: TextStyle(
                      fontSize: sizeTitle,
                      color: colorTitle,
                    ),
                  ),
                  subTitle != null
                      ? Text(
                          subTitle ?? '',
                          style: TextStyle(
                            fontSize: sizeSubTitle,
                            color: colorSubTitle,
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: onTapRight,
            icon: Icon(
              iconRight,
              color: colorIconRight ?? ColorResources.MAIN_APP,
              size: sizeIconRight ?? 16,
            ),
          ),
        ],
      ),
    );
  }
}
