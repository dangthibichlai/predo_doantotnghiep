import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/presentation/pages/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
