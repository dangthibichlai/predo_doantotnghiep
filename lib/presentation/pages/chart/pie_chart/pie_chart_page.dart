import 'package:fl_chart/fl_chart.dart';
import 'package:test_intern/models/chart_model.dart';
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
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 16),
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
                                        centerSpaceColor: Colors.white,
                                        pieTouchData: PieTouchData(
                                          touchCallback: (FlTouchEvent event,
                                              PieTouchResponse?
                                                  pieTouchResponse) {
                                            if (event
                                                    .isInterestedForInteractions &&
                                                pieTouchResponse != null &&
                                                pieTouchResponse
                                                        .touchedSection !=
                                                    null) {
                                              controller.updateTouchedIndex(
                                                  pieTouchResponse
                                                      .touchedSection!
                                                      .touchedSectionIndex);
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
                                        sections: showingSections(
                                            controller.touchedIndex.value),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (var text in controller.chartData)
                          Column(
                            children: [
                              Indicator(
                                color: controller.availableColors[
                                    controller.chartData.indexOf(text)],
                                text: text.name + ' - ' + text.value.toString(),
                                isSquare: false,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
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
      return PieChartSectionData(
        color: controller.availableColors[i],
        value: items[i].value,
        title: '${(items[i].value / (controller.totalChartValue) * 100)}%',
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
