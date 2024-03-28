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
            top: 20.sp,
            left: SizeApp.setSizeWithWidth(percent: .1),
            right: SizeApp.setSizeWithWidth(percent: .1)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        'Back'.tr,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorResources.MAIN_APP),
                      ),
                    ),
                    highlightColor: ColorResources.MAIN_APP.withOpacity(.2),
                    focusColor: ColorResources.MAIN_APP.withOpacity(.2),
                    splashColor: ColorResources.MAIN_APP.withOpacity(.2),
                  ),
                  Gap(10),
                  InkWell(
                    onTap: () {
                      Get.toNamed(HomeRouter.PIECHART, arguments: {
                        'options': controller.index.value,
                        'projectId': controller.projectId
                      });
                    },
                    borderRadius: BorderRadius.circular(10.sp),
                    child: Container(
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        color: ColorResources.MAIN_APP,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Text(
                        'View'.tr,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorResources.WHITE),
                      ),
                    ),
                    highlightColor: ColorResources.MAIN_APP.withOpacity(.2),
                    focusColor: ColorResources.MAIN_APP.withOpacity(.2),
                    splashColor: ColorResources.MAIN_APP.withOpacity(.2),
                  ),
                ],
              ),
            ]),
      ),
    );
  }

  Widget _dropdown() {
    return Row(
      children: [
        Text(
          'Statistic type: ',
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: ColorResources.BLACK),
        ),
        Obx(
          () => AppropDownButton<String>(
            borderRadius: SizeApp.RADIUS_2X,
            height: SizeApp.setSize(percent: .06),
            colorBorder: Colors.blue,
            backgroundColor: ColorResources.WHITE,
            width: SizeApp.setSizeWithWidth(percent: .4),
            value: controller.dataFilter.value,
            data: controller.filterData.value,
            isRequired: false,
            onChanged: (data) {
              print(data);
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
