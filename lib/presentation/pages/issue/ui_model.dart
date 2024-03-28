import 'package:test_intern/resources/export/core_export.dart';

class FilterModel {
  final String title;
  final IconData? icon;

  FilterModel({
    required this.title,
    this.icon,
  });
}

List<FilterModel> filterList = [
  FilterModel(title: 'My open issues'.tr, icon: Icons.person),
  FilterModel(title: 'All issues'.tr, icon: Icons.menu_open),
  FilterModel(title: 'In Progress issues'.tr, icon: Icons.timer_outlined),
  FilterModel(title: 'Done issues'.tr, icon: Icons.done_all_outlined),
  FilterModel(title: 'To Do issues'.tr, icon: Icons.check_circle_outline_rounded),
  FilterModel(title: 'Unassigned issues'.tr, icon: Icons.show_chart_sharp),
];
