import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/resources/app_color.dart';

class OtpInputWidget extends StatelessWidget {
  const OtpInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: SizeApp.setEdgeInsetsOnly(
        top: SizeApp.SPACE_5X,
        bottom: SizeApp.SPACE_5X,
      ),
      width: SizeApp.setSize(percent: 0.45),
      child: PinCodeTextField(
        appContext: context,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 300),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          fieldHeight: 50.0,
          fieldWidth: 40.0,
          activeFillColor: ColorResources.WHITE,
          inactiveColor: ColorResources.GREY,
          activeColor: ColorResources.MAIN_APP,
          selectedColor: ColorResources.MAIN_APP,
        ),
        enableActiveFill: false,
        onCompleted: (v) {
        },
        onChanged: (value) {},
      ),
    );
  }
}
