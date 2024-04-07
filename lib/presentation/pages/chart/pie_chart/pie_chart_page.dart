import 'package:fl_chart/fl_chart.dart';
import 'package:test_intern/presentation/pages/chart/pie_chart/pie_chart_controller.dart';
import 'package:test_intern/resources/export/core_export.dart';

class PieChartPage extends GetView<PieChartController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? Center(child: LoadingApp())
          : SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: ColorResources.MAIN_APP,
                              size: 30,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'PIE CHART'.tr,
                            style: TextStyle(
                              color: ColorResources.MAIN_APP,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      Gap(20),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: ColorResources.WHITE,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("title_01".tr, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 1,
                              child: Row(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: GetBuilder<PieChartController>(
                                      builder: (controller) {
                                        return Obx(
                                          () => PieChart(
                                            PieChartData(
                                              centerSpaceColor: Colors.white,
                                              pieTouchData: PieTouchData(
                                                touchCallback:
                                                    (FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
                                                  if (event.isInterestedForInteractions &&
                                                      pieTouchResponse != null &&
                                                      pieTouchResponse.touchedSection != null) {
                                                    controller.updateTouchedIndex(
                                                        pieTouchResponse.touchedSection!.touchedSectionIndex);
                                                  } else {
                                                    controller.updateTouchedIndex(-1);
                                                  }
                                                },
                                              ),
                                              borderData: FlBorderData(
                                                show: false,
                                              ),
                                              sectionsSpace: 5,
                                              centerSpaceRadius: 100,
                                              sections: showingSections(controller.touchedIndex
                                                  .value), // controller.touchedIndex.value lam tron den 2 chu so thap phan
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(40),
                      Row(
                        children: [Text("title_02".tr, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))],
                      ),
                      Gap(5),
                      Container(
                        width: SizeApp.getMaxWidth(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          // color: ColorResources.MAIN_APP,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Color.fromARGB(255, 216, 212, 212).withOpacity(0.5),
                          //     spreadRadius: 3,
                          //     blurRadius: 3,
                          //   ),
                          // ],
                        ),
                        child: DataTable(
                          dataRowHeight: 70,
                          dataTextStyle: TextStyle(height: 1.5),
                          border: TableBorder.all(color: ColorResources.BLACK.withOpacity(0.5)),
                          columns: [
                            DataColumn(
                                label: Text('',
                                    style: TextStyle(
                                        color: ColorResources.BLACK, fontWeight: FontWeight.bold, fontSize: 16))),
                            DataColumn(
                                label: Text('Name',
                                    style: TextStyle(
                                        color: ColorResources.BLACK, fontWeight: FontWeight.bold, fontSize: 16))),
                            DataColumn(
                                label: Text('Value',
                                    style: TextStyle(
                                        color: ColorResources.BLACK, fontWeight: FontWeight.bold, fontSize: 16))),
                          ],
                          rows: controller.chartData.map<DataRow>((text) {
                            // final color = ;
                            return DataRow(cells: [
                              DataCell(
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: controller.availableColors[controller.chartData.indexOf(text)],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              DataCell(Text(text.name,
                                  maxLines: 3,
                                  style: TextStyle(
                                      color: ColorResources.BLACK, fontWeight: FontWeight.bold, fontSize: 16))),
                              DataCell(Text(text.value.toString(),
                                  style: TextStyle(
                                      color: ColorResources.BLACK, fontWeight: FontWeight.bold, fontSize: 16))),
                            ]);
                          }).toList(),
                        ),
                      )
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: <Widget>[
                      //     for (var text in controller.chartData)
                      //       Column(
                      //         children: [
                      //           Indicator(
                      //             color: controller.availableColors[controller.chartData.indexOf(text)],
                      //             text: text.name + ' - ' + text.value.toString(),
                      //             isSquare: false,
                      //           ),
                      //           SizedBox(
                      //             height: 4,
                      //           ),
                      //         ],
                      //       ),
                      //     SizedBox(
                      //       height: 18,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  List<PieChartSectionData> showingSections(int touchedIndex) {
    final items = controller.chartData;
    return List.generate(controller.chartData.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return PieChartSectionData(
        color: controller.availableColors[i],
        value: items[i].value,
        title: '${(items[i].value / (controller.totalChartValue) * 100).toStringAsFixed(2)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: ColorResources.WHITE,
          shadows: shadows,
        ),
      );
    });
  }
}
