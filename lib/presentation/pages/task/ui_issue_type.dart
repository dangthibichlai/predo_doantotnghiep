import 'package:test_intern/core/hepler/app_input.dart';
import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/resources/export/core_export.dart';

class UIIssueType {
  final String? name;
  final String? description;
  final IconData? icon;
  final Color? color;

  UIIssueType({
    this.name,
    this.description,
    this.icon,
    this.color,
  });
  static UIIssueType? getUIIssueType(String issueTypeName) {
    for (var uiIssueTypeItem in uiIssueType) {
      if (uiIssueTypeItem.name == issueTypeName) {
        return uiIssueTypeItem;
      }
    }
    return null;
  }
}

List<UIIssueType> uiIssueType = [
  UIIssueType(
      name: issueTypeValues.reverse[IssueType.USER_STORY],
      description: 'A task represents work that needs to be done.'.tr,
      icon: Icons.bookmark_outlined,
      color: ColorResources.GREEN),
  UIIssueType(
      name: issueTypeValues.reverse[IssueType.BUG],
      description: 'A bug represents a problem that needs to be fixed.'.tr,
      icon: Icons.bug_report_outlined,
      color: ColorResources.RED),
  UIIssueType(
      name: issueTypeValues.reverse[IssueType.EPIC],
      description: 'An epic represents a big user story that needs to be broken down.'.tr,
      icon: Icons.article_outlined,
      color: ColorResources.MAIN_APP),
  UIIssueType(
      name: issueTypeValues.reverse[IssueType.SUB_TASK],
      description: 'A sub-task represents a small piece of work that needs to be done.'.tr,
      icon: Icons.checklist_rounded,
      color: ColorResources.YELLOW),
];
