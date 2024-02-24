import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/pages/splash/splash_controller.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';

// ignore: must_be_immutable
class SplashPage extends GetView<SplashController> {
  double progressValue = 0.5;

  SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.BGAPP,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: AppImage(ImagesPath.logoApp)),
              
            ],
          ),
          const Spacer(),
          Padding(
            padding: SizeApp.setEdgeInsetsOnly(bottom: 40.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        width: SizeApp.setSizeWithWidth(percent: .85),
                        child: TweenAnimationBuilder<double>(
                            duration: const Duration(seconds: 3),
                            curve: Curves.easeInOut,
                            tween: Tween<double>(
                              begin: 0,
                              end: 1,
                            ),
                            builder: (context, value, _) {
                              return LinearProgressIndicator(
                                value: value,
                                valueColor: const AlwaysStoppedAnimation<Color>(ColorResources.MAIN_APP),
                                backgroundColor:
                                    const Color.fromARGB(255, 108, 105, 105),
                                minHeight: 8,
                              );
                            }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SizeApp.SPACE_2X,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
