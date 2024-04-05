// ignore_for_file: invalid_use_of_protected_member

import 'dart:core';
import 'dart:ffi';
import 'dart:io';

import 'package:feedback/feedback.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get_it/get_it.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/isar/rencetly_task_service.dart';
import 'package:test_intern/models/auth_model.dart';
import 'package:test_intern/presentation/pages/home/rate_us_dialog.dart';
import 'package:test_intern/presentation/pages/home/show_diaolog.dart';
import 'package:test_intern/repositories/auth_repositories.dart';
import 'package:test_intern/routers/auth_router.dart';
import 'package:test_intern/services/social_auth/social_auth_service.dart';

import '../../../resources/export/core_export.dart';

class HomeController extends GetxController {
  final SharedPreferenceHelper _sharedPreferenceHelper = sl.get<SharedPreferenceHelper>();
  AuthRepository _authRepository = GetIt.I.get<AuthRepository>();
  static const String UPDATE_RATE_US = 'UPDATE_RATE_US';
  RxList listTaskRecent = [].obs;

  RxList users = [].obs;
  String idUser = '';
  RxBool isLoading = true.obs;
  String avatar = '';

  @override
  Future<void> onInit() async {
    idUser = sl<SharedPreferenceHelper>().getIdUser;
    await getUser();
    await getTaskRecently();
    super.onInit();
  }

  Future<void> getUser() async {
    isLoading.value = true;
    await _authRepository.find(idUser, onSuccess: (data) {
      users.add(data);
      avatar = users.first.avatar;
      users.refresh();
    }, onError: (e) {});
    isLoading.value = false;
  }

  Future<void> getTaskRecently() async {
    await Get.find<RecentlyTask>().getDataIsar();
    listTaskRecent.value = await Get.find<RecentlyTask>().listTaskRenctly.value;
    listTaskRecent.refresh();
  }

  void ontapSetting(int index) {
    switch (index) {
      case 0:
        Get.toNamed(HomeRouter.CHANGELANGUAGE);
        break;
      case 1:
        Get.toNamed(HomeRouter.GRANT_PERMISSION);
        break;
      case 2:
        CommonHelper.onTapHandler(callback: () {
          submitFeedback();
        });
        break;
      case 3:
        signOut();
        break;

      default:
        signOut();
        break;
    }
  }

  void submitFeedback() async {
    BetterFeedback.of(Get.context!).show((UserFeedback userFeedBack) async {
      final screenshot = await writeImagetoStore(userFeedBack.screenshot);
      final Email email = Email(
        body: userFeedBack.text,
        subject: 'Feedback Predo',
        recipients: ['dangbichlai21@gmail.com'],
        attachmentPaths: [screenshot],
        isHTML: false,
      );
      await FlutterEmailSender.send(email);
    });
  }

  Future<String> writeImagetoStore(Uint8List feedbackImage) async {
    final Directory appDocDir = await getTemporaryDirectory();
    final String feedbackImagePath = '${appDocDir.path}/feedback.png';
    final File feedbackImageFile = File(feedbackImagePath);
    await feedbackImageFile.writeAsBytes(feedbackImage);
    return feedbackImagePath;
  }

  void signOutWithApi() {
    _authRepository.signOut(
      data: AuthModel(
        deviceID: sl<SharedPreferenceHelper>().getTokenDevice,
      ),
      onSuccess: (val) {},
      onError: (onError) {},
    );
  }

  Future<void> signOut({bool? isBlock = false}) async {
    try {
      if (isBlock == true) {
        AppAlert().info(message: 'alert_02'.tr);
      } else {
        Get.dialog(
          Center(
            child: Container(
              color: Colors.transparent,
              height: SizeApp.setSize(percent: .3),
              width: SizeApp.getMaxWidth() * .85,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: SizeApp.setSize(percent: .28),
                    padding: const EdgeInsets.only(top: 60),
                    width: SizeApp.getMaxWidth(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'setting_003'.tr,
                          style: TextStyle(
                            color: ColorResources.PRIMARY_1,
                            fontWeight: FontWeight.w700,
                            fontSize: SizeApp.LABEL_MEDIUM_FONT_SIZE,
                          ),
                        ),
                        const SizedBox(
                          height: SizeApp.SPACE_1X,
                        ),
                        Text(
                          'alert_03'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorResources.BLACK,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeApp.BODY_LARGE_FONT_SIZE,
                          ),
                        ),
                        const SizedBox(
                          height: SizeApp.SPACE_4X,
                        ),
                        Builder(builder: (context) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppButton(
                                type: AppButtonType.OUTLINE,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                width: SizeApp.setSizeWithWidth(percent: 0.35),
                                height: 40,
                                label: 'action_01'.tr,
                                colorBG: ColorResources.MAIN_APP,
                              ),
                              AppButton(
                                onTap: () async {
                                  EasyLoading.show(status: 'status_01'.tr);
                                  await removeLocalData();
                                  await EasyLoading.dismiss();
                                  Get.offAllNamed(AuthRouter.LOGIN);
                                  AppAlert().success(message: 'alert_04'.tr);
                                  signOutWithApi();
                                },
                                width: SizeApp.setSizeWithWidth(percent: 0.35),
                                height: 40,
                                label: 'action_02'.tr,
                                colorBG: ColorResources.MAIN_APP,
                                borderRadius: 10,
                              ),
                            ],
                          );
                        })
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: AppImage(ImagesPath.icLogout),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    } catch (err) {
      await EasyLoading.dismiss();
      AppAlert().error();
    }
  }

  /// Remove local data when user sign out
  Future<void> removeLocalData() async {
    // sl.get<SocketIO>().socket.dispose();
    _sharedPreferenceHelper.removeRefreshToken();
    _sharedPreferenceHelper.removeJwtToken();
    _sharedPreferenceHelper.removeIdUser();
    _sharedPreferenceHelper.removeLogger();
    GetIt.I.get<SocialAuthService>().socialLogout(socialType: SocialType.GOOGLE);
  }

  void rateUs(BuildContext context) {
    if (GetIt.I.get<SharedPreferenceHelper>().getIsRatedApp) {
      return;
    }
    ShowDialog.showGenerateDialog(
      context: context,
      childWidget: RateUsDialog(
        callBack: (rate) async {
          if (rate <= 3) {
            submitFeedback();
            //chuyển sang trang feek back
            // Get.toNamed(InAppPurchaseRouters.FEEDBACK);
          } else {
            GetIt.I.get<SharedPreferenceHelper>().setIsRatedApp(isRate: true);
            update([UPDATE_RATE_US]);
            // Inapp review
            final InAppReview inAppReview = InAppReview.instance;
            if (await inAppReview.isAvailable()) {
              await inAppReview.requestReview();
            }
          }
        },
      ),
      isAllowCloseOutSize: false,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
