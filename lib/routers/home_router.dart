// ignore_for_file: constant_identifier_names

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_intern/presentation/pages/dashboard/dashboard_binding.dart';
import 'package:test_intern/presentation/pages/dashboard/dashboard_page.dart';
import 'package:test_intern/presentation/pages/home/home_binding.dart';
import 'package:test_intern/presentation/pages/home/home_page.dart';

mixin HomeRouter {
  static const String HOME = '/home';
  static const String DASHBOARD = '/dashboard';
  static List<GetPage> listPage = [
    GetPage(
      name: HOME,
      page: () => const HomePage(),
      binding: HomeBingding(),
    ),
    GetPage(
      name: DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBingding(),
    )
  ];
}
