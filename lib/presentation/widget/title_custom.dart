import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleCustom extends StatelessWidget {
  const TitleCustom({super.key, this.title, this.sizeTitle, this.padding});
  final String? title;
  final double? sizeTitle;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(top: 7.0.sp, bottom: 10.0.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: TextStyle(fontSize: sizeTitle ?? 18.sp, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
