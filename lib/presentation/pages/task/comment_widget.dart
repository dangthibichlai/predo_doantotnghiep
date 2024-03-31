// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:intl/intl.dart';
import 'package:test_intern/models/auth_model.dart';
import 'package:test_intern/presentation/pages/task/task_detail.controller.dart';
import 'package:test_intern/resources/export/core_export.dart';

class CommentWidget extends GetView<TaskDetailController> {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'More'.tr,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.MAIN_APP),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Activity:'.tr,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK),
            ),
            Text(
              'Comments'.tr,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.MAIN_APP),
            ),
          ],
        ),
        Container(
          child: Obx(() {
            AuthModel user = AuthModel();
            if (controller.listComments.value.length == 0) {
              return bodyEmpty();
            }
            // if (!controller.isLoading.value && controller.listComments.isEmpty) {
            //   return bodyEmpty();
            // }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.listComments.length,
              itemBuilder: (context, index) {
                final item = controller.listComments.value[index];
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10.sp),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: ClipOval(
                              child: AppImage(
                                ImagesPath.avataImg,
                                width: 30.sp,
                                height: 30.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      user.getFullName(
                                          item.userId ?? '', controller.listMembers.value as List<AuthModel>),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('dd/MM/yyyy HH:mm').format(
                                        DateTime.parse(item.createdAt.toString()),
                                      ),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: ColorResources.BLACK,
                                      ),
                                    ),
                                    // Text(
                                    //   "21/07/2002",
                                    //   // DateFormat('dd/MM/yyyy HH:mm')
                                    //   //     .format(DateTime.parse(controller.listComments[index].createdAt ?? '')),
                                    //   overflow: TextOverflow.ellipsis,
                                    //   style: TextStyle(fontSize: 12.sp, color: ColorResources.GREY),
                                    // )
                                  ],
                                ),
                                SizedBox(
                                  width: SizeApp.getMaxWidth(),
                                  child: Text(
                                    item.content,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 12.sp, color: ColorResources.GREY),
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 5.sp),
                        child: Row(
                          children: [
                            ReactionButton<String>(
                              boxPadding: const EdgeInsets.all(2),
                              // onReactionChanged: (Reaction<String>? reaction) {
                              //   debugPrint('Selected value: ${reaction?.value}');
                              // },
                              reactions: <Reaction<String>>[
                                Reaction<String>(
                                  value: 'like',
                                  icon: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      '👌',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                Reaction<String>(
                                  value: 'like',
                                  icon: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('❤️', style: TextStyle(fontSize: 20)),
                                  ),
                                ),
                                Reaction<String>(
                                  value: 'like',
                                  icon: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      '😁',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                Reaction<String>(
                                  value: 'like',
                                  icon: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      '🥲',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                Reaction<String>(
                                  value: 'like',
                                  icon: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      '😮',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                Reaction<String>(
                                  value: 'like',
                                  icon: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      '😡',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                              onReactionChanged: (String) {},

                              initialReaction: Reaction<String>(
                                value: 'like',
                                icon: Icon(
                                  Icons.add_reaction_outlined,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(20)
                  ],
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget bodyEmpty() {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImage(
              ImagesPath.notificationEmpty,
              width: SizeApp.setSizeWithWidth(percent: .25),
            ),
            Gap(20),
            Text(
              'Add comment'.tr,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.MAIN_APP),
            ),
          ],
        ),
      ],
    );
  }
}
