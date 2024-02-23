import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/pages/issue/issue_controller.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Issues',
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
              Container(
                  padding: SizeApp.setEdgeInsetsOnly(
                    left: 10.sp,
                    right: 10.sp,
                  ),
                  margin: SizeApp.setEdgeInsetsOnly(top: 10.sp),
                  decoration: BoxDecoration(
                    color: ColorResources.WHITE,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: SizeApp.setEdgeInsetsAll(5.sp),
                            decoration: BoxDecoration(
                              color: ColorResources.GREY.withOpacity(.2),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Icon(
                              Icons.person_2_outlined,
                              color: ColorResources.BLACK.withOpacity(.5),
                              size: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text('My open issues'),
                        ],
                      ),
                      RotatedBox(
                          quarterTurns: 1,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: ColorResources.MAIN_APP,
                                size: 16,
                              ))),
                    ],
                  )),
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
                      style: TextStyle(
                        color: ColorResources.MAIN_APP,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ));
  }
}
