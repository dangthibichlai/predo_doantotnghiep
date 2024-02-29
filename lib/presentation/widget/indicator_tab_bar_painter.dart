import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class IndicatorExpertTabBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.00032258, size.height * 0.2000150),
        Offset(size.width, size.height * 0.0009528700),
        [Colors.blue.withOpacity(0.5), Colors.blue.withOpacity(1), Colors.blue.withOpacity(0.5)],
        [0, 0.5, 1]);
    canvas.drawOval(
        Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.5), width: size.width, height: size.height),
        paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
