import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_intern/core/enums/enums.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/repositories/base/api_response.dart';
import 'package:test_intern/repositories/exception/api_error_handler.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:test_intern/resources/images_path.dart';

class AppAlert {
  ///
  /// Declare toast.
  final showToast = FToast();
  int? milliseconds;
  AppAlert({this.milliseconds}) {
    init();
  }

  ///
  /// Init toast.
  ///
  void init() {
    showToast.init(Get.context!);
  }

  /// Show api error
  void commonError(dynamic err) {
    final message = ApiResponse.withError(ApiErrorHandler.getMessage(err)).error.toString();

    error(message: message);
  }

  ///
  /// Show info.
  ///
  void info({
    required String message,
    ToastGravity? toastGravityPosition,
    int? duration
  }) {
    showToast.removeQueuedCustomToasts();
    showToast.showToast(
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: Get.mediaQuery.padding.top + 15,
          left: 0,
          right: 0,
          child: child,
        );
      },
      toastDuration: Duration(milliseconds: duration ?? 1200),
      child: customToast(message: message, typeOfAlert: TypeOfAlert.INFO),
      gravity: toastGravityPosition ?? ToastGravity.TOP,
    );
  }

  ///
  /// Show successfully.
  ///
  void success({
    required String message,
    ToastGravity? toastGravityPosition,
  }) {
    showToast.removeQueuedCustomToasts();
    showToast.showToast(
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: Get.mediaQuery.padding.top + 15,
          left: 0,
          right: 0,
          child: child,
        );
      },
      child: customToast(message: message, typeOfAlert: TypeOfAlert.SUCCESS),
      gravity: toastGravityPosition ?? ToastGravity.TOP,
      toastDuration: const Duration(milliseconds: 1200),
    );
  }

  ///
  /// Show error.
  ///
  void error({
    String message = 'Đã có lỗi xảy ra, vui lòng thử lại sau',
    ToastGravity? toastGravityPosition,
    Duration? toastDuration,
  }) {
    showToast.removeQueuedCustomToasts();
    showToast.showToast(
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: Get.mediaQuery.padding.top + 15,
          left: 0,
          right: 0,
          child: child,
        );
      },
      child: customToast(message: message, typeOfAlert: TypeOfAlert.ERROR),
      gravity: toastGravityPosition ?? ToastGravity.TOP,
      toastDuration: toastDuration ?? const Duration(milliseconds: 1200),
    );
  }

  ///
  /// Show warring.
  ///
  void warring({
    required String message,
    ToastGravity? toastGravityPosition,
  }) {
    showToast.removeQueuedCustomToasts();
    showToast.showToast(
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: Get.mediaQuery.padding.top + 15,
          left: 0,
          right: 0,
          child: child,
        );
      },
      child: customToast(message: message, typeOfAlert: TypeOfAlert.WARRING),
      gravity: toastGravityPosition ?? ToastGravity.TOP,
      toastDuration: Duration(milliseconds: milliseconds ?? 900),
    );
  }

  ///
  /// customToastSuccessful
  ///
  Widget customToast({
    required String message,
    required TypeOfAlert typeOfAlert,
    Color? colorBG,
    double? sizeWidthToast,
  }) {
    ///
    /// Generate title alert.
    ///
    String _genTitleAlert(TypeOfAlert type) {
      switch (type) {
        case TypeOfAlert.SUCCESS:
          return 'alert_001'.tr;
        case TypeOfAlert.INFO:
          return 'alert_002'.tr;
        case TypeOfAlert.ERROR:
          return 'alert_003'.tr;
        default:
          return 'alert_004'.tr;
      }
    }

    ///
    /// Generate background color.
    ///
    Color _genBackgroundColor(TypeOfAlert type) {
      switch (type) {
        case TypeOfAlert.SUCCESS:
          return ColorResources.SUCCESS_ALERT;
        case TypeOfAlert.INFO:
          return ColorResources.INFO_ALERT;
        case TypeOfAlert.WARRING:
          return ColorResources.WARRING_ALERT;
        default:
          return ColorResources.ERROR_ALERT;
      }
    }

    ///
    /// Convert color to dark color.
    ///
    HSLColor _genDartColor(TypeOfAlert type) {
      switch (type) {
        case TypeOfAlert.SUCCESS:
          final hsl = HSLColor.fromColor(ColorResources.SUCCESS_ALERT);
          final hslDark = hsl.withLightness((hsl.lightness - 0.1).clamp(0.0, 0.9));
          return hslDark;
        case TypeOfAlert.INFO:
          final hsl = HSLColor.fromColor(ColorResources.INFO_ALERT);
          final hslDark = hsl.withLightness((hsl.lightness - 0.1).clamp(0.0, 0.9));
          return hslDark;
        case TypeOfAlert.WARRING:
          final hsl = HSLColor.fromColor(ColorResources.WARRING_ALERT);
          final hslDark = hsl.withLightness((hsl.lightness - 0.1).clamp(0.0, 0.9));
          return hslDark;
        default:
          final hsl = HSLColor.fromColor(ColorResources.ERROR_ALERT);
          final hslDark = hsl.withLightness((hsl.lightness - 0.1).clamp(0.0, 0.9));
          return hslDark;
      }
    }

    ///
    /// Generate image path.
    ///
    String _genImagePath(TypeOfAlert type) {
      switch (type) {
        case TypeOfAlert.SUCCESS:
          return ImagesPath.alertIcSuccessAlert;
        case TypeOfAlert.INFO:
          return ImagesPath.alertIcHelpAlert;
        default:
          return ImagesPath.alertIcWarningAlert;
      }
    }

    return Row(
      children: [
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: SizeApp.setEdgeInsetsSymmetric(horizontal: SizeApp.setSizeWithWidth(percent: .03)),
                padding: SizeApp.setEdgeInsetsOnly(
                  left: SizeApp.setSizeWithWidth(percent: .13),
                  top: 15,
                  right: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: _genBackgroundColor(typeOfAlert),
                  borderRadius: SizeApp.setBorderRadiusAll(radius: SizeApp.SPACE_2X),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 25,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _genTitleAlert(typeOfAlert),
                            style: Theme.of(Get.context!).textTheme.labelMedium?.copyWith(
                                  color: ColorResources.WHITE,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Padding(
                            padding: SizeApp.setEdgeInsetsOnly(top: 3),
                            child: Text(
                              message,
                              style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(
                                    color: ColorResources.WHITE,
                                  ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// other SVGs in body
              Positioned(
                bottom: 0,
                left: SizeApp.setSizeWithWidth(percent: 0.035),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                  ),
                  child: AppImage(
                    ImagesPath.alertIcBubblesAlert,
                    height: SizeApp.setSize(percent: 0.05),
                    width: SizeApp.setSize(percent: 0.04),
                    colorIconsSvg: _genDartColor(typeOfAlert).toColor(),
                  ),
                ),
              ),

              Positioned(
                top: -SizeApp.setSize(percent: 0.018),
                left: SizeApp.setSize(percent: 0.05),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AppImage(
                      ImagesPath.alertIcBackAlert,
                      width: SizeApp.setSize(percent: 0.03),
                      colorIconsSvg: _genDartColor(typeOfAlert).toColor(),
                    ),
                    Positioned(
                      top: SizeApp.setSize(percent: 0.008),
                      child: AppImage(
                        _genImagePath(typeOfAlert),
                        height: SizeApp.setSize(percent: 0.015),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
