// ignore_for_file: invalid_use_of_protected_member

import 'package:test_intern/presentation/pages/home/home_controller.dart';
import 'package:test_intern/presentation/widget/avata_header.dart';
import 'package:test_intern/resources/export/core_export.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.BGAPP,
        body: Obx(() => controller.isLoading.value
            ? Center(child: LoadingApp())
            : Padding(
                padding: SizeApp.setEdgeInsetsOnly(
                  left: 10.sp,
                  right: 10.sp,
                  top: SizeApp.setSize(percent: .019),
                ),
                child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      AvataHeaderWidget(),

                      Gap(15),
                      Text(
                        controller.users.value[0].full_name ?? '',
                        style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400, fontSize: 16.sp, color: ColorResources.MAIN_APP),
                      ),
                      // Spacer(),
                      // IconButton(
                      //     iconSize: 30,
                      //     onPressed: () {},
                      //     icon: const Icon(
                      //       Icons.add_rounded,
                      //     ))
                    ],
                  ),
                ]))));
  }
}
