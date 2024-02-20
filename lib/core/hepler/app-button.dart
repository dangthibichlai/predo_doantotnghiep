// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:test_intern/core/enums/enums.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/resources/app_color.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onTap,
    this.label,
    this.height,
    this.maxLine,
    this.type = AppButtonType.DEFAULT,
    this.isEnabled = true,
    this.padding,
    this.margin,
    this.borderRadius,
    this.icon,
    this.iconRight,
    this.imageUrlIconRight,
    this.color = ColorResources.WHITE,
    this.colorBGDisabled = ColorResources.GREY,
    this.colorDisable = ColorResources.OUTER_SPACE,
    this.colorBG = ColorResources.WHITE,
    this.colorIcon,
    this.colorText,
    this.imageUrlIcon,
    this.withBorder,
    this.width,
    this.fontSizedLabel,
    this.space,
    this.fontWeight,
    this.colorBorder,
    this.fillColor,
    this.sizeIcon,
    this.isGradient = false,
    this.gradientColorList,
  }) : super(key: key);

  final String? label;
  final Color? color;
  final Color? colorDisable;
  final Color? colorBGDisabled;
  final Color? colorBG;
  final Function onTap;
  final double? height;
  final int? maxLine;
  final AppButtonType? type;
  final Color? colorIcon;
  final Color? colorText;
  final Color? colorBorder;
  final Color? fillColor;

  final bool? isEnabled;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;
  final IconData? icon, iconRight;
  final String? imageUrlIcon, imageUrlIconRight;
  final double? withBorder;
  final double? width;
  final double? fontSizedLabel;
  final double? space;
  final double? sizeIcon;
  final FontWeight? fontWeight;
  final bool? isGradient;
  final List<Color>? gradientColorList;

  Color getColorBG(AppButtonType type) {
    if (type == AppButtonType.DEFAULT) {
      if (isEnabled!) {
        return colorBG!;
      }
      return colorBGDisabled!;
    } else if (type == AppButtonType.OUTLINE) {
      if (isEnabled!) {
        return fillColor ?? ColorResources.WHITE;
      }
      return ColorResources.WHITE;
    }
    return colorBG!;
  }

  Color getColor(AppButtonType type) {
    if (type == AppButtonType.DEFAULT) {
      if (isEnabled!) {
        return color!;
      }
      return colorDisable!;
    } else if (type == AppButtonType.OUTLINE) {
      if (isEnabled!) {
        return colorBG!;
      }
      return ColorResources.GREY;
    }
    return color!;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: isEnabled!
            ? () {
                onTap();
              }
            : null,
        child: Container(
          width: width ?? SizeApp.getMaxWidth(),
          padding: padding ??
              SizeApp.setEdgeInsetsSymmetric(
                  vertical: SizeApp.SPACE_2X, horizontal: SizeApp.SPACE_2X),
          margin: margin ?? SizeApp.setEdgeInsetsSymmetric(vertical: 5),
          decoration: BoxDecoration(
            gradient: !isGradient!
                ? null
                : LinearGradient(
                    colors: gradientColorList ??
                        [
                          const Color(0xff309FB0).withOpacity(1),
                          const Color(0xff0E2938).withOpacity(0.3),
                          const Color(0xff0E2938).withOpacity(.6),
                          const Color(0xff0E2938).withOpacity(0.3),
                          const Color(0xff309FB0).withOpacity(1),
                        ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [-0.1, 0.6, 0.5, 0.6, 1.4],
                  ),
            color: getColorBG(type!),
            border: type == AppButtonType.DEFAULT
                ? null
                : Border.all(
                    color: colorBorder ?? ColorResources.WHITE.withOpacity(.3),
                    width: withBorder ?? 1,
                  ),
            borderRadius: SizeApp.setBorderRadiusAll(radius: borderRadius ?? 100),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!AppValidate.nullOrEmpty(imageUrlIcon))
                SizedBox(
                  height: sizeIcon ?? SizeApp.setSize(percent: .1),
                  width: sizeIcon ?? SizeApp.setSize(percent: .1),
                  child: AppImage(
                    imageUrlIcon.toString(),
                  ),
                ),
              if (icon != null)
                Icon(
                  icon,
                  color: colorIcon ?? getColor(type!),
                  size: sizeIcon ?? SizeApp.setSize(percent: .1),
                )
              else
                const SizedBox(),
              SizedBox(
                width: space == null ? 0 : SizeApp.setSize(percent: .1) * space!,
              ),
              if (label != null)
                Flexible(
                  child: Text(
                    " $label",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: fontSizedLabel ?? SizeApp.LABEL_MEDIUM_FONT_SIZE,
                          color: colorText ?? getColor(type!),
                          fontWeight: fontWeight ?? FontWeight.w700,
                        ),
                    maxLines: maxLine ?? 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              if (!AppValidate.nullOrEmpty(imageUrlIconRight))
                SizedBox(
                  height: SizeApp.setSize(percent: .2),
                  width: SizeApp.setSize(percent: .2),
                  child: AppImage(
                    imageUrlIconRight.toString(),
                  ),
                ),
              if (iconRight != null)
                Icon(
                  iconRight,
                  color: colorIcon ?? getColor(type!),
                  size: SizeApp.setSize(percent: .125),
                )
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
