// ignore_for_file: invalid_use_of_protected_member

import 'package:intl/intl.dart';
import 'package:test_intern/core/hepler/app_input.dart';
import 'package:test_intern/isar/project.dart';
import 'package:test_intern/presentation/pages/project/project_controller.dart';
import 'package:test_intern/presentation/widget/avata_header.dart';
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: ColorResources.BGAPP,
          automaticallyImplyLeading: false,
          title: Text('Project'.tr, style: TextStyle(fontSize: 20.sp)),
          actions: [
            IconButton(
                onPressed: () {
                  controller.showSearch();
                },
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
            AvataHeaderWidget(typeSquare: true),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              controller.isShowSearch.value
                  ? Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                      child: AppInput(
                        onChanged: (value) {
                          controller.searchProjectFilter(value);
                        },
                        prefixIcon: (FocusNode) {
                          return Icon(
                            Icons.search,
                            color: ColorResources.BLACK.withOpacity(.5),
                            size: 20.sp,
                          );
                        },
                        height: SizeApp.setSize(percent: .07),
                        controller: controller.searchProject,
                        colorDisibleBorder: Color.fromARGB(255, 11, 196, 199),
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorResources.BLACK.withOpacity(.4)),
                        labelStyle: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK.withOpacity(.7)),
                        type: AppInputType.TEXT,
                        maxLine: 1,
                        hintText: "Search project...".tr,
                        isBorder: true,
                        fontSize: 14.sp,
                        fillColor: Colors.transparent,
                        underLine: UnderlineInputBorder(),
                      ),
                    )
                  : SizedBox.shrink(),
              controller.filteredProject.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppImage(
                              ImagesPath.imgHomeRecentEmpty,
                              width: SizeApp.setSizeWithWidth(percent: .4),
                            ),
                            Text('No data'.tr),
                          ],
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        controller.listProjectRenctly.length == 0 ? SizedBox() : recentlyProjectListView(),
                        allProjectGridView(),
                      ],
                    ),
            ],
          ),
        ),
      );
    });
  }

  Widget allProjectGridView() {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
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
                final item = controller.filteredProject.value[index];
                return InkWell(
                    onTap: () {
                      Get.toNamed(HomeRouter.KABANPROJECT,
                          arguments: {'idProject': item.id, 'nameProject': item.name, 'keyProject': item.key});
                      controller.addProjectRenctly(
                        Project(
                          id:item.id,
                          idProject: item.id,
                          isDelete: false,
                          key: item.key,
                          leader: item.leader,
                          name: item.name,
                          createdAt: item.createdAt,
                          updatedAt: item.updatedAt,
                          avatar: item.avatar));
                    },
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.sp),
                          child: AppImage(
                            item.avatar,
                            width: SizeApp.setSizeWithWidth(percent: .11),
                          ),
                        ),
                        // Container(
                        //   width: SizeApp.setSize(percent: .04),
                        //   height: SizeApp.setSize(percent: .04),
                        //   decoration: BoxDecoration(
                        //     color: Colors.blue,
                        //     borderRadius: BorderRadius.circular(5.sp),
                        //   ),
                        //   child: Icon(
                        //     Icons.beach_access,
                        //     color: Colors.white,
                        //     size: 24.0,
                        //   ),
                        // ),
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
              itemCount: controller.filteredProject.length,
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
                  final item = controller.listProjectRenctly.value[index];

                  return GestureDetector(
                    onTap: () => CommonHelper.onTapHandler(callback: () {
                      Get.toNamed(HomeRouter.KABANPROJECT,
                          arguments: {'idProject': item.id, 'nameProject': item.name, 'keyProject': item.key});
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
                                width: SizeApp.getMaxWidth(),
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
                                      item.name,
                                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(item.createdAt.toString())),
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.sp),
                              child: AppImage(
                                item.avatar,
                                width: SizeApp.setSizeWithWidth(percent: .13),
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
                itemCount: controller.listProjectRenctly.length),
          )
        ],
      ),
    );
  }
}
