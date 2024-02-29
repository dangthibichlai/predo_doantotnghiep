import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:test_intern/presentation/pages/project_detail/project-detail_controller.dart';
import 'package:test_intern/presentation/widget/tabbar.dart';
import 'package:test_intern/resources/app_color.dart';

class ProjecDetailtPage extends GetView<ProjectDetailController> {
  const ProjecDetailtPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    size: 22.sp,
                    color: ColorResources.BLACK.withOpacity(.5),
                  )),
              Text('Math Kisd Game',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: ColorResources.MAIN_APP)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 20.sp,
                    color: ColorResources.BLACK.withOpacity(1),
                  )),
            ],
          ),
          ExpertsTabBar(
            onTap: (value) {
              controller.currentPageIndex(value);
            },
          ),
        ],
      ),
    ));
  }
}
