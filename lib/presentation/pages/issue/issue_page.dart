import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/issue/issue_controller.dart';

class IssuePage extends GetView<IssueController> {
  const IssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
