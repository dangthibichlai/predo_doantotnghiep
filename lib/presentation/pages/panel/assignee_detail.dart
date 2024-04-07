// ignore_for_file: deprecated_member_use, invalid_use_of_protected_member

import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/presentation/pages/panel/panel_controller.dart';
import 'package:test_intern/presentation/pages/task/ui_issue_type.dart';
import 'package:test_intern/resources/export/core_export.dart';

class AssigneedetailPage extends GetView<PanelController> {
  const AssigneedetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Assignee to Me'),
      ),
      body: Container(
        height: SizeApp.getMaxHeight(),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => DataTable(
              dataRowMaxHeight: 50.h,
              dataTextStyle: TextStyle(
                fontSize: 14.sp,
              ),
              columns: <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Issue Type'.tr,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Key'.tr,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Summary'.tr,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
              rows: controller.listTask.value.map((e) {
                final uiIssueTypeItem =
                    UIIssueType.getUIIssueType(issueTypeValues.reverse[e.issueType] ?? IssueType.USER_STORY.toString());
                return DataRow(
                  cells: <DataCell>[
                    DataCell(
                        onTap: () => controller.routerToDetailTask(e.id ?? ''),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: item.color ?? ColorResources.GREEN,
                            color: uiIssueTypeItem?.color ?? ColorResources.GREEN,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          height: 16.sp,
                          width: 16.sp,
                          child: Icon(
                            //item.icon ??
                            uiIssueTypeItem?.icon ?? Icons.bookmark_outlined,
                            color: ColorResources.WHITE,
                            size: 12.sp,
                          ),
                        )),
                    DataCell(
                      onTap: () => controller.routerToDetailTask(e.id ?? ''),
                      Text(
                        e.key ?? '',
                      ),
                    ),
                    DataCell(
                        onTap: () => controller.routerToDetailTask(e.id ?? ''),
                        SizedBox(
                            width: SizeApp.setSize(percent: .15),
                            child: Text(e.title ?? '', maxLines: 2, overflow: TextOverflow.ellipsis))),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
