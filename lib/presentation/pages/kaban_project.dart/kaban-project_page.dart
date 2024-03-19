// ignore_for_file: invalid_use_of_protected_member, unused_element

import 'dart:developer';

import 'package:test_intern/presentation/widget/board_popup.dart';
import 'package:test_intern/resources/export/core_export.dart';

class KabanProjectPage extends GetView<KabanProjectController> {
  const KabanProjectPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorResources.WHITE,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 22.sp,
                        color: ColorResources.BLACK.withOpacity(.5),
                      )),
                  Text(controller.nameProject,
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: ColorResources.MAIN_APP)),
                ],
              ),
              ExpertsTabBar(
                onTap: (value) {
                  controller.onChangeTabBar(value);
                },
              ),
              body(),
            ],
          ),
        ));
  }

  Widget body() {
    return Obx(() {
      if (controller.currentIndexTab.value == 0) {
        return _boardBody();
      } else if (controller.currentIndexTab.value == 1) {
        return _timeLineBody();
      }
      return _settingsBody();
    });
  }

  Widget _boardBody() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: SizeApp.setSize(percent: .8),
              child: LoadingApp(
                titleLoading: 'diy_001'.tr,
              ),
            ),
          ],
        );
      }
      return Container(
          constraints:
              BoxConstraints(minHeight: SizeApp.setSize(percent: .02), maxHeight: SizeApp.setSize(percent: .75)),
          child: KanbanBoard(
            List.generate(growable: true, controller.listBorad.length, (index) {
              final item = controller.listBorad.value[index];

              return BoardListsData(
                  header: Obx(() => _title(item.name, controller.listBorad.value[index].tasks!.length)),
                  footer: _footer(item.id ?? ''),
                  width: SizeApp.setSizeWithWidth(percent: .8),
                  items: List.generate(growable: true, item.tasks!.length, (index) {
                    return InkWell(
                      onTap: () {
                        CommonHelper.onTapHandler(callback: () {
                          controller.routerTaskDetail(item.tasks![index].id ?? "");
                        });
                      },
                      child: _contentItem(
                          title: item.tasks![index].title ?? "", nameProject: item.tasks![index].key ?? ""),
                    );
                  }));
            }),
            onItemLongPress: (cardIndex, listIndex) {},
            onItemReorder: (oldCardIndex, newCardIndex, oldListIndex, newListIndex) {},
            onListLongPress: (listIndex) {},
            onListReorder: (oldListIndex, newListIndex) {},
            onItemTap: (cardIndex, listIndex) {},
            onListTap: (listIndex) {},
            onListRename: (oldName, newName) {},
            backgroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
          ));
    });
  }

  Widget _contentItem({required String title, required String nameProject}) {
    return Container(
      margin: SizeApp.setEdgeInsetsOnly(
        top: SizeApp.setSize(percent: .01),
        left: SizeApp.setSize(percent: .012),
        right: SizeApp.setSize(percent: .012),
      ),
      padding: SizeApp.setEdgeInsetsOnly(
          left: SizeApp.setSizeWithWidth(percent: .015),
          top: SizeApp.setSize(percent: .01),
          bottom: SizeApp.setSize(percent: .01),
          right: SizeApp.setSizeWithWidth(percent: .015)),
      decoration: BoxDecoration(
        color: ColorResources.WHITE,
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK.withOpacity(.7))),
          Gap(20),
          Row(
            children: [
              Icon(
                Icons.check_box_rounded,
                color: Colors.blue,
                size: 24.sp,
              ),
              Gap(10),
              Text(nameProject,
                  style: TextStyle(
                      fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK.withOpacity(.3))),
            ],
          )
        ],
      ),
    );
  }

  Widget _footer(String idBoard) {
    return Padding(
      padding: SizeApp.setEdgeInsetsOnly(
        top: SizeApp.setSize(percent: .01),
        left: SizeApp.setSize(percent: .012),
        right: SizeApp.setSize(percent: .012),
        bottom: SizeApp.setSize(percent: .012),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              CommonHelper.onTapHandler(callback: () {
                controller.createNewColumn(idBoard);
              });
            },
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: ColorResources.MAIN_APP,
                  size: 24.sp,
                ),
                Gap(10),
                Text('Create'.tr,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.MAIN_APP)),
              ],
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(45 * 3.1415927 / 180),
            child: Icon(
              Icons.attach_file_outlined,
              color: ColorResources.MAIN_APP,
            ),
          )
        ],
      ),
    );
  }

  Widget _title(String title, int? count) {
    return Padding(
      padding: SizeApp.setEdgeInsetsOnly(
        top: SizeApp.setSize(percent: .01),
        left: SizeApp.setSize(percent: .012),
        right: SizeApp.setSize(percent: .012),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // popup
          Text('${title}  ${count}',
              style:
                  TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK.withOpacity(.3))),

          PopupMenuWidget(),
        ],
      ),
    );
  }

  Widget _timeLineBody() {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text('Choose the type of chart to display'.tr,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: ColorResources.GREY)),
        Gap(20),
        Container(
          padding: SizeApp.setEdgeInsetsOnly(
            left: SizeApp.setSizeWithWidth(percent: .02),
            right: SizeApp.setSizeWithWidth(percent: .02),
            top: SizeApp.setSize(percent: .005),
          ),
          constraints: BoxConstraints(minHeight: SizeApp.setSize(percent: .2), maxHeight: SizeApp.setSize(percent: .7)),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10.sp, childAspectRatio: 0.7),
            itemBuilder: (context, index) {
              final item = controller.listChart[index];
              return InkWell(
                onTap: () {
                  CommonHelper.onTapHandler(callback: () {
                    Get.toNamed(HomeRouter.CHOOSECHART, arguments: {'title': item.description});
                  });
                },
                child: Column(
                  children: [
                    AppImage(
                      item.image ?? '',
                      width: SizeApp.setSizeWithWidth(percent: .4),
                    ),
                    Text(item.nameChart ?? '',
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK)),
                    Text(
                        item.description ??
                            'The bar chart is a chart with rectangular bars. Each bar has a height proportional to the value it represents. The bars can be plotted vertically or horizontally. The vertical bar chart is sometimes called a column chart.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: ColorResources.GREY)),
                  ],
                ),
              );
            },
            itemCount: controller.listChart.length,
          ),
        ),
      ]),
    );
  }

  Widget _settingsBody() {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              CommonHelper.onTapHandler(callback: () {
                controller.changPageDetail();
              });
            },
            child: Container(
              width: SizeApp.getMaxWidth(),
              padding: SizeApp.setEdgeInsetsOnly(
                bottom: SizeApp.setSize(percent: .02),
                left: SizeApp.setSizeWithWidth(percent: .02),
                right: SizeApp.setSizeWithWidth(percent: .02),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 1,
                color: ColorResources.GREY.withOpacity(.2),
              ))),
              child: Text(
                'Details'.tr,
                style: TextStyle(fontSize: 14..sp),
              ),
            ),
          ),
          InkWell(
            child: Container(
              width: SizeApp.getMaxWidth(),
              padding: SizeApp.setEdgeInsetsOnly(
                top: SizeApp.setSize(percent: .02),
                bottom: SizeApp.setSize(percent: .02),
                left: SizeApp.setSizeWithWidth(percent: .02),
                right: SizeApp.setSizeWithWidth(percent: .02),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 1,
                color: ColorResources.GREY.withOpacity(.2),
              ))),
              child: Text(
                'Features'.tr,
                style: TextStyle(fontSize: 14..sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
