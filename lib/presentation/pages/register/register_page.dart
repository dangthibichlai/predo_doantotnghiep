import 'package:test_intern/presentation/pages/login/login_controller.dart';
import 'package:test_intern/presentation/pages/register/register_controller.dart';
import 'package:test_intern/resources/export/core_export.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child:
              //  Obx(() {
              //   if (controller.isLoading.isTrue) {
              //     return const Center(
              //       child: LoadingApp(),
              //     );
              //   }
              //   return
              Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    CommonHelper.onTapHandler(callback: () {
                      Get.back();
                    });
                  },
                  icon: Icon(Icons.arrow_back)),
            ],
          ),
          Gap(SizeApp.setSize(percent: .07)),
          Expanded(child: _bodyRegister()),
        ],
      )
          //},
          //  ),
          ),
    );
  }

  Widget _bodyRegister() {
    return Center(
        child: Column(
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
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Register to continue'.tr,
          style: GoogleFonts.lexend(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorResources.BLACK,
          ),
        ),
        Container(
          margin: SizeApp.setEdgeInsetsOnly(top: SizeApp.RADIUS_3X, bottom: SizeApp.RADIUS_1X),
          width: SizeApp.setSizeWithWidth(percent: .8),
          child: TextField(
            controller: controller.emailController,
            decoration: InputDecoration(
              hintText: 'Enter your email'.tr,
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
                  text: 'Terms of Service'.tr,
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
                  text: 'Privacy Policy'.tr,
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

                controller.register();
              });
            },
            label: 'Continue'.tr,
            colorText: ColorResources.WHITE,
            fontSizedLabel: SizeApp.LABEL_SMALL_FONT_SIZE,
            fontWeight: FontWeight.bold),
        Container(
          margin: SizeApp.setEdgeInsetsOnly(top: SizeApp.RADIUS_1X, bottom: SizeApp.RADIUS_3X),
          child: Text(
            'Or login with'.tr,
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
                  Get.find<LoginController>().loginApp(socialType: SocialType.GOOGLE);
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
