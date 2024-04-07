import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/presentation/pages/home/home_controller.dart';
import 'package:test_intern/presentation/widget/choose_image_controller.dart';
import 'package:test_intern/repositories/auth_repositories.dart';
import '../../resources/export/core_export.dart';
import 'choose_image_dialog.dart';

class ChangeAvatarWidget extends StatefulWidget {
  const ChangeAvatarWidget({
    super.key,
    this.imagePath,
    this.callBackPickFile,
    this.isEdit,
    this.isAvatar,
  });

  final String? imagePath;
  final Function(File? file)? callBackPickFile;
  final bool? isEdit;
  final bool? isAvatar;

  @override
  State<ChangeAvatarWidget> createState() => _ChangeAvatarWidgetState();
}

class _ChangeAvatarWidgetState extends State<ChangeAvatarWidget> {
  // Declare the data.
  File? _filePicker;
  bool? isShowSave = false;
  RxBool isLoadingSave = false.obs;

  final ChooseImageController _chooseImageController = ChooseImageController();

  @override
  void initState() {
    if (!AppValidate.nullOrEmpty(widget.imagePath)) {
      setState(() {});
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChangeAvatarWidget oldWidget) {
    if (oldWidget.imagePath != widget.imagePath) {
      if (!AppValidate.nullOrEmpty(widget.imagePath)) {
        setState(() {});
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            if (widget.isEdit == true)
              if (widget.isAvatar == true)
                ClipOval(
                  child: !AppValidate.nullOrEmpty(_filePicker)
                      ? Image.file(
                          _filePicker!,
                          width: SizeApp.setSizeWithWidth(percent: .25),
                          height: SizeApp.setSizeWithWidth(percent: .25),
                          fit: BoxFit.cover,
                        )
                      : AppImage(widget.imagePath!,
                          width: SizeApp.setSizeWithWidth(percent: .25),
                          height: SizeApp.setSizeWithWidth(percent: .25)),
                )
              else
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: !AppValidate.nullOrEmpty(_filePicker)
                      ? Image.file(
                          _filePicker!,
                          height: Get.width * .5,
                          width: Get.width,
                          fit: BoxFit.cover,
                        )
                      : AppImage(
                          widget.imagePath!,
                          height: Get.width * .5,
                          width: Get.width,
                        ),
                )
            else
              !AppValidate.nullOrEmpty(_filePicker)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        _filePicker!,
                        height: Get.width * .5,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        chooseMediaOptionsDialog(
                          context,
                          onCameraTap: () {
                            _handleLoadImage(isFromCamera: true);
                          },
                          onGalleryTap: () {
                            _handleLoadImage();
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: Get.width * .5,
                        width: Get.width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: ColorResources.BGAPP),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipOval(
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: ColorResources.GREY,
                                  borderRadius: BorderRadius.circular(
                                    8.sp,
                                  ),
                                ),
                                child: AppImage(
                                  ImagesPath.cameraIc,
                                  colorIconsSvg: ColorResources.WHITE,
                                  width: SizeApp.setSizeWithWidth(percent: .04),
                                ),
                              ),
                            ),
                            const SizedBox(width: SizeApp.RADIUS_1X),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                'acount_41'.tr,
                                style: TextStyle(
                                    fontSize: 12.sp, fontWeight: FontWeight.w600, color: ColorResources.TEXT_BOLD),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            if (widget.isAvatar == true)
              Positioned(
                  top: 70,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      chooseMediaOptionsDialog(
                        context,
                        onCameraTap: () {
                          _handleLoadImage(isFromCamera: true);
                        },
                        onGalleryTap: () {
                          _handleLoadImage();
                        },
                      );
                    },
                    child: isShowSave ?? false
                        ? Obx(
                            () => isLoadingSave.value
                                ? CircularProgressIndicator(
                                    color: ColorResources.MAIN_APP,
                                    strokeWidth: 2,
                                  )
                                : AppButton(
                                    padding: REdgeInsets.only(right: 2, top: 2, bottom: 2),
                                    onTap: () {
                                      saveAvatar();
                                    },
                                    width: SizeApp.setSizeWithWidth(percent: .12),
                                    height: 20,
                                    label: 'Save changes'.tr,
                                    borderRadius: 5,
                                    fontSizedLabel: 11.sp,
                                    colorBG: ColorResources.MAIN_APP,
                                  ),
                          )
                        : Container(
                            padding: SizeApp.setEdgeInsetsAll(
                              SizeApp.SPACE_1X,
                            ),
                            decoration: BoxDecoration(
                              color: ColorResources.WHITE,
                              borderRadius: BorderRadius.circular(
                                8.sp,
                              ),
                            ),
                            child: AppImage(
                              ImagesPath.cameraIc,
                              width: SizeApp.setSizeWithWidth(percent: .05),
                            ),
                          ),
                  ))
            else if (widget.isEdit == true || !AppValidate.nullOrEmpty(_filePicker))
              Positioned(
                top: SizeApp.SPACE_2X,
                right: SizeApp.SPACE_2X,
                child: GestureDetector(
                  onTap: () {
                    chooseMediaOptionsDialog(
                      context,
                      onCameraTap: () {
                        _handleLoadImage(isFromCamera: true);
                      },
                      onGalleryTap: () {
                        _handleLoadImage();
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(0.2),
                        border: Border.all(
                          width: 1.h,
                          color: Colors.white,
                        ),
                        borderRadius: SizeApp.setBorderRadiusAll(radius: 8)),
                    height: 30.h,
                    width: 90.w,
                    child: Center(
                      child: Text(
                        'action_08'.tr,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ColorResources.WHITE,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        // const SizedBox(
        //   height: 12,
        // ),
        // if (widget.isAvatar == true)
        //   GestureDetector(
        //     onTap: () {
        //       chooseMediaOptionsDialog(
        //         context,
        //         onCameraTap: () {
        //           _handleLoadImage(isFromCamera: true);
        //         },
        //         onGalleryTap: () {
        //           _handleLoadImage();
        //         },
        //       );
        //     },
        //     child: Text('acount_37'.tr,
        //         style: TextStyle(
        //             color: ColorResources.PRIMARY_1,
        //             fontSize: SizeApp.BODY_LARGE_FONT_SIZE,
        //             fontWeight: FontWeight.w600)),
        //   )
      ],
    );
  }

  // thay đổi  isShowSave = true;
  Future<void> saveAvatar() async {
    isLoadingSave.value = true;
    AuthRepository authRepository = GetIt.I.get<AuthRepository>();
    // DioClient dioClient = GetIt.I.get<DioClient>();
    // final file = dioClient.uploadImages('/upload', files: [_filePicker!]);
    await authRepository.updateAvatar(
        file: _filePicker ?? File(''),
        onSuccess: (data) {
          Get.find<HomeController>().getUser();
          AppAlert().success(message: 'Lưu thành công'.tr);
        },
        onError: (e) {
          AppAlert().error(message: 'Lưu thất bại'.tr);
        });
    isLoadingSave.value = false;
    setState(() {
      isShowSave = false;
    });
  }

  Future<void> _handleLoadImage({bool isFromCamera = false}) async {
    final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
    late AndroidDeviceInfo? _androidDeviceInfo;
    bool _isAndroidOS33 = false;
    final result;
    if (Platform.isAndroid) {
      _androidDeviceInfo = await _deviceInfo.androidInfo;

      if (_androidDeviceInfo.version.sdkInt >= 33) {
        _isAndroidOS33 = true;
      }
    }
    if (isFromCamera) {
      final result = await Permission.camera.request();
      if (result.isDenied) {
        AppAlert().error(message: 'error_file_03'.tr);
        return;
      }
    } else {
      if (!_isAndroidOS33) {
        result = await Permission.storage.request();
      } else {
        result = PermissionStatus.granted;
      }
      if (result == PermissionStatus.denied) {
        AppAlert().error(message: 'error_file_03'.tr);
        return;
      }
    }

    _filePicker = await _chooseImageController.handleGetImageFromCamera(
      isFromCamera: isFromCamera,
    );

    setState(() {
      isShowSave = true;
    });

    if (widget.callBackPickFile != null) {
      widget.callBackPickFile!(_filePicker);
    } // hàm trả về file đã chọn để xử lý ở ngoài widget này
  }
}
