import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/project/project_controller.dart';

class ProjectPage extends GetView<ProjectController> {
  const ProjectPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Project Page'),
      ),
    );
  }
}
