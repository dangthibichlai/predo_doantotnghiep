import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/pages/project/project_controller.dart';
import 'package:test_intern/presentation/widget/title_custom.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';
import 'package:test_intern/routers/home_router.dart';

class ProjectPage extends GetView<ProjectController> {
  const ProjectPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: ColorResources.BGAPP,
        automaticallyImplyLeading: false,
        title: Text('Project'.tr, style: TextStyle(fontSize: 20.sp)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 26.sp,
                color: ColorResources.BLACK.withOpacity(.5),
              )),
          IconButton(
              onPressed: () {
                Get.toNamed(HomeRouter.CREATEPROJECT);
              },
              icon: Icon(
                Icons.add,
                size: 26.sp,
                color: ColorResources.BLACK.withOpacity(.5),
              )),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: ClipOval(
              child: AppImage(
                ImagesPath.avataImg,
                width: 30.sp,
                height: 30.sp,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              recentlyProjectListView(),
              allProjectGridView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget allProjectGridView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleCustom(
          title: "All projects".tr,
          sizeTitle: 14.sp,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.toNamed(HomeRouter.KABANPROJECT),
              child: Container(
                margin: REdgeInsets.all(5.sp),
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                  color: Color(0XFFeaebef),
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: SizeApp.setSize(percent: .07),
                    height: SizeApp.setSize(percent: .07),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    child: Icon(
                      Icons.beach_access,
                      color: Colors.red,
                      size: 36.0,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Project name',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Dự án thuộc team Product',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorResources.BLACK.withOpacity(.5),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ]),
              ),
            );
          },
          itemCount: 10,
        ),
      ],
    );
  }

  Widget recentlyProjectListView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleCustom(
          title: "Recently viewed".tr,
          sizeTitle: 14.sp,
        ),
        Container(
          height: SizeApp.setSize(percent: .2),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: REdgeInsets.all(5.sp),
                  width: SizeApp.setSize(percent: .25),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.sp), boxShadow: [
                    BoxShadow(
                      color: ColorResources.BLACK.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]),
                  child: Stack(
                    children: [
                      Column(children: [
                        Container(
                          height: SizeApp.setSize(percent: .06),
                          decoration: BoxDecoration(
                            color: Color(0xfff1f2f4),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.sp),
                              topRight: Radius.circular(5.sp),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              color: ColorResources.WHITE,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5.sp),
                                bottomRight: Radius.circular(5.sp),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Project name',
                                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'dangbichlai21@gmail.com',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: ColorResources.BLACK.withOpacity(.5),
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                      Positioned(
                        top: SizeApp.setSize(percent: .02),
                        left: SizeApp.setSizeWithWidth(percent: .03),
                        child: Container(
                          width: SizeApp.setSize(percent: .06),
                          height: SizeApp.setSize(percent: .06),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          child: Icon(
                            Icons.beach_access,
                            color: Colors.white,
                            size: 36.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10.sp,
                );
              },
              itemCount: 3),
        )
      ],
    );
  }
}
