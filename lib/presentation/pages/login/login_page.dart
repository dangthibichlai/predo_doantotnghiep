import 'package:test_intern/routers/auth_router.dart';

import '../../../resources/export/core_export.dart';
import 'package:test_intern/presentation/pages/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorResources.BGAPP,
      body: SafeArea(
        child: _bodyLogin(),
      ),
    );
  }

  Widget _bodyLogin() {
    return Center(
        child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  CommonHelper.onTapHandler(callback: () {
                    Get.toNamed(AuthRouter.INTRODUCTION);
                  });
                },
                icon: Icon(Icons.arrow_back)),
          ],
        ),
        Gap(SizeApp.setSize(percent: .05)),
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
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Đăng nhập để tiếp tục',
          style: GoogleFonts.lexend(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorResources.BLACK,
          ),
        ),
        Container(
          margin: SizeApp.setEdgeInsetsOnly(top: SizeApp.RADIUS_2X, bottom: SizeApp.RADIUS_1X),
          width: SizeApp.setSizeWithWidth(percent: .8),
          child: TextField(
            controller: controller.emailController,
            decoration: InputDecoration(
              hintText: 'Nhập email của bạn',
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
        Obx(
          () => controller.isEmail.value
              ? SizedBox(
                  width: SizeApp.setSizeWithWidth(percent: .8),
                  child: Text(
                    'Vui lòng nhập Email của bạn',
                    style: GoogleFonts.lexend(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                      color: ColorResources.RED,
                    ),
                  ),
                )
              : SizedBox(),
        ),
        Container(
          margin: SizeApp.setEdgeInsetsOnly(top: SizeApp.RADIUS_1X, bottom: SizeApp.RADIUS_1X),
          width: SizeApp.setSizeWithWidth(percent: .8),
          child: Obx(
            () => TextField(
              // đóng bàn phím khi nhấn enter
              onSubmitted: (value) {
                controller.loginApp(
                  socialType: SocialType.NONE,
                );
              },
              //dóng bàn phím khi khi thoát khỏi textfield
              onEditingComplete: () {
                controller.loginApp(
                  socialType: SocialType.NONE,
                );
              },
              controller: controller.passwordController,
              obscureText: !controller.isPassword.value,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPassword.value ? Icons.visibility : Icons.visibility_off,
                    color: controller.isPassword.value ? ColorResources.MAIN_APP : ColorResources.GREY,
                  ),
                  onPressed: () {
                    controller.showPassword();
                  },
                ),
                hintText: 'Nhập mật khẩu của bạn',
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
        ),
        Obx(
          () => controller.isShowPassword.value
              ? SizedBox(
                  width: SizeApp.setSizeWithWidth(percent: .8),
                  child: Text(
                    'Vui lòng nhập password của bạn',
                    style: GoogleFonts.lexend(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                      color: ColorResources.RED,
                    ),
                  ),
                )
              : SizedBox(),
        ),
        Gap(5),
        AppButton(
            fillColor: ColorResources.MAIN_APP,
            colorBorder: ColorResources.MAIN_APP,
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
              controller.loginApp(
                socialType: SocialType.NONE,
              );
              // ẩn bàn phím
              FocusScope.of(Get.context!).unfocus();
              // Get.toNamed(HomeRouter.DASHBOARD);
            },
            label: 'Login'.tr,
            colorText: ColorResources.WHITE,
            fontSizedLabel: SizeApp.LABEL_SMALL_FONT_SIZE,
            fontWeight: FontWeight.bold),
        Container(
          margin: SizeApp.setEdgeInsetsOnly(top: SizeApp.RADIUS_1X, bottom: SizeApp.RADIUS_3X),
          child: Text(
            'Login with'.tr,
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
                onTap: () {
                  controller.loginApp(socialType: SocialType.GOOGLE);
                },
                sizeIcon: SizeApp.setSize(percent: 0.03),
                imageUrlIcon: ImagesPath.googleIcon,
                label: 'Google'.tr,
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
                imageUrlIcon: ImagesPath.microsoftIcon,
                label: 'Microsoft'.tr,
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
                label: 'Slack'.tr,
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
