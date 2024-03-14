import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        backgroundColor: ColorResources.BGAPP,
        title: Text('Dashboards'.tr, style: TextStyle(fontSize: 20)),
        actions: [
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
      body: SingleChildScrollView(
          child: Container(
        color: ColorResources.WHITE,
        padding: EdgeInsets.only(
            left: 15.0, right: 15.0, top: SizeApp.setSize(percent: .03), bottom: SizeApp.setSize(percent: .02)),
        child: Column(
          children: [
            _assigned(),
            Gap(30),
            _activity(),
            Gap(20),
            feedback(),
            //cuc 3
          ],
        ),
      )),
    );
  }

  Widget _assigned() {
    return Container(
      width: SizeApp.getMaxWidth(),
      height: SizeApp.setSize(percent: .35),
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
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Assigned to Me".tr, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
        Container(
          height: SizeApp.setSize(percent: .25),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
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
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    )),
                    DataCell(Text('SCRUM -29')),
                    DataCell(Text('Test Task')),
                    DataCell(Icon(Icons.line_axis, color: Colors.orange)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )),
                    DataCell(Text('SCRUM -29')),
                    DataCell(Text('Test Task')),
                    DataCell(Icon(Icons.line_axis, color: Colors.orange)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    )),
                    DataCell(Text('SCRUM -29')),
                    DataCell(Text('Test Task')),
                    DataCell(Icon(Icons.line_axis, color: Colors.orange)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("View all issues", style: TextStyle(color: Colors.blue)),
            Spacer(),
            Icon(Icons.autorenew, color: Colors.blue),
            Text("27 Feb 2024", style: TextStyle(color: Colors.black)),
          ],
        )
      ]),
    );
  }

  Widget _activity() {
    return Container(
      width: SizeApp.getMaxWidth(),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorResources.GREY.withOpacity(.4)),
          boxShadow: [
            BoxShadow(
              color: ColorResources.WHITE.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Activity stream".tr, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: AppImage(
                      ImagesPath.avataImg,
                      width: 30.sp,
                      height: 30.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          SizedBox(
                            width: SizeApp.setSizeWithWidth(percent: .7),
                            child: RichText(
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    text: 'John Doe',
                                    style: TextStyle(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: ' changed the status to Done on KAN-18. Vấn đề này đã được giải quyết. ',
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.black.withOpacity(.8),
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ])),
                          )
                        ]),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(top: 3.sp, bottom: 3.sp, left: 2.sp, right: 2.sp),
                              decoration: BoxDecoration(
                                  color: ColorResources.GREEN.withOpacity(.7),
                                  borderRadius: BorderRadius.circular(5.sp)),
                              child: Icon(
                                Icons.bookmark_rounded,
                                color: Colors.white,
                                size: 12.sp,
                              ),
                            ),
                            SizedBox(
                              width: 5.sp,
                            ),
                            Text('26 Feb 2024', style: TextStyle(fontSize: 12.sp, color: ColorResources.GREY)),
                          ],
                        ),
                        Divider(
                          color: ColorResources.GREY.withOpacity(.2),
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            Icon(Icons.autorenew, color: Colors.blue),
            Text("Just now", style: TextStyle(color: Colors.black)),
          ],
        )
      ]),
    );
  }

  Widget feedback() {
    return Container(
      width: SizeApp.getMaxWidth(),
      height: SizeApp.setSize(percent: .18),
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
          Text("panel_01".tr, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
          Text("panel_02".tr,
              style: TextStyle(
                color: Colors.black,
              )),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
              onTap: () {},
              child: Text("Send Feeback".tr, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }
}
