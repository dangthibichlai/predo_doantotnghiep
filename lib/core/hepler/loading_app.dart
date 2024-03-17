import 'package:flutter/material.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';

class LoadingApp extends StatelessWidget {
  const LoadingApp({
    Key? key,
    this.titleLoading,
    this.titleStyle,
    this.useLoadingLogo = true,
    this.titleColor,
    this.size,
    this.sizeLogo,
  }) : super(key: key);

  final String? titleLoading;
  final TextStyle? titleStyle;
  final bool? useLoadingLogo;
  final Color? titleColor;
  final double? size;
  final double? sizeLogo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (useLoadingLogo!)
          SizedBox(
            width: size ?? SizeApp.setSize(percent: .1),
            height: size ?? SizeApp.setSize(percent: .1),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(
                  child: AppImage(
                    ImagesPath.loadingLogo,
                    width: sizeLogo ?? SizeApp.setSize(percent: .05),
                  ),
                ),
                SizedBox(
                  width: size ?? SizeApp.setSize(percent: .14),
                  height: size ?? SizeApp.setSize(percent: .14),
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(ColorResources.MAIN_APP),
                    strokeWidth: 3,
                  ),
                ),
              ],
            ),
          ),
        if (!AppValidate.nullOrEmpty(titleLoading))
          Padding(
            padding: SizeApp.setEdgeInsetsOnly(top: 10),
            child: Text(
              titleLoading!,
              style: titleStyle ??
                  Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: titleColor ?? ColorResources.GREY,
                      ),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
