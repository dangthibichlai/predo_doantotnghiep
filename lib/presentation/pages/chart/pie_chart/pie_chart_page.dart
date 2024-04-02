import 'package:fl_chart/fl_chart.dart';
import 'package:test_intern/presentation/pages/chart/pie_chart/pie_chart_controller.dart';
import 'package:test_intern/presentation/pages/chart/widget_chart/indicator.dart';
import 'package:test_intern/resources/export/core_export.dart';

class PieChartPage extends GetView<PieChartController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? Center(child: LoadingApp())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                child: Column(
                  children: [
                    Text(
                      'PIE CHART'.tr,
                      style: TextStyle(
                        color: ColorResources.MAIN_APP,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
                      child: AspectRatio(
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
                                        pieTouchData: PieTouchData(
                                          touchCallback: (FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
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
                                          show: true,
                                        ),
                                        sectionsSpace: 0,
                                        centerSpaceRadius: 60,
                                        sections: showingSections(controller.touchedIndex.value),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(20),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //list name
                        Indicator(
                          color: ColorResources.MAIN_APP,
                          text: 'First',
                          isSquare: true,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: ColorResources.YELLOW,
                          text: 'Second',
                          isSquare: true,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: ColorResources.PINK,
                          text: 'Third',
                          isSquare: true,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: ColorResources.GREEN,
                          text: 'Fourth',
                          isSquare: true,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ],
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
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: ColorResources.MAIN_APP,
            value: items[i].value,
            title: '${items[i].value}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: ColorResources.WHITE,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: ColorResources.YELLOW,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: ColorResources.WHITE,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: ColorResources.PINK,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: ColorResources.WHITE,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: ColorResources.GREEN,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: ColorResources.WHITE,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
