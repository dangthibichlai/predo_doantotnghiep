import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_intern/core/enums/enums.dart';
import 'package:test_intern/core/hepler/app-button.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/loading_app.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/pages/otp/otp_controller.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';

class OtpPage extends GetView<OtpController> {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BGAPP,
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back)),
            ],
          ),
          Expanded(child: bodyOtp(context)),
        ],
      )),
    );
  }

  Widget bodyOtp(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(
          left: SizeApp.setSizeWithWidth(percent: .1),
          right: SizeApp.setSizeWithWidth(percent: .1),
          top: SizeApp.SPACE_5X,
          bottom: SizeApp.setSize(percent: .03)),
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppImage(
                ImagesPath.logoApp,
                width: 50,
                height: 50,
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
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: SizeApp.setSize(percent: .45),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'opt_01'.tr,
                style: GoogleFonts.lexend(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorResources.BLACK,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: SizeApp.setSize(percent: .45),
            margin: SizeApp.setEdgeInsetsOnly(top: SizeApp.SPACE_2X, left: SizeApp.SPACE_2X, right: SizeApp.SPACE_2X),
            child: Text(
              'opt_02'.tr,
              style: GoogleFonts.lexend(
                fontSize: 12.sp,
                color: ColorResources.BLACK,
              ),
            ),
          ),
          Container(
            width: SizeApp.setSize(percent: .45),
            margin: SizeApp.setEdgeInsetsOnly(top: SizeApp.SPACE_2X),
            child: Text(
              controller.email,
              style: GoogleFonts.lexend(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: ColorResources.BLACK,
              ),
            ),
          ),
          const SizedBox(
            height: SizeApp.SPACE_2X,
          ),
          OtpInputWidget(context),
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
                controller.verifyOtp(context);
              },
              label: 'opt_03'.tr,
              colorText: ColorResources.WHITE,
              fontSizedLabel: SizeApp.LABEL_SMALL_FONT_SIZE,
              fontWeight: FontWeight.bold),
          Container(
            width: SizeApp.setSize(percent: .45),
            margin: SizeApp.setEdgeInsetsOnly(top: SizeApp.SPACE_2X),
            child: Text(
              'opt_04'.tr,
              style: GoogleFonts.lexend(
                fontSize: 12.sp,
                color: ColorResources.MAIN_APP,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ));
  }

  Widget OtpInputWidget(BuildContext context) {
    return Container(
      margin: SizeApp.setEdgeInsetsOnly(
        top: SizeApp.SPACE_5X,
        bottom: SizeApp.SPACE_5X,
      ),
      width: SizeApp.setSize(percent: 0.45),
      child: PinCodeTextField(
        controller: controller.otpController,
        keyboardType: TextInputType.number,
        appContext: context,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 300),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          fieldHeight: 50.0,
          fieldWidth: 40.0,
          activeFillColor: ColorResources.WHITE,
          inactiveColor: ColorResources.GREY,
          activeColor: ColorResources.MAIN_APP,
          selectedColor: ColorResources.MAIN_APP,
        ),
        enableActiveFill: false,
        onCompleted: (v) {},
        onChanged: (value) {},
      ),
    );
  }
}
