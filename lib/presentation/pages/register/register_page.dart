import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_intern/core/enums/enums.dart';
import 'package:test_intern/core/hepler/app-button.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/pages/register/register_controller.dart';
import 'package:test_intern/presentation/widget/introduction_component/close_button_widget.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';
import 'package:test_intern/routers/auth_router.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      body: GetBuilder(
        init: RegisterController(),
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: SizeApp.setEdgeInsetsOnly(
                top: SizeApp.setSize(percent: .1),
              ),
              child: SizedBox(
                width: SizeApp.getMaxWidth(),
                height: SizeApp.getMaxHeight(),
                child: _bodyRegister(),
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

  Widget _bodyRegister() {
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
        Text(
          'Đăng ký để tiếp tục',
          style: GoogleFonts.lexend(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorResources.BLACK,
          ),
        ),
        Container(
          margin: SizeApp.setEdgeInsetsOnly(
              top: SizeApp.RADIUS_3X, bottom: SizeApp.RADIUS_1X),
          width: SizeApp.setSize(percent: .35),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Nhập email của bạn',
              contentPadding: EdgeInsets.only(left: 10, right: 10),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorResources.MAIN_APP, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorResources.MAIN_APP, width: 2),
              ),
            ),
          ),
        ),
        Container(
          width: SizeApp.setSize(percent: .35),
          margin: SizeApp.setEdgeInsetsOnly(
              bottom: SizeApp.SPACE_2X, top: SizeApp.SPACE_2X),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Bằng việc đăng ký, tôi chấp nhận ',
                  style: GoogleFonts.lexend(
                    color: ColorResources.BLACK,
                    fontSize: SizeApp.BODY_MEDIUM_FONT_SIZE,
                  ),
                ),
                TextSpan(
                  text: 'Điều khoản dịch vụ',
                  style: GoogleFonts.lexend(
                      color: ColorResources.BLACK,
                      fontSize: SizeApp.BODY_MEDIUM_FONT_SIZE,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                TextSpan(
                  text: ' và công nhận ',
                  style: GoogleFonts.lexend(
                    color: ColorResources.BLACK,
                    fontSize: SizeApp.BODY_MEDIUM_FONT_SIZE,
                  ),
                ),
                TextSpan(
                  text: 'Chính sách quyền riêng tư',
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
              Get.toNamed(AuthRouter.OTP);
            },
            label: 'Tiếp tục',
            colorText: ColorResources.WHITE,
            fontSizedLabel: SizeApp.LABEL_SMALL_FONT_SIZE,
            fontWeight: FontWeight.bold),
        Container(
          margin: SizeApp.setEdgeInsetsOnly(
              top: SizeApp.RADIUS_1X, bottom: SizeApp.RADIUS_3X),
          child: Text(
            'Hoặc đăng nhập với',
            style: GoogleFonts.lexend(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: ColorResources.BLACK,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              margin: SizeApp.setEdgeInsetsOnly(bottom: SizeApp.RADIUS_1X),
              child: AppButton(
                fillColor: ColorResources.WHITE,
                colorBorder: ColorResources.GREY,
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
                sizeIcon: SizeApp.setSize(percent: 0.03),
                imageUrlIcon: ImagesPath.googleIcon,
                label: 'Google',
                fontSizedLabel: 14.sp,
                colorText: ColorResources.BLACK,
              ),
            ),
            Container(
              margin: SizeApp.setEdgeInsetsOnly(bottom: SizeApp.RADIUS_1X),
              child: AppButton(
                fillColor: ColorResources.WHITE,
                colorBorder: ColorResources.GREY,
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
                sizeIcon: SizeApp.setSize(percent: 0.03),
                imageUrlIcon: ImagesPath.facebookIcon,
                label: 'Facebook',
                colorText: ColorResources.BLACK,
                fontSizedLabel: 14.sp,
              ),
            ),
            Container(
              margin: SizeApp.setEdgeInsetsOnly(bottom: SizeApp.RADIUS_1X),
              child: AppButton(
                fillColor: ColorResources.WHITE,
                colorBorder: ColorResources.GREY,
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
                sizeIcon: SizeApp.setSize(percent: 0.03),
                imageUrlIcon: ImagesPath.microsoftIcon,
                label: 'Microsoft',
                fontSizedLabel: 14.sp,
                colorText: ColorResources.BLACK,
              ),
            ),
            Container(
              margin: SizeApp.setEdgeInsetsOnly(bottom: SizeApp.RADIUS_1X),
              child: AppButton(
                fillColor: ColorResources.WHITE,
                colorBorder: ColorResources.GREY,
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
                sizeIcon: SizeApp.setSize(percent: 0.03),
                imageUrlIcon: ImagesPath.slackIcon,
                label: 'Slack',
                fontSizedLabel: 14.sp,
                colorText: ColorResources.BLACK,
              ),
            ),
          ],
        )
      ],
    ));
  }
}
