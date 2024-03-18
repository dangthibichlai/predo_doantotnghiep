import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiengviet/tiengviet.dart';

import '../../resources/app_color.dart';

mixin CommonHelper {
  static Future<void> onTapHandler({required Function callback}) async {
    callback();
  }

  static void primaryFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static LinearGradient backGroundScaffold = LinearGradient(
    colors: [
      ColorResources.BACKGROUND,
      ColorResources.BACKGROUND_2,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Color randomColorGenerator() {
    var r = new Random();
    return Color.fromRGBO(r.nextInt(256), r.nextInt(256), r.nextInt(256), 0.75);
  }

  static List<BoxShadow> boxShadow = [
    BoxShadow(
      offset: const Offset(0, 2),
      blurRadius: 15,
      color: ColorResources.OUTER_SPACE.withAlpha(10),
    ),
    BoxShadow(
      offset: const Offset(0, -2),
      blurRadius: 15,
      color: ColorResources.OUTER_SPACE.withAlpha(10),
    ),
    BoxShadow(
      offset: const Offset(2, 0),
      blurRadius: 15,
      color: ColorResources.OUTER_SPACE.withAlpha(10),
    ),
    BoxShadow(
      offset: const Offset(-2, 0),
      blurRadius: 15,
      color: ColorResources.OUTER_SPACE.withAlpha(10),
    ),
  ];
  
}
