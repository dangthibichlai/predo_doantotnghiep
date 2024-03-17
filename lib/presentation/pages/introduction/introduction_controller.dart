// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_intern/resources/di_container.dart';
import 'package:test_intern/routers/auth_router.dart';
import 'package:test_intern/routers/home_router.dart';
import 'package:test_intern/services/share_preference._helper.dart';

class IntroductionController extends GetxController {
  ///
  /// Declare API.
  //final FirebaseRemoteConfigService firebaseRemoteConfigService = GetIt.I.get<FirebaseRemoteConfigService>();

  ///
  /// Declare controller.
  final PageController pageController = PageController();

  /// Declare the data.
  RxInt currentPageIndex = 0.obs;
  RxBool isShowButton = false.obs;
  Rx<double> sizeErrorAds = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();

    // Close Stream.
    currentPageIndex.close();
    isShowButton.close();
    sizeErrorAds.close();
    super.onClose();
  }

  void onChangePageIndex({required int index}) {
    currentPageIndex.value = index;
  }

  void nextPageLogin() {
    sl<SharedPreferenceHelper>().setSplash(status: true);
    Get.toNamed(AuthRouter.LOGIN);
    return;
  }

  void nextPageRegister() {
    sl<SharedPreferenceHelper>().setSplash(status: true);
    Get.toNamed(AuthRouter.REGISTER);
    return;
  }
}
