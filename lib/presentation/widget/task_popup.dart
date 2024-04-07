import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/presentation/pages/task/task_detail.controller.dart';
import 'package:test_intern/resources/export/core_export.dart';

class PopupTaskWidget extends GetView<TaskDetailController> {
  final TaskModel commentModel;
  const PopupTaskWidget(this.commentModel);

  PopupMenuItem<String> _buildPopupItem({
    required String value,
    required String title,
    required IconData icon,
  }) {
    return PopupMenuItem(
      value: value,
      height: SizeApp.setSizeWithWidth(percent: 0.1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: ColorResources.BLACK.withOpacity(.5),
                  size: SizeApp.setSizeWithWidth(percent: 0.06),
                ),
                const SizedBox(width: SizeApp.SPACE_2X),
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: ColorResources.BLACK.withOpacity(.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, SizeApp.SPACE_4X),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      onSelected: (value) {
        switch (value) {
          case 'edit':
            Get.dialog(
              DiologApp(
                title: 'Add column'.tr,
                nameButtonLeft: 'Add'.tr,
                inputController: controller.textComment,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              barrierDismissible: true,
              transitionCurve: Curves.easeInOut,
              useSafeArea: true,
            );
            break;

          case 'delete':
            controller.deleteComment(commentModel.id ?? '');
            break;
          case 'copy':
            //limit
            break;
        }
      },
      surfaceTintColor: Colors.transparent,
      color: ColorResources.WHITE, // màu
      constraints: BoxConstraints.tightFor(
        width: SizeApp.setSizeWithWidth(percent: 0.35),
      ),
      child: Icon(Icons.more_vert, color: ColorResources.MAIN_APP),
      itemBuilder: (BuildContext context) {
        return [
          _buildPopupItem(value: 'edit', title: 'Edit'.tr, icon: Icons.edit),
          const PopupMenuDivider(),
          _buildPopupItem(value: 'delete', title: 'Delete'.tr, icon: Icons.delete_outline_outlined),
          const PopupMenuDivider(),
          _buildPopupItem(value: 'copy', title: 'Copy'.tr, icon: Icons.copy),
        ];
      },
    );
  }
}
