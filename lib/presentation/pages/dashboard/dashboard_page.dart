// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/pages/dashboard/dashboard_controller.dart';
import 'package:test_intern/presentation/pages/home/home_page.dart';
import 'package:test_intern/presentation/pages/issue/issue_page.dart';
import 'package:test_intern/presentation/pages/notification/notification_page.dart';
import 'package:test_intern/presentation/pages/panel/panel_page.dart';
import 'package:test_intern/presentation/pages/project/project_page.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: GetBuilder(
            init: DashboardController(),
            builder: (context) {
              return SafeArea(
                child: SizedBox(
                    width: SizeApp.getMaxWidth(),
                    height: SizeApp.getMaxHeight(),
                    child: IndexedStack(
                      index: controller.tabIndex,
                      children: const [
                        HomePage(),
                        ProjectPage(),
                        IssuePage(),
                        PanelPage(),
                        NotificationPage(),
                      ],
                    )),
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              _bottomNavigationBarItem(
                  controller,
                  ImagesPath.homeIcon,
                  null,
                  'Trang chủ',
                  controller.tabIndex == 0
                      ? ColorResources.MAIN_APP
                      : ColorResources.GREY),
              _bottomNavigationBarItem(
                  controller, null, Icons.folder_outlined, 'Dự án', null),
              _bottomNavigationBarItem(
                  controller,
                  ImagesPath.issueIcon,
                  null,
                  'Vấn đề',
                  controller.tabIndex == 2
                      ? ColorResources.MAIN_APP
                      : ColorResources.GREY),
              _bottomNavigationBarItem(
                  controller,
                  ImagesPath.dashboardIcon,
                  null,
                  'Dashboard',
                  controller.tabIndex == 3
                      ? ColorResources.MAIN_APP
                      : ColorResources.GREY),
              _bottomNavigationBarItem(
                  controller,
                  null,
                  Icons.notifications_outlined,
                  'Thông báo',
                  controller.tabIndex == 4
                      ? ColorResources.MAIN_APP
                      : ColorResources.GREY)
            ],
            selectedItemColor: ColorResources.MAIN_APP,
            unselectedItemColor: ColorResources.GREY,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle:
                GoogleFonts.lexend(fontSize: SizeApp.BODY_SMALL_FONT_SIZE),
            unselectedLabelStyle:
                GoogleFonts.lexend(fontSize: SizeApp.BODY_SMALL_FONT_SIZE),
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem(
    DashboardController controller,
    String? path,
    IconData? icon,
    String? label,
    Color? color,
  ) {
    if (icon != null) {
      return BottomNavigationBarItem(
        icon: Icon(icon),
        label: label,
      );
    }
    if (path != null) {
      return BottomNavigationBarItem(
        // ignore: deprecated_member_use
        icon: SvgPicture.asset(path, color: color),
        label: label,
      );
    }
    return const BottomNavigationBarItem(
      icon: Icon(Icons.error),
      label: 'Error',
    );
  }
}