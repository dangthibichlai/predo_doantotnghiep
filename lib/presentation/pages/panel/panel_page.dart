import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/pages/panel/panel_controller.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';

import '../../../core/hepler/app-image.dart';

class PanelPage extends GetView<PanelController> {
  const PanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.BGAPP,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 8.0, right: 8.0, top: SizeApp.setSize(percent: .03), bottom: SizeApp.setSize(percent: .02)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dashboards', style: TextStyle(fontSize: 20)),
                  ClipOval(
                    child: AppImage(
                      ImagesPath.avataImg,
                      width: 30.sp,
                      height: 30.sp,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  color: ColorResources.WHITE,
                  padding: EdgeInsets.only(
                      left: 8.0, right: 8.0, top: SizeApp.setSize(percent: .03), bottom: SizeApp.setSize(percent: .02)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Default dashboard",
                            style: TextStyle(fontSize: 18.sp, color: Colors.blue, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: SizeApp.getMaxWidth(),
                        height: SizeApp.setSize(percent: .4),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: ColorResources.GREY.withOpacity(.2)),
                            boxShadow: [
                              BoxShadow(
                                color: ColorResources.WHITE.withOpacity(.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 1), // changes position of shadow
                              ),
                            ]),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Assigned to Me", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
                              Container(
                                height: SizeApp.setSize(percent: .1),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    columns: const <DataColumn>[
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'Name',
                                            style: TextStyle(fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'Age',
                                            style: TextStyle(fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'Role',
                                            style: TextStyle(fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                    ],
                                    rows: const <DataRow>[
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(Text('Sarah')),
                                          DataCell(Text('19')),
                                          DataCell(Text('Student')),
                                        ],
                                      ),
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(Text('Janine')),
                                          DataCell(Text('43')),
                                          DataCell(Text('Professor')),
                                        ],
                                      ),
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(Text('William')),
                                          DataCell(Text('27')),
                                          DataCell(Text('Associate Professor')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}
