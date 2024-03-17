import 'package:test_intern/routers/auth_router.dart';

import '../../../resources/export/core_export.dart';

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
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animationController!.forward().whenComplete(() async {
      _onLoginApp();
    });
  }

  void _onLoginApp() {
    // final _splash = sl<SharedPreferenceHelper>().getSplash;
    final _logger = sl<SharedPreferenceHelper>().getLogger;
    if (_logger) {
      Get.offAllNamed(HomeRouter.DASHBOARD);
    } else {
      // if (_splash) {
      //  Get.offAllNamed(AuthRouter.LOGIN);
      // } else {
      Get.offNamed(AuthRouter.INTRODUCTION);
      //}
    }
  }
}


