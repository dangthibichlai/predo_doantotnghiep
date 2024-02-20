import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
  const DashboardPage({super.key});

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
          bottomNavigationBar: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            selectedIndex: controller.tabIndex,
            onDestinationSelected: controller.changeTabIndex,
            destinations: <Widget>[
              navigationBarItem(
                  controller,
                  ImagesPath.homeIcon,
                  null,
                  'Trang chủ',
                  controller.tabIndex == 0
                      ? ColorResources.MAIN_APP
                      : ColorResources.GREY),
              navigationBarItem(
                  controller,
                  null,
                  Icons.folder_outlined,
                  'Dự án',
                  controller.tabIndex == 1
                      ? ColorResources.MAIN_APP
                      : ColorResources.GREY),
              navigationBarItem(
                  controller,
                  ImagesPath.issueIcon,
                  null,
                  'Vấn đề',
                  controller.tabIndex == 2
                      ? ColorResources.MAIN_APP
                      : ColorResources.GREY),
              navigationBarItem(
                  controller,
                  ImagesPath.dashboardIcon,
                  null,
                  'Dashboard',
                  controller.tabIndex == 3
                      ? ColorResources.MAIN_APP
                      : ColorResources.GREY),
              navigationBarItem(
                  controller,
                  null,
                  Icons.notifications_outlined,
                  'Thông báo',
                  controller.tabIndex == 4
                      ? ColorResources.MAIN_APP
                      : ColorResources.GREY)
            ],
          ),
        );
      },
    );
  }

  navigationBarItem(
    DashboardController controller,
    String? path,
    IconData? icon,
    String? label,
    Color? color,
  ) {
    if (icon != null) {
      return NavigationDestination(
        icon: Icon(icon, color: color),
        label: label ?? '',
      );
    }
    if (path != null) {
      return NavigationDestination(
        icon: SvgPicture.asset(path, color: color),
        label: label ?? '',
      );
    }
    return const NavigationDestination(
      icon: Icon(Icons.error),
      label: 'Error',
    );
  }
}
