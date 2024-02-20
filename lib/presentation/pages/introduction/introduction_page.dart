import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_intern/core/enums/enums.dart';
import 'package:test_intern/core/hepler/app-button.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/app_lazy_index_stack.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/pages/introduction/introduction_controller.dart';
import 'package:test_intern/presentation/widget/introduction_component/close_button_widget.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';
import 'package:test_intern/routers/auth_router.dart';

class IntroductionPage extends GetView<IntroductionController> {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.MAIN_APP,
      body: GetBuilder(
        init: IntroductionController(),
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: SizeApp.setEdgeInsetsOnly(
                top: SizeApp.setSize(percent: .1),
              ),
              child: SizedBox(
                width: SizeApp.getMaxWidth(),
                height: SizeApp.getMaxHeight(),
                child: _bodyIntro(),
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

  Widget _bodyIntro() {
    return Stack(children: <Widget>[
      Column(
        children: [
          SizedBox(
            height: SizeApp.setSize(percent: .42),
            child: Obx(() {
              return PageView.builder(
                onPageChanged: (value) {
                  controller.onChangePageIndex(index: value);
                },
                controller: controller.pageController,
                physics: controller.isShowButton.value
                    ? const ClampingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return LazyIndexedStack(
                    index: index,
                    alignment: Alignment.center,
                    children: [
                      itemIntro(
                        'Quản lý đơn giản, hiệu quả với mô hình quản lý gần gũi, dễ sử dụng. ',
                        ImagesPath.introduceIssueImg,
                      ),
                      itemIntro(
                        'Thống kê linh hoạt với đa dạng các biểu đồ thống kê chi tiết và dễ hiểu. ',
                        ImagesPath.introduceQueuesImg,
                      ),
                      itemIntro(
                        'Nâng cao hiệu quả quản lý với các tính năng hỗ trợ quản lý đa dạng',
                        ImagesPath.introduceSlaImg,
                      ),
                      itemIntro(
                        'Thống kê linh hoạt với đa dạng các biểu đồ thống kê chi tiết và dễ hiểu. ',
                        ImagesPath.introduceStayInTheLoopImg,
                      ),
                      itemIntro(
                        'Nâng cao hiệu quả quản lý với các tính năng hỗ trợ quản lý đa dạng',
                        ImagesPath.introduceIssueImg,
                      ),
                    ],
                  );
                },
              );
            }),
          ),
          _dotAndNextButton(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                margin: SizeApp.setEdgeInsetsOnly(
                  bottom: SizeApp.SPACE_5X,
                ),
                width: SizeApp.setSizeWithWidth(percent: .8),
                padding: SizeApp.setEdgeInsetsOnly(
                  top: SizeApp.setSize(percent: .01),
                  bottom: SizeApp.setSize(percent: .01),
                ),
                borderRadius: 5.sp,
                onTap: () {
                  Get.toNamed(AuthRouter.LOGIN);
                },
                label: 'ĐĂNG NHẬP',
                colorText: ColorResources.BLACK,
                fontSizedLabel: SizeApp.LABEL_SMALL_FONT_SIZE,
                fontWeight: FontWeight.bold,
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
                    Get.toNamed(AuthRouter.REGISTER);
                  },
                  label: 'ĐĂNG KÝ',
                  colorText: ColorResources.WHITE,
                  fontSizedLabel: SizeApp.LABEL_SMALL_FONT_SIZE,
                  fontWeight: FontWeight.bold),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Container(
                width: 250,
                margin: SizeApp.setEdgeInsetsOnly(
                    bottom: SizeApp.SPACE_2X, top: SizeApp.SPACE_2X),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Bằng việc đăng ký, bạn đã đồng ý với ',
                        style: GoogleFonts.lexend(
                          color: ColorResources.WHITE,
                          fontSize: SizeApp.BODY_MEDIUM_FONT_SIZE,
                        ),
                      ),
                      TextSpan(
                        text: 'Thông báo người dùng',
                        style: GoogleFonts.lexend(
                            color: ColorResources.WHITE,
                            fontSize: SizeApp.BODY_MEDIUM_FONT_SIZE,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: ' và ',
                        style: GoogleFonts.lexend(
                          color: ColorResources.WHITE,
                          fontSize: SizeApp.BODY_MEDIUM_FONT_SIZE,
                        ),
                      ),
                      TextSpan(
                        text: 'Chính sách quyền riêng tư',
                        style: GoogleFonts.lexend(
                            color: ColorResources.WHITE,
                            fontSize: SizeApp.BODY_MEDIUM_FONT_SIZE,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: SizeApp.setEdgeInsetsOnly(
                    bottom: SizeApp.SPACE_2X, top: SizeApp.SPACE_2X),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Bạn không đăng nhập được hoặc đăng ký được',
                        style: GoogleFonts.lexend(
                            color: ColorResources.WHITE,
                            fontSize: SizeApp.BODY_MEDIUM_FONT_SIZE,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    ]);
  }

  Widget itemIntro(String title, String image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppImage(
          image,
          width: SizeApp.setSizeWithWidth(percent: .80),
          height: SizeApp.setSize(percent: .3),
        ),
        const SizedBox(height: SizeApp.SPACE_2X),
        const SizedBox(
          height: SizeApp.RADIUS_2X,
        ),
        SizedBox(
          width: SizeApp.setSizeWithWidth(percent: .80),
          child: Text(
            title,
            style: GoogleFonts.lexend(
              color: ColorResources.WHITE,
              fontSize: 12.sp,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Padding _dotAndNextButton() {
    return Padding(
      padding: SizeApp.setEdgeInsetsOnly(
        top: SizeApp.SPACE_4X,
        left: SizeApp.SPACE_4X,
        right: SizeApp.SPACE_4X,
        bottom: SizeApp.SPACE_4X,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              ...List.generate(
                5,
                (index) {
                  return Obx(() {
                    return Container(
                      margin: EdgeInsets.only(
                          left: index != 0 ? SizeApp.SPACE_1X : 0),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: controller.currentPageIndex.value == index
                            ? ColorResources.WHITE
                            : ColorResources.GREY,
                        shape: controller.currentPageIndex.value == index
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                        borderRadius: controller.currentPageIndex.value == index
                            ? BorderRadius.circular(100)
                            : null,
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
