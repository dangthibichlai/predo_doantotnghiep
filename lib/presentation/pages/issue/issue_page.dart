import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/pages/issue/issue_controller.dart';
import 'package:test_intern/presentation/widget/card_title.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';

import '../../widget/title_custom.dart';


class IssuePage extends GetView<IssueController> {
  const IssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: ColorResources.BGAPP,
      body: Padding(
        padding: SizeApp.setEdgeInsetsOnly(
          top: 10.sp,
          left: 10.sp,
          right: 10.sp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AppImage(
                    ImagesPath.avataImg,
                    width: SizeApp.setSizeWithWidth(percent: .1),
                    height: SizeApp.setSizeWithWidth(percent: .1),
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  ],
                ),
              ],
            ),
            TitleCustom(
              title: "Issues",
            ),
            GestureDetector(
              onTap: () {
                showFlexibleBottomSheet(
                  minHeight: 0,
                  initHeight: 1,
                  maxHeight: 1,
                  context: context,
                  builder: _buildBottomSheet,
                  isExpand: false,
                );
              },
              child: CardTitle(
                icon: Icons.person_2_outlined,
                title: 'My open issues',
                colorTitle: ColorResources.BLACK,
                sizeTitle: 12.sp,
                iconRight: Icons.keyboard_arrow_down_rounded,
                sizeIconRight: 20.sp,
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //

                AppImage(
                  ImagesPath.issueImage,
                  width: SizeApp.setSizeWithWidth(percent: .5),
                ),
                Text(
                  'No issues to show',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: ColorResources.BLACK,
                  ),
                ),
                Text(
                  'Nice!',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: ColorResources.BLACK,
                  ),
                ),
                SizedBox(
                  width: SizeApp.setSizeWithWidth(percent: .7),
                  height: SizeApp.setSize(percent: .1),
                  child: Text(
                    'When you\'re  assigned new issues, you\'ll see them here.',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: ColorResources.BLACK.withOpacity(.5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Create issue',
                    style: TextStyle(color: ColorResources.MAIN_APP, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Scaffold(
      backgroundColor: ColorResources.BGAPP,
      body: Padding(
        padding: EdgeInsets.only(top: SizeApp.setSize(percent: .04), left: 10.sp, right: 10.sp),
        child: Column(
          children: [
            headerBottomSheet(),
            SizedBox(height: SizeApp.setSize(percent: .04)),
            TitleCustom(
              title: "Recent filters",
              sizeTitle: 11.sp,
            ),
            CardTitle(
              icon: Icons.person_2_outlined,
              title: 'My open issues',
              colorTitle: ColorResources.BLACK,
              sizeTitle: 12.sp,
              iconRight: Icons.star_border_rounded,
              sizeIconRight: 24.sp,
            ),
            Padding(
              padding: SizeApp.setEdgeInsetsOnly(top: 20.sp, bottom: 5.sp),
              child: TitleCustom(
                title: "Default filters",
                sizeTitle: 11.sp,
              ),
            ),
            defaultBottomSheet(),
          ],
        ),
      ),
    );
  }

  Widget defaultBottomSheet() {
    return Container(
      height: SizeApp.setSize(percent: .7),
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
        color: ColorResources.WHITE,
        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
      ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return CardTitle(
            padding: SizeApp.setEdgeInsetsOnly(
              left: 10.sp,
              right: 3.sp,
              top: 1.sp,
              bottom: 1.sp,
            ),
            margin: EdgeInsets.all(0),
            icon: Icons.person_2_outlined,
            title: 'My open issues',
            colorTitle: ColorResources.BLACK,
            sizeTitle: 12.sp,
            iconRight: Icons.star_border_rounded,
            sizeIconRight: 24.sp,
            colorIconRight: ColorResources.GREY,
          );
        },
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: SizeApp.setEdgeInsetsOnly(
              left: 10.sp,
              right: 10.sp,
            ),
            child: Divider(color: ColorResources.GREY.withOpacity(.2)),
          );
        },
      ),
    );
  }

  Widget headerBottomSheet() {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
          onPressed: () {
            Get.back();
          },
          // opticalSize là

          icon: Icon(
            Icons.arrow_back_rounded,
            fill: 0,
          ),
        ),
        Text(
          'Filters',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'Create',
            style: TextStyle(fontSize: 16.sp, color: ColorResources.MAIN_APP, fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
