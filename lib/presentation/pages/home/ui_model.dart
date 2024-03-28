import 'package:test_intern/core/hepler/app_input.dart';
import 'package:test_intern/resources/export/core_export.dart';

class UIModelHomeSetting {
  final String? title;
  final IconData? icon;
  final Function? onTap;

  UIModelHomeSetting({
    this.title,
    this.icon,
    this.onTap,
  });
}

List<UIModelHomeSetting> uiModelHomeSetting = [
  UIModelHomeSetting(
    title: 'setting_001',
    icon: Icons.language,
    onTap: () {},
  ),
  UIModelHomeSetting(
    title: 'setting_002',
    icon: Icons.notifications_active,
    onTap: () {},
  ),
  UIModelHomeSetting(
    title: 'setting_004',
    icon: Icons.rate_review,
    onTap: () {},
  ),
  UIModelHomeSetting(
    title: 'setting_003',
    icon: Icons.logout,
    onTap: () {},
  ),
];
