// ignore_for_file: invalid_use_of_protected_member

import 'package:test_intern/core/hepler/app_dropdown.dart';
import 'package:test_intern/presentation/pages/type_chart.dart/choose_chart_controller.dart';

import '../../../resources/export/core_export.dart';

class ChooseTypePage extends GetView<ChooseChartController> {
  const ChooseTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Type Chart'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: 20.sp, left: SizeApp.setSizeWithWidth(percent: .1), right: SizeApp.setSizeWithWidth(percent: .1)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            controller.title,
          ),
          _dropdown(),
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                borderRadius: BorderRadius.circular(10.sp),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Back',
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.MAIN_APP),
                  ),
                ),
                highlightColor: ColorResources.MAIN_APP.withOpacity(.2),
                focusColor: ColorResources.MAIN_APP.withOpacity(.2),
                splashColor: ColorResources.MAIN_APP.withOpacity(.2),
              ),
              Gap(10),
              InkWell(
                onTap: () {
                  Get.toNamed(HomeRouter.PIECHART);
                },
                borderRadius: BorderRadius.circular(10.sp),
                child: Container(
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    color: ColorResources.MAIN_APP,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Text(
                    'View',
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.WHITE),
                  ),
                ),
                highlightColor: ColorResources.MAIN_APP.withOpacity(.2),
                focusColor: ColorResources.MAIN_APP.withOpacity(.2),
                splashColor: ColorResources.MAIN_APP.withOpacity(.2),
              ),
            ],
          ),
          // Expanded(
          //     child: AspectRatio(
          //   aspectRatio: 1.3,
          //   child: GetBuilder<ChooseChartController>(
          //     builder: (controller) {
          //       return AspectRatio(
          //         aspectRatio: 1.3,
          //         child: GetBuilder<ChooseChartController>(
          //           builder: (controller) {
          //             return Stack(
          //               children: [
          //                 PieChart(
          //                   PieChartData(
          //                     sections: [
          //                       PieChartSectionData(
          //                         color: Colors.blue,
          //                         value: 25,
          //                         title: 'One',
          //                         radius: 80,
          //                         titlePositionPercentageOffset: 0.55,
          //                         titleStyle: TextStyle(
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.white,
          //                         ),
          //                       ),
          //                       PieChartSectionData(
          //                         color: Colors.yellow,
          //                         value: 25,
          //                         title: 'Two',
          //                         radius: 65,
          //                         titlePositionPercentageOffset: 0.55,
          //                         titleStyle: TextStyle(
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.white,
          //                         ),
          //                       ),
          //                       PieChartSectionData(
          //                         color: Colors.pink,
          //                         value: 25,
          //                         title: 'Three',
          //                         radius: 60,
          //                         titlePositionPercentageOffset: 0.6,
          //                         titleStyle: TextStyle(
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.white,
          //                         ),
          //                       ),
          //                       PieChartSectionData(
          //                         color: Colors.green,
          //                         value: 25,
          //                         title: 'Four',
          //                         radius: 70,
          //                         titlePositionPercentageOffset: 0.55,
          //                         titleStyle: TextStyle(
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.white,
          //                         ),
          //                       ),
          //                     ],
          //                     pieTouchData:
          //                         // tôi muốn thay đổi màu sắc khi chạm vào thì tôi sẽ sử dụng PieTouchData
          //                         PieTouchData(touchCallback: (FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
          //                       if (pieTouchResponse != null) {
          //                         controller.updateTouchedIndex(pieTouchResponse.touchedSection!.touchedSectionIndex);
          //                       }
          //                     }),
          //                   ),
          //                 ),
          //                 Obx(
          //                   () => Positioned.fill(
          //                     child: Align(
          //                       alignment: Alignment.center,
          //                       child: AnimatedOpacity(
          //                         duration: Duration(milliseconds: 300),
          //                         opacity: controller.touchedIndex.value != -1 ? 1.0 : 0.0,
          //                         child: Text(
          //                           getTitleForIndex(controller.touchedIndex.value),
          //                           style: TextStyle(
          //                             fontSize: 20,
          //                             fontWeight: FontWeight.bold,
          //                             color: Colors.black,
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             );
          //           },
          //         ),
          //       );
          //     },
          //   ),
          // )),
        ]),
      ),
    );
  }

  // String getTitleForIndex(int index) {
  //   switch (index) {
  //     case 0:
  //       return 'One';
  //     case 1:
  //       return 'Two';
  //     case 2:
  //       return 'Three';
  //     case 3:
  //       return 'Four';
  //     default:
  //       return '';
  //   }
  // }

  Widget _dropdown() {
    return Row(
      children: [
        Text(
          'Statistic type: ',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK),
        ),
        Obx(
          () => AppropDownButton<String>(
            borderRadius: SizeApp.RADIUS_2X,
            height: SizeApp.setSize(percent: .06),
            colorBorder: Colors.blue,
            backgroundColor: ColorResources.WHITE,
            //  margin: SizeApp.setEdgeInsetsAll(SizeApp.SPACE_5X),
            width: SizeApp.setSizeWithWidth(percent: .4),
            value: controller.dataFilter.value,
            data: controller.filterData.value,
            isRequired: false,
            onChanged: (data) {
              CommonHelper.onTapHandler(callback: () {
                controller.onChangFilter(value: data.toString());
              });
            },
          ),
        ),
      ],
    );
  }
}
