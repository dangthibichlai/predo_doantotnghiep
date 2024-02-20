// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_intern/resources/di_container.dart';
import 'package:test_intern/routers/home_router.dart';
import 'package:test_intern/services/share_preference._helper.dart';

class NotificationController extends GetxController {
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
    //
    //  Listen change remote config.
    _listenChangeRemoteConfig();
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

  ///
  /// Listen change remote config.
  ///
  void _listenChangeRemoteConfig() {
    // if (!firebaseRemoteConfigService.remoteConfigModel.value.Native_onborading!) {
    //   onErrorLoadAds();

    showButton();
    //// }

    //firebaseRemoteConfigService.remoteConfigModel.listen((p0) {
    //   if (p0.Native_onborading!) {
    //     sizeErrorAds.value = 0;
    //   } else {
    //     onErrorLoadAds();
    //   }
    // });
  }

  ///
  /// On change page index.
  ///
  void onChangePageIndex({required int index}) {
    currentPageIndex.value = index;
  }

  ///
  /// Skip intro.
  ///
  void skipIntro() {
    pageController.jumpToPage(2);
  }

  ///
  /// On error load ads.
  ///
  void onErrorLoadAds() {
    sizeErrorAds.value = 360;
  }

  ///
  /// Next p.age
  ///
  void nextPage() {
    if (currentPageIndex.value == 2) {
      sl<SharedPreferenceHelper>().setSplash(status: true);
      Get.toNamed(HomeRouter.HOME);
      return;
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
  }

  ///
  /// Skip intro.
  ///
  void closeIntro() {
    Get.toNamed(HomeRouter.HOME);
  }

  ///
  /// Show button.
  ///
  void showButton() {
    isShowButton.value = true;
  }
}
