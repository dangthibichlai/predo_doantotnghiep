// ignore_for_file: deprecated_member_use

import 'package:test_intern/presentation/pages/panel/panel_controller.dart';
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
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Priority'.tr,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
              rows: controller.listTask.value.map((e) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(
                        onTap: () => controller.routerToDetailTask(e.id),
                        Center(
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                          ),
                        )),
                    DataCell(
                      onTap: () => controller.routerToDetailTask(e.id),
                      Text(
                        e.key,
                      ),
                    ),
                    DataCell(
                        onTap: () => controller.routerToDetailTask(e.id),
                        SizedBox(
                            width: SizeApp.setSize(percent: .15),
                            child: Text(e.title, maxLines: 2, overflow: TextOverflow.ellipsis))),
                    DataCell(
                        onTap: () => controller.routerToDetailTask(e.id),
                        Center(child: Icon(Icons.line_axis, color: Colors.orange))),
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
