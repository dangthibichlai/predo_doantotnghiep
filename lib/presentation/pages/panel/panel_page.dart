import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/panel/panel_controller.dart';

class PanelPage extends GetView<PanelController> {
  const PanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Dashboard Page'),
      ),
    );
  }
}
