// ignore_for_file: constant_identifier_names

import 'package:test_intern/presentation/pages/chart/pie_chart/pie_chart_binding.dart';
import 'package:test_intern/presentation/pages/chart/pie_chart/pie_chart_page.dart';
import 'package:test_intern/presentation/pages/create_project/create_project_binding.dart';
import 'package:test_intern/presentation/pages/create_project/create_project_page.dart';
import 'package:test_intern/presentation/pages/feed_back/feed_back.dart';
import 'package:test_intern/presentation/pages/feed_back/feed_back_binding.dart';
import 'package:test_intern/presentation/pages/project/project_binding.dart';
import 'package:test_intern/presentation/pages/project/project_page.dart';
import 'package:test_intern/presentation/pages/settings_project/details-setting-project/details-setting_page.dart';
import 'package:test_intern/presentation/pages/settings_project/details-setting-project/details_setting_binding.dart';
import 'package:test_intern/presentation/pages/settings_project/members-setting-project/members-setting_page.dart';
import 'package:test_intern/presentation/pages/settings_project/members-setting-project/members_setting_binding.dart';
import 'package:test_intern/presentation/pages/task/task_detail.binding.dart';
import 'package:test_intern/presentation/pages/task/task_detail_page.dart';
import 'package:test_intern/presentation/pages/type_chart.dart/choose_chart_binding.dart';
import 'package:test_intern/presentation/pages/type_chart.dart/choose_type_chart.dart';
import 'package:test_intern/resources/export/core_export.dart';

import '../presentation/pages/grant_permission/grant_permission_binding.dart';
import '../presentation/pages/grant_permission/grant_permission_page.dart';

mixin HomeRouter {
  static const String PROJECTS = '/projects';
  static const String HOME = '/home';
  static const String DASHBOARD = '/dashboard';
  static const String PROJECTDETAIL = '/project-detail';
  static const String CHANGELANGUAGE = '/change-language';
  static const String KABANPROJECT = '/kaban-project';
  static const String SETTINGDETAIL = '/setting-detail';
  static const String CHOOSECHART = '/choose-chart';
  static const String PIECHART = '/pie-chart';
  static const String CREATEPROJECT = '/create-project';
  static const String TASKDETAIL = '/task-detail';
  static const String MEMBERS = '/members-setting';
  static const String GRANT_PERMISSION = '/grand_permissions';
  static const String FEEDBACK = '/feedback';

  static List<GetPage> listPage = [
    GetPage(
      name: FEEDBACK,
      page: () => FeedBackPage(),
      binding: FeedBackBinding(),
    ),
    GetPage(
      name: GRANT_PERMISSION,
      page: () => GrantPermissionPage(),
      binding: GrantPermissionBinding(),
    ),
    GetPage(
      name: MEMBERS,
      page: () => MembersSettingPage(),
      binding: MembersSettingBinding(),
    ),
    GetPage(
      name: TASKDETAIL,
      page: () => TaskDetailPage(),
      binding: TaskDetailBingding(),
    ),
    GetPage(
      name: CREATEPROJECT,
      page: () => CreateProjectPage(),
      binding: CreateProjectBingding(),
    ),
    GetPage(
      name: PIECHART,
      page: () => PieChartPage(),
      binding: PieChartBingding(),
    ),
    GetPage(
      name: CHOOSECHART,
      page: () => ChooseTypePage(),
      binding: ChooseChartBingding(),
    ),
    GetPage(
      name: SETTINGDETAIL,
      page: () => DetailsSettingPage(),
      binding: DetailsSettingBinding(),
    ),
    GetPage(
      name: KABANPROJECT,
      page: () => KabanProjectPage(),
      binding: KaBanProjectBingding(),
    ),
    GetPage(
      name: HOME,
      page: () => const HomePage(),
      binding: HomeBingding(),
    ),
    GetPage(
      name: DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBingding(),
    ),
    GetPage(
      name: CHANGELANGUAGE,
      page: () => ChangeLanguagePage(),
      binding: ChangeLanguageBinding(),
    ),
    GetPage(name: PROJECTS, page: () => ProjectPage(), binding: ProjectBinding()),
  ];
}
