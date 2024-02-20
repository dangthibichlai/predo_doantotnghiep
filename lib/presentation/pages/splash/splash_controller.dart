// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_intern/routers/auth_router.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  ///
  /// Declare API.
  late AnimationController? _animationController;

  // Open ads when open add and resumed app.
  bool isAllowShowLoading = true;
  RxDouble progressValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    progressValue = 0.0.obs;

    // check status logged in or not.
    _setStatusLogin();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  ///
  /// check status logged in or not.
  ///
  void _setStatusLogin() {
    // install _animationController
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animationController!.forward().whenComplete(() async {
      Get.offNamed(AuthRouter.INTRODUCTION);
    });

    // check logged in or not.
  }

  // void updateProgress(double value) {
  //   progressValue.value = value;
  // }

  ///
  /// On login app.
  ///
  // void _onLoginApp() {
  //   final _splash = sl<SharedPreferenceHelper>().getSplash;
  //   final _logger = sl<SharedPreferenceHelper>().getLogger;
  //   if (_splash) {
  //     if (_logger) {
  //       Get.offNamed(HomeRouter.HOME);
  //     } else {
  //        Get.offNamed(AuthRouters.INTRODUCTION);
  //      // Get.offNamed(AuthRouters.PACKAGE_DESCRIPTION);
  //     }
  //   } else {
  //     Get.offNamed(AuthRouters.INTRODUCTION);
  //   }
  // }
}
