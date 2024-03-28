import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_intern/core/hepler/app_dialog.dart';
import 'package:test_intern/presentation/widget/permission_dialog.dart';

class PermissionController extends GetxController with WidgetsBindingObserver {
  late Function whenPermissionDone;
  RxBool shouldAskPermission = RxBool(false);
  bool _isAllowVideo = false;
  bool _isAllowAudio = false;
  bool _shouldRequestPermission = false;
  bool _isInit = false;
  bool _isAndroidOS33 = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (await _getPermission()) {
        // Khi user sang cài đặt và quay trở lại với full permission
        callback();
      } else if (_shouldRequestPermission) {
        // Khi user sang cài đặt và quay trở lại chưa đủ permission
        // Request permission lần nữa.
        _shouldRequestPermission = false;
        _checkPermission();
      } else {
        // Chưa đủ permission, return.
        return;
      }
    }
  }

  // ignore: avoid_setters_without_getters
  set isInit(bool init) {
    _isInit = init;
  }

// 2
  void requestPermission(Function callback) {
    whenPermissionDone = callback;
    _showPermissionAsk();
  }

  ///
  /// User xác nhận cho phép truy cập
  ///
  void userConfirmPermissionAsk() {
    shouldAskPermission.value = false;
    // Check permissions before start camera.
    _checkPermission();
  }

  ///
  /// Show permission ask
  ///
  Future<void> _showPermissionAsk() async {
    shouldAskPermission.value = !await _getPermission();
    if (!shouldAskPermission.value) {
      // Check permissions before start camera.
      _checkPermission();
    }
  }

  ///
  /// get camera, storage, micro permission request.
  ///
  // 3
  Future<bool> _getPermission() async {
    if (_isAndroidOS33) {
      _isAllowVideo = await Permission.audio.isGranted;
      _isAllowVideo = await Permission.videos.isGranted;
    } else {
      _isAllowVideo = await Permission.storage.isGranted;
      _isAllowAudio = _isAllowAudio = _isAllowVideo;
    }
    return _isAllowVideo && _isAllowAudio;
  }

  ///
  /// request permissions before start camera.
  ///
  Future<void> _checkPermission() async {
    await _getAndroidDeviceInfo();

    // Request permission lần 1.
    // Permission nào đã granted thì thư viện tự bỏ qua.
    PermissionStatus _audioStatus;
    PermissionStatus _videoStatus;
    log('TechMind2: _isAndroidOS33 $_isAndroidOS33');
    if (_isAndroidOS33) {
      _audioStatus = await Permission.audio.request();
      _videoStatus = await Permission.videos.request();

      // Permission nào chưa permanentlyDenied thì thử request lần nữa.
      if (_audioStatus == PermissionStatus.denied) {
        _audioStatus = await Permission.audio.request();
      }
      if (_videoStatus == PermissionStatus.denied) {
        _videoStatus = await Permission.videos.request();
      }
    } else {
      // Permission nào chưa permanentlyDenied thì thử request lần nữa.
      _audioStatus = await Permission.storage.request();
      if (_audioStatus == PermissionStatus.denied) {
        _audioStatus = await Permission.storage.request();
      }
      _videoStatus = _audioStatus;
    }
    _isAllowAudio = _audioStatus == PermissionStatus.granted;
    _isAllowVideo = _videoStatus == PermissionStatus.granted;
    // Kiểm tra trạng thái permission
    if (!_isAllowVideo || !_isAllowAudio) {
      // Đã không thể show thêm bất kỳ permission request nào nữa.
      // Bắt buộc phải mở cài đặt.
      BaseDialog.showGenerateDialog(
        context: Get.context!,
        childWidget: PermissionDialog(
          title: 'permission_09'.tr,
          callBackSuccess: () async {
            _shouldRequestPermission = true;
            await openAppSettings();
          },
          callBackCancel: () {
            Get.back();
          },
        ),
        isAllowCloseOutSize: false,
        onWillPop: () {
          Get.back();
        },
      );
      // Sau khi cài đặt xong sẽ handle từ app onResume
      return;
    }
    // Đã có đủ quyền, bắt đầu lấy data.
    callback();
  }

  void callback() {
    if (!_isInit) {
      // Start the camera.
      _isInit = true;
      whenPermissionDone();
    }
  }

  Future<void> _getAndroidDeviceInfo() async {
    if (Platform.isAndroid) {
      await _fetchAndroidDeviceInfo();
    }
  }

  Future<void> _fetchAndroidDeviceInfo() async {
    final _androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
    if (_androidDeviceInfo.version.sdkInt >= 33) {
      _isAndroidOS33 = true;
      log('TechMind1__getAndroidDeviceInfo: _isAndroidOS33 $_isAndroidOS33');
    }
  }

  // Future<void> _getAndroidDeviceInfo() async {
  //   if (Platform.isAndroid) {
  //     //final _androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
  //     final _androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
  //     if (_androidDeviceInfo.version.sdkInt >= 33) {
  //       _isAndroidOS33 = true;
  //       log('TechMind__getAndroidDeviceInfo: _isAndroidOS33 $_isAndroidOS33');
  //     }
  //   }
  // }
}
