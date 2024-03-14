import 'package:test_intern/resources/export/core_export.dart';

class PopupMenuWidget extends GetView<KabanProjectController> {
  const PopupMenuWidget({
    super.key,
  });

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
          Radius.circular(20.0),
        ),
      ),
      onSelected: (value) {
        switch (value) {
          case 'rename':
            controller.renameColumnPopup();
            break;

          case 'move':
//move
            break;
          case 'limit':
            controller.limitColumnPopup();

            //limit
            break;
          case 'delete':
            //delete
            break;
        }
      },
      surfaceTintColor: Colors.transparent,
      color: ColorResources.WHITE, // màu
      constraints: BoxConstraints.tightFor(
        width: SizeApp.setSizeWithWidth(percent: 0.5),
      ),
      child: Icon(Icons.more_vert, color: ColorResources.MAIN_APP),
      itemBuilder: (BuildContext context) {
        return [
          _buildPopupItem(value: 'rename', title: 'Rename column'.tr, icon: Icons.edit),
          const PopupMenuDivider(),
          _buildPopupItem(value: 'move', title: 'Move column right'.tr, icon: Icons.move_to_inbox_rounded),
          const PopupMenuDivider(),
          _buildPopupItem(value: 'limit', title: 'Column limit'.tr, icon: Icons.lock_rounded),
          const PopupMenuDivider(),
          _buildPopupItem(value: 'delete', title: 'Delete column'.tr, icon: Icons.delete_rounded),
          const PopupMenuDivider(),
        ];
      },
    );
  }
}
