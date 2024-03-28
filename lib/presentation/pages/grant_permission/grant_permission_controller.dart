import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_intern/core/hepler/app-validate.dart';

class GrantPermissionController extends GetxController with WidgetsBindingObserver {
  ///
  /// Declare the data.
  Rx<bool> cameraStatus = false.obs;
  Rx<bool> recordStatus = false.obs;
  Rx<bool> readAndWriteStatus = false.obs;

  // Get android version OS.
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  late AndroidDeviceInfo? _androidDeviceInfo;
  bool _isAndroidOS33 = false;

  // Is from settings.
  bool _isFromSetting = false;

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    //
    // Get android device info.
    _getAndroidDeviceInfo();

    // Get arguments.
    _getArguments();

    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    //
    // Close stream.
    cameraStatus.close();
    recordStatus.close();
    readAndWriteStatus.close();
    super.onClose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      _getStatusPermission();
    }
  }

  ///
  /// Get android device info.
  ///
  Future<void> _getAndroidDeviceInfo() async {
    if (Platform.isAndroid) {
      _androidDeviceInfo = await _deviceInfo.androidInfo;

      if (_androidDeviceInfo!.version.sdkInt >= 33) {
        _isAndroidOS33 = true;
      }
    }

    // Get status permission.
    _getStatusPermission();
  }

  ///
  /// Get arguments.
  ///
  void _getArguments() {
    if (!AppValidate.nullOrEmpty(Get.arguments)) {
      _isFromSetting = Get.arguments as bool;
    }
  }

  ///
  /// Get status permission.
  ///
  Future<void> _getStatusPermission() async {
    //
    // Camera status.
    final _cameraStatus = await Permission.camera.status;
    cameraStatus.value = _cameraStatus == PermissionStatus.granted;

    // Record status.
    final _recordStatus = await Permission.microphone.status;
    recordStatus.value = _recordStatus == PermissionStatus.granted;

    // Read and write status.
    late PermissionStatus _readAndWriteStatus;
    if (!_isAndroidOS33) {
      _readAndWriteStatus = await Permission.storage.status;
      readAndWriteStatus.value = _readAndWriteStatus == PermissionStatus.granted;
    } else {
      final _statusAudio = await Permission.audio.status;
      final _statusVideo = await Permission.videos.status;

      readAndWriteStatus.value = _statusAudio == PermissionStatus.granted && _statusVideo == PermissionStatus.granted;
    }
  }

  ///
  /// Request permissions camera.
  ///
  Future<void> requestPermissionsCamera() async {
    late PermissionStatus _status;

    _status = await Permission.camera.status;
    if (_status == PermissionStatus.permanentlyDenied) {
      _status = await Permission.camera.request();
      if (_status != PermissionStatus.granted) {
        openAppSettings();
      }
    } else if (_status != PermissionStatus.granted) {
      await Permission.camera.request();
    }

    _status = await Permission.camera.status;
    cameraStatus.value = _status == PermissionStatus.granted;
  }

  ///
  /// Request permissions record.
  ///
  Future<void> requestPermissionsRecord() async {
    late PermissionStatus _status;

    _status = await Permission.microphone.status;

    if (_status == PermissionStatus.permanentlyDenied) {
      _status = await Permission.microphone.request();
      if (_status != PermissionStatus.granted) {
        openAppSettings();
      }
    } else if (_status != PermissionStatus.granted) {
      await Permission.microphone.request();
    }

    _status = await Permission.microphone.status;
    recordStatus.value = _status == PermissionStatus.granted;
  }

  ///
  /// Request permission store.
  ///
  Future<void> requestPermissionStore() async {
    if (!_isAndroidOS33) {
      await _requestPermissionsReadAndWrite();
    } else {
      await _requestPermissionsReadAndWriteAndroidOS33();
    }
  }

  ///
  /// Request permissions read and write.
  ///
  Future<void> _requestPermissionsReadAndWrite() async {
    late PermissionStatus _status;

    _status = await Permission.storage.status;

    if (_status == PermissionStatus.permanentlyDenied) {
      _status = await Permission.storage.request();
      if (_status != PermissionStatus.granted) {
        openAppSettings();
      }
    } else if (_status != PermissionStatus.granted) {
      await Permission.storage.request();
    }

    _status = await Permission.storage.status;
    readAndWriteStatus.value = _status == PermissionStatus.granted;
  }

  ///
  /// Request permissions read and write.
  ///
  Future<void> _requestPermissionsReadAndWriteAndroidOS33() async {
    final _statusAudio = await _checkAudioPermissions();
    final _statusVideo = await _checkVideoPermissions();

    readAndWriteStatus.value = _statusAudio && _statusVideo;
  }

  ///
  /// Check audio permissions.
  ///
  Future<bool> _checkAudioPermissions() async {
    late PermissionStatus _statusAudio;

    _statusAudio = await Permission.audio.status;

    if (_statusAudio == PermissionStatus.permanentlyDenied) {
      _statusAudio = await Permission.audio.request();
      if (_statusAudio != PermissionStatus.granted) {
        openAppSettings();
      }
    } else if (_statusAudio != PermissionStatus.granted) {
      await Permission.audio.request();
    }

    _statusAudio = await Permission.audio.status;
    return _statusAudio == PermissionStatus.granted;
  }

  ///
  /// Check video permissions.
  ///
  Future<bool> _checkVideoPermissions() async {
    late PermissionStatus _statusVideo;

    _statusVideo = await Permission.videos.status;

    if (_statusVideo == PermissionStatus.permanentlyDenied) {
      _statusVideo = await Permission.videos.request();
      if (_statusVideo != PermissionStatus.granted) {
        openAppSettings();
      }
    } else if (_statusVideo != PermissionStatus.granted) {
      await Permission.videos.request();
    }

    _statusVideo = await Permission.videos.status;
    return _statusVideo == PermissionStatus.granted;
  }

  ///
  /// Go to home page.
  ///
  
}
