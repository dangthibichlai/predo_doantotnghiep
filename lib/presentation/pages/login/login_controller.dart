// ignore_for_file: use_setters_to_change_properties

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/enums/enums.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/models/auth_model.dart';
import 'package:test_intern/repositories/auth_repositories.dart';
import 'package:test_intern/resources/di_container.dart';
import 'package:test_intern/routers/home_router.dart';
import 'package:test_intern/services/dio/dio_client.dart';
import 'package:test_intern/services/share_preference._helper.dart';
import 'package:test_intern/services/social_auth/social_auth_service.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthRepository _authRepository = GetIt.I.get<AuthRepository>();
  final DioClient _dioClient = GetIt.I.get<DioClient>();
  final SocialAuthService _socialAuthService = GetIt.I.get<SocialAuthService>();

  RxBool isShowPassword = false.obs; // ẩn hiện lỗi
  RxBool isEmail = false.obs;
  RxBool isPassword = false.obs;
  // String emailRouter = Get.arguments['emailRegister'] ?? '';
  RxBool isLogin = false.obs;

  @override
  void onInit() {
    // emailRouter = Get.arguments['emailRegister'] ?? '';
    // emailController.text = emailRouter;
    super.onInit();
  }

  void showPassword() {
    isPassword.value = !isPassword.value;
  }

  bool _validateLoginWithLocal() {
    if (!AppValidate.nullOrEmpty(emailController.text) && !AppValidate.nullOrEmpty(passwordController.text)) {
      return true;
    } else {
      if (AppValidate.nullOrEmpty(emailController.text)) {
        isEmail.value = true;
      }
      if (AppValidate.nullOrEmpty(passwordController.text)) {
        isShowPassword.value = true;
      }

      return false;
    }
  }

  Future<void> loginApp({required SocialType socialType}) async {
    EasyLoading.show(status: 'loading'.tr);
    final AuthModel _authModel = AuthModel();
    String deviceID = sl<SharedPreferenceHelper>().getTokenDevice;
    switch (socialType) {
      case SocialType.GOOGLE:
        await _socialAuthService.googleAuth().then(
          (gUser) {
            if (gUser != null) {
              // Create data.
              _authModel.social_id = gUser.user!.uid.toString();
              _authModel.social_type = socialType.name;
              _authModel.full_name = gUser.user!.displayName;
              _authModel.email = gUser.user!.email;
              //  _authModel.avatar = gUser.user!.photoURL;
              _authModel.fcm_token = [deviceID];
              _callAPILogin(auth: _authModel, isLoginWithLocal: false, socialType: SocialType.GOOGLE);
            } else {
              log('Login Google failed');
            }
          },
        );
        EasyLoading.dismiss();
        break;

      default:
        // Create data.
        if (_validateLoginWithLocal()) {
          _authModel.email = emailController.text.trim();
          _authModel.password = passwordController.text.trim();
          // _authModel.password = passwordController.text.trim();
          _callAPILogin(
            auth: AuthModel(email: emailController.text, password: passwordController.text, fcm_token: [deviceID]),
            isLoginWithLocal: true,
            socialType: socialType,
          );
        }
        EasyLoading.dismiss();
    }
    // _callAPILogin(
    //   auth: AuthModel(email: emailController.text, password: passwordController.text, fcm_token: [deviceID]),
    //   isLoginWithLocal: true,
    //   socialType: socialType,
    // );
  }

  void _callAPILogin({required AuthModel auth, required bool isLoginWithLocal, required SocialType socialType}) {
    _authRepository.signIn(
      isSignInWithLocal: isLoginWithLocal,
      data: auth,
      onSuccess: (data) async {
        if (!isLoginWithLocal) {
          sl<SharedPreferenceHelper>().setJwtToken(data.accessToken.toString());
          sl<SharedPreferenceHelper>().setLogger(idLogger: true);
          sl<SharedPreferenceHelper>().setIdUser(idUser: data.id.toString());
        }
        // Refresh dio.
        await _dioClient.refreshToken();
        EasyLoading.dismiss();
        if (isLoginWithLocal) {
          sl<SharedPreferenceHelper>().setJwtToken(data.accessToken.toString());
          sl<SharedPreferenceHelper>().setLogger(idLogger: true);
          sl<SharedPreferenceHelper>().setIdUser(idUser: data.id.toString());
          AppAlert().success(message: 'other_0023'.tr);
          Get.offAllNamed(HomeRouter.DASHBOARD);
          emailController.clear();
          passwordController.clear();
          return;
        } else {
          AppAlert().success(message: 'other_0023'.tr);
          Get.offAllNamed(HomeRouter.DASHBOARD);
        }
      },
      onError: (e) {
        log('Error login with local at $e');
        EasyLoading.dismiss();
        final locale = sl<SharedPreferenceHelper>().getLocale;
        if (locale == 'en') {
          AppAlert().info(message: e);
        } else if (locale == 'vi' && e == 'Account has been removed from the system.') {
          AppAlert().info(message: 'other_0022'.tr);
        } else {
          AppAlert().info(message: e);
        }
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
