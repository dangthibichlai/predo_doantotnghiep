// ignore_for_file: invalid_use_of_protected_member, unused_element

import 'dart:developer';

import 'package:test_intern/models/board_model.dart';
import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/presentation/pages/task/ui_issue_type.dart';
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            CommonHelper.onTapHandler(callback: () {
              Get.dialog(
                DiologApp(
                  title: 'Add column'.tr,
                  nameButtonLeft: 'Add'.tr,
                  inputController: controller.nameBoard,
                  onTap: () {
                    controller.addBoard(
                      BoardModel(name: controller.nameBoard.text, projectId: controller.idProject, status: Status.TODO),
                    );
                  },
                ),
                barrierDismissible: true,
                transitionCurve: Curves.easeInOut,
                useSafeArea: true,
              );
            });
          },
          child: Icon(
            Icons.add,
            color: ColorResources.WHITE,
          ),
          backgroundColor: ColorResources.MAIN_APP,
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
                titleLoading: 'smart_refresh_008'.tr,
              ),
            ),
          ],
        );
      }
      return Container(
          constraints:
              BoxConstraints(minHeight: SizeApp.setSize(percent: .02), maxHeight: SizeApp.setSize(percent: .75)),
          child: KanbanBoard(
            List.generate(controller.listBorad.length, (index) {
              final item = controller.listBorad.value[index];

              return BoardListsData(
                  header: Obx(() =>
                      _title(item.name, controller.listBorad.value[index].tasks!.length, item.id ?? '', item.name)),
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
                          title: item.tasks![index].title ?? "",
                          nameProject: item.tasks![index].key ?? "",
                          issueType: issueTypeValues.reverse[item.tasks![index].issueType] ?? ''),
                    );
                  }));
            }),
            // onItemReorder: (oldCardIndex, newCardIndex, oldListIndex, newListIndex) {
            //   // Lấy task cần di chuyển
            //   final taskToMove = controller.listBorad[oldListIndex!].tasks!.removeAt(oldCardIndex!);

            //   // Chèn task vào vị trí mới
            //   controller.listBorad[newListIndex!].tasks!.insert(newCardIndex!, taskToMove);

            //   // Cập nhật vị trí task trong cơ sở dữ liệu của bạn
            //   // Ví dụ: Gửi yêu cầu cập nhật vị trí task lên server
            //   //  YourDatabase.updateTaskPosition(taskToMove.id, newListIndex, newCardIndex);
            // },
            onItemLongPress: (cardIndex, listIndex) {
              print('1cardIndex: $cardIndex, listIndex: $listIndex');
              // return controller.listBorad.value;
            },
            onItemReorder: (oldCardIndex, oldListIndex, newCardIndex, newListIndex) {
              print('abc');
              log('2oldCardIndex: $oldCardIndex, newCardIndex: $newCardIndex, oldListIndex: $oldListIndex, newListIndex: $newListIndex');
              final taskupdate = controller.listBorad[oldListIndex!].tasks![oldCardIndex!];

              controller.updateTask(
                  taskupdate.id ?? '',
                  TaskModel(
                    id: taskupdate.id,
                    boardId: controller.listBorad.value[newListIndex!].id,
                    title: taskupdate.title,
                    issueType: taskupdate.issueType,
                    status: taskupdate.status,
                    key: taskupdate.key,
                  ));

              // sự kiến nhấn vào di chuyển là on
              // lấy id board
              // đổi id board của task
              // đổi vị trí task trong list
              //return controller.listBorad.value;
            }, // hàm
            onListLongPress: (listIndex) {
              print('3listIndex: $listIndex');
            },
            onListReorder: (oldListIndex, newListIndex) {
              print('4oldListIndex: $oldListIndex, newListIndex: $newListIndex');
            },
            onItemTap: (cardIndex, listIndex) {
              print('5cardIndex: $cardIndex, listIndex: $listIndex');
            },
            onListTap: (listIndex) {
              print('6listIndex: $listIndex');
            },
            onListRename: (oldName, newName) {
              print('7oldName: $oldName, newName: $newName');
            },
            backgroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
          ));
    });
  }

  Widget _contentItem({required String title, required String nameProject, required String issueType}) {
    final uiIssueTypeItem = UIIssueType.getUIIssueType(issueType);

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
          SizedBox(
            width: SizeApp.getMaxWidth(),
            child: Text(title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK.withOpacity(.7))),
          ),
          Gap(20),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: uiIssueTypeItem?.color ?? ColorResources.GREEN,
                  borderRadius: BorderRadius.circular(3),
                ),
                height: 20.sp,
                width: 20.sp,
                child: Icon(
                  uiIssueTypeItem?.icon ?? Icons.bookmark_outlined,
                  color: ColorResources.WHITE,
                  size: 12.sp,
                ),
              ),
              Gap(10.sp),
              Text(
                uiIssueTypeItem?.name ?? 'Task',
                style: TextStyle(
                    fontSize: 11.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK.withOpacity(.5)),
              ),
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

  Widget _title(String title, int? count, String id, String nameBoard) {
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

          PopupMenuWidget(id, nameBoard),
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
                    Get.toNamed(HomeRouter.CHOOSECHART,
                        arguments: {'title': item.description, 'projectId': controller.idProject});
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
            onTap: () {
              CommonHelper.onTapHandler(callback: () {
                controller.changPageMember();
              });
            },
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
                'Members'.tr,
                style: TextStyle(fontSize: 14..sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addColumn() {
    return Container(
      decoration: BoxDecoration(
        color: ColorResources.WHITE,
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.add,
            color: ColorResources.MAIN_APP,
            size: 24.sp,
          ),
          Text("Add Column"),
        ],
      ),
    );
  }
}
