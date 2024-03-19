// ignore_for_file: use_setters_to_change_properties

import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/core/hepler/app_input.dart';
import 'package:test_intern/models/auth_model.dart';
import 'package:test_intern/repositories/auth_repositories.dart';
import 'package:test_intern/routers/auth_router.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  final AuthRepository _authRepository = GetIt.I.get<AuthRepository>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    isLoading = false.obs;
    super.onInit();
  }

  void register() {
    if (AppValidate.nullOrEmpty(emailController.text)) {
      AppAlert().warring(message: 'Vui lòng điền đầy đủ thông tin'.tr);
      return;
    }
    if (!AppValidate.isValidEmail(emailController.text)) {
      AppAlert().warring(message: 'Email không hợp lệ'.tr);
      return;
    }
    _sendOtp();
  }

  void _sendOtp() {
    isLoading.value = true;
    EasyLoading.show(status: 'loading'.tr);

    final AuthModel _authOTP = AuthModel();
    _authOTP.email = emailController.text;
    _authRepository.sendOTP(
      data: _authOTP,
      onSuccess: (data) {
        // ẩn bàn phím
        isLoading.value = false;
        Get.toNamed(AuthRouter.OTP, arguments: {'email': emailController.text});
        log('Send OTP success at $data');
      },
      onError: (e) {
        log('Error sending OTP at $e');
      },
    );
    EasyLoading.dismiss();
  }

  @override
  void onClose() {
    emailController.dispose();
    EasyLoading.dismiss();

    super.onClose();
  }
}
