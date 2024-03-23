// ignore_for_file: invalid_use_of_protected_member

import 'package:test_intern/presentation/pages/project/project_controller.dart';
import 'package:test_intern/presentation/widget/title_custom.dart';
import 'package:test_intern/resources/export/core_export.dart';

class ProjectPage extends GetView<ProjectController> {
  const ProjectPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: LoadingApp(),
        );
      }

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
        body: controller.listProject.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppImage(
                      ImagesPath.imgHomeRecentEmpty,
                      width: SizeApp.setSizeWithWidth(percent: .4),
                    ),
                    Text('No data'),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                children: [
                  recentlyProjectListView(),
                  allProjectGridView(),
                ],
              )),
      );
    });
  }

  Widget allProjectGridView() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleCustom(
            title: "All projects".tr,
            sizeTitle: 14.sp,
          ),
          Obx(
            () => ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = controller.listProject.value[index];
                return InkWell(
                    onTap: () => Get.toNamed(HomeRouter.KABANPROJECT,
                            arguments: {
                              'idProject': item.id,
                              'nameProject': item.name,
                              'keyProject': item.key
                            }),
                    child: Row(
                      children: [
                        Container(
                          width: SizeApp.setSize(percent: .04),
                          height: SizeApp.setSize(percent: .04),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          child: Icon(
                            Icons.beach_access,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                        Gap(20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              item.key,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: ColorResources.BLACK.withOpacity(.5),
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ],
                    ));
              },
              itemCount: controller.listProject.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 20.sp,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget recentlyProjectListView() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      child: Column(
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
                  final item = controller.listProject.value[index];

                  return GestureDetector(
                    onTap: () => CommonHelper.onTapHandler(callback: () {
                      Get.toNamed(HomeRouter.KABANPROJECT, arguments: {'idProject': item.id, 'nameProject': item.name});
                    }),
                    child: Container(
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
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10.sp,
                  );
                },
                itemCount: controller.listProject.length),
          )
        ],
      ),
    );
  }
}
