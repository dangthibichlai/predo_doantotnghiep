import 'package:fl_chart/fl_chart.dart';
import 'package:test_intern/presentation/pages/chart/pie_chart/pie_chart_controller.dart';
import 'package:test_intern/presentation/pages/chart/widget_chart/indicator.dart';
import 'package:test_intern/resources/export/core_export.dart';

class PieChartPage extends GetView<PieChartController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1.3,
          child: Row(
            children: <Widget>[
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: AspectRatio(
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
                                  controller.updateTouchedIndex(pieTouchResponse.touchedSection!.touchedSectionIndex);
                                } else {
                                  controller.updateTouchedIndex(-1);
                                }
                              },
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 40,
                            sections: showingSections(controller.touchedIndex.value),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
              const SizedBox(
                width: 28,
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections(int touchedIndex) {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: ColorResources.MAIN_APP,
            value: 40,
            title: '40%',
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
