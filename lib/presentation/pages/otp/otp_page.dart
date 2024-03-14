import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_intern/core/enums/enums.dart';
import 'package:test_intern/core/hepler/app-button.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/pages/otp/otp_controller.dart';
import 'package:test_intern/presentation/widget/introduction_component/close_button_widget.dart';
import 'package:test_intern/presentation/widget/otp_component/otp_input_widget.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';

class OtpPage extends GetView<OtpController> {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.BGAPP,
      body: GetBuilder(
        init: OtpController(),
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: SizeApp.setEdgeInsetsOnly(
                top: SizeApp.setSize(percent: .1),
              ),
              child: SizedBox(
                width: SizeApp.getMaxWidth(),
                height: SizeApp.getMaxHeight(),
                child: _bodyOtp(),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: CloseButtonWidget(
        callBack: () {
          controller.showButton();
        },
      ),
    );
  }

  Widget _bodyOtp() {
    return Center(
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
          margin: SizeApp.setEdgeInsetsOnly(top: SizeApp.SPACE_2X),
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
            'buinguyennhattan12122002@gmail.com',
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
        const OtpInputWidget(),
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
            onTap: () {},
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
    ));
  }
}
