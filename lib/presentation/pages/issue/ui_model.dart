import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/resources/export/core_export.dart';

class FilterModel {
  final String title;
  final IconData? icon;
  final String option;

  FilterModel({
    required this.title,
    this.icon,
    required this.option,
  });
}

List<FilterModel> filterList = [
  FilterModel(
      title: 'My open issues'.tr, icon: Icons.person, option: optionValues.reverse[OptionsType.MY_OPEN_ISSUE] ?? ''),
  FilterModel(
      title: 'In Progress issues'.tr,
      icon: Icons.timer_outlined,
      option: optionValues.reverse[OptionsType.IN_PROGRESS_ISSUE] ?? ''),
  FilterModel(
      title: 'Done issues'.tr,
      icon: Icons.done_all_outlined,
      option: optionValues.reverse[OptionsType.DONE_ISSUE] ?? ''),
  FilterModel(
      title: 'To Do issues'.tr,
      icon: Icons.check_circle_outline_rounded,
      option: optionValues.reverse[OptionsType.TO_DO_ISSUE] ?? ''),
  FilterModel(
      title: 'Unassigned issues'.tr,
      icon: Icons.show_chart_sharp,
      option: optionValues.reverse[OptionsType.UNASSIGNED_ISSUE] ?? ''),
];
