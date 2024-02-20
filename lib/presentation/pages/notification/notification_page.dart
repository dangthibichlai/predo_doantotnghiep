import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_intern/presentation/pages/notification/notification_controller.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Notification Page'),
      ),
    );
  }
}
