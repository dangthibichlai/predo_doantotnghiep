// ignore_for_file: use_setters_to_change_properties

import 'dart:developer';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/models/auth_model.dart';
import 'package:test_intern/repositories/auth_repositories.dart';
import 'package:test_intern/resources/export/core_export.dart';
import 'package:test_intern/routers/auth_router.dart';

class OtpController extends GetxController {
  String email = '';
  TextEditingController otpController = TextEditingController();
  final AuthRepository _authRepository = GetIt.I.get<AuthRepository>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPassword = false.obs; // ẩn hiện lỗi;
  RxBool isName = false.obs;
  RxBool isPasswordRegister = false.obs;
  RxBool isShowBottomSheet = false.obs;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  void showPassword() {
    isPassword.value = !isPassword.value;
  }

  void verifyOtp(BuildContext context) {
    if (AppValidate.nullOrEmpty(otpController.text)) {
      AppAlert().warring(message: 'opt_05'.tr);
      return;
    }
    EasyLoading.show(status: 'smart_refresh_008'.tr);
    final AuthModel _authOTP = AuthModel();
    _authOTP.email = email;
    _authRepository.verify_sendOTP(
      data: _authOTP,
      onSuccess: (data) {
        showFlexibleBottomSheet(
          minHeight: 0,
          initHeight: 1,
          maxHeight: 1,
          context: context,
          builder: _buildBottomSheet,
          isExpand: false,
        );

        EasyLoading.dismiss();

        return;
      },
      onError: (e) {
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

  bool checkValidated() {
    if (AppValidate.nullOrEmpty(nameController.text)) {
      isName.value = true;
      return false;
    }
    if (passwordController.text.length < 8) {
      isPasswordRegister.value = true;
      return false;
    }
    return true;
  }

  void register() async {
    if (!checkValidated()) {
      return;
    }
    EasyLoading.show(status: 'smart_refresh_008'.tr);

    final AuthModel _authModel = AuthModel();
    _authModel.email = email;
    _authModel.password = passwordController.text;
    _authModel.full_name = nameController.text;
    _authModel.otp = otpController.text;
    await _authRepository.signUp(
      data: _authModel,
      onSuccess: (data) {
        AppAlert().success(message: 'other_0023'.tr);
        Get.offNamed(AuthRouter.LOGIN, arguments: {'emailRegister': _authModel.email});
        otpController.text = '';
        nameController.text = '';
        passwordController.text = '';
      },
      onError: (e) {
        log('Error sign up at $e');
      },
    );
    EasyLoading.dismiss();
  }

  Future<void> sendOtp() async {
    final AuthModel _authOTP = AuthModel();
    _authOTP.email = email;
    _authRepository.sendOTP(
      data: _authOTP,
      onSuccess: (data) {
        AppAlert().success(message: 'opt_success'.tr);
      },
      onError: (e) {
        log('Error sending OTP at $e');
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
    EasyLoading.dismiss();
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Scaffold(
        backgroundColor: ColorResources.BGAPP,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: SizeApp.setSize(percent: .02),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          CommonHelper.onTapHandler(callback: () {
                            Get.back();
                          });
                        },
                        icon: Icon(Icons.close, color: ColorResources.GREY, size: 20.sp)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: SizeApp.setSize(percent: .1),
                    left: SizeApp.setSizeWithWidth(percent: .1),
                    right: SizeApp.setSizeWithWidth(percent: .1)),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AppImage(
                          ImagesPath.logoApp,
                          width: 70.sp,
                          height: 70.sp,
                        ),
                        Text(
                          'Predo',
                          style: GoogleFonts.pacifico(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorResources.MAIN_APP,
                          ),
                        )
                      ],
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'veryfied'.tr,
                          style: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorResources.MAIN_APP,
                          ),
                        ),
                        Gap(4),
                        Icon(
                          Icons.check_circle,
                          color: ColorResources.GREEN,
                          size: 16.sp,
                        ),
                      ],
                    ),
                    Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'opt_06'.tr,
                          style: GoogleFonts.roboto(
                            height: .5,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w300,
                            color: ColorResources.MAIN_APP,
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'field_name'.tr,
                        label: Text('full_name'.tr),
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorResources.MAIN_APP, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorResources.MAIN_APP, width: 2),
                        ),
                      ),
                    ),
                    isName.value
                        ? Row(
                            children: [
                              Text(
                                'null_name'.tr,
                                style: GoogleFonts.roboto(
                                  fontSize: 11.sp,
                                  color: ColorResources.RED,
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                    Gap(20),
                    Obx(
                      () => TextField(
                        // đóng bàn phím khi nhấn enter
                        onSubmitted: (value) {
                          FocusScope.of(Get.context!).unfocus();

                          register();
                        },
                        //dóng bàn phím khi khi thoát khỏi textfield
                        onEditingComplete: () {
                          FocusScope.of(Get.context!).unfocus();

                          register();
                        },
                        controller: passwordController,
                        obscureText: !isPassword.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPassword.value ? Icons.visibility : Icons.visibility_off,
                              color: isPassword.value ? ColorResources.MAIN_APP : ColorResources.GREY,
                            ),
                            onPressed: () {
                              showPassword();
                            },
                          ),
                          hintText: 'field_password'.tr,
                          label: Text('password'.tr,
                              style: GoogleFonts.roboto(fontSize: 12.sp, color: ColorResources.GREY)),
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorResources.MAIN_APP, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorResources.MAIN_APP, width: 2),
                          ),
                        ),
                      ),
                    ),
                    Gap(7),
                    Text("veryfied_pass".tr,
                        style: GoogleFonts.roboto(
                            fontSize: 11.sp,
                            color: isPasswordRegister.value ? ColorResources.RED : ColorResources.GREY)),
                    Container(
                      width: SizeApp.setSize(percent: .45),
                      margin: SizeApp.setEdgeInsetsOnly(bottom: SizeApp.SPACE_2X, top: SizeApp.SPACE_2X),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'By registering, I accept'.tr,
                              style: GoogleFonts.lexend(
                                color: ColorResources.BLACK,
                                fontSize: SizeApp.BODY_MEDIUM_FONT_SIZE,
                              ),
                            ),
                            TextSpan(
                              text: ' Terms of Service'.tr,
                              style: GoogleFonts.lexend(
                                  color: ColorResources.BLACK,
                                  fontSize: SizeApp.BODY_MEDIUM_FONT_SIZE,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                            TextSpan(
                              text: 'and acknowledge'.tr,
                              style: GoogleFonts.lexend(
                                color: ColorResources.BLACK,
                                fontSize: SizeApp.BODY_MEDIUM_FONT_SIZE,
                              ),
                            ),
                            TextSpan(
                              text: ' Privacy Policy'.tr,
                              style: GoogleFonts.lexend(
                                  color: ColorResources.BLACK,
                                  fontSize: SizeApp.BODY_MEDIUM_FONT_SIZE,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppButton(
                        fillColor: ColorResources.MAIN_APP,
                        colorBorder: ColorResources.WHITE,
                        withBorder: 2,
                        type: AppButtonType.OUTLINE,
                        width: SizeApp.setSizeWithWidth(percent: .8),
                        padding: SizeApp.setEdgeInsetsOnly(
                          top: SizeApp.setSize(percent: .01),
                          bottom: SizeApp.setSize(percent: .01),
                        ),
                        margin: SizeApp.setEdgeInsetsOnly(
                          bottom: SizeApp.SPACE_2X,
                        ),
                        borderRadius: 5.sp,
                        onTap: () {
                          CommonHelper.onTapHandler(callback: () {
                            FocusScope.of(Get.context!).unfocus();

                            register();
                          });
                        },
                        label: 'Continue'.tr,
                        colorText: ColorResources.WHITE,
                        fontSizedLabel: SizeApp.LABEL_SMALL_FONT_SIZE,
                        fontWeight: FontWeight.bold),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
