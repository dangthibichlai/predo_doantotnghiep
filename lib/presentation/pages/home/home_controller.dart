import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/models/auth_model.dart';
import 'package:test_intern/repositories/auth_repositories.dart';
import 'package:test_intern/routers/auth_router.dart';
import 'package:test_intern/services/social_auth/social_auth_service.dart';

import '../../../resources/export/core_export.dart';

class HomeController extends GetxController {
  final SharedPreferenceHelper _sharedPreferenceHelper = sl.get<SharedPreferenceHelper>();
  AuthRepository _authRepository = GetIt.I.get<AuthRepository>();
  RxList users = [].obs;
  String idUser = '';
  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    idUser = sl<SharedPreferenceHelper>().getIdUser;
    await getUser();
    super.onInit();
  }

  Future<void> getUser() async {
    isLoading.value = true;
    await _authRepository.find(idUser, onSuccess: (data) {
      users.add(data);
      users.refresh();
    }, onError: (e) {});
    isLoading.value = false;
  }

  void ontapSetting(int index) {
    switch (index) {
      case 0:
        Get.toNamed(HomeRouter.CHANGELANGUAGE);
        break;
      case 1:
        Get.toNamed('/setting');
        break;
      case 2:
        Get.toNamed('/about');
        break;
      case 3:
        Get.toNamed('/help');
        break;
    }
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
              height: 250,
              width: SizeApp.getMaxWidth() * .85,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 210,
                    padding: const EdgeInsets.only(top: 60),
                    width: SizeApp.getMaxWidth(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'acount_12'.tr,
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
                                onTap: () {
                                  Get.back();
                                },
                                // : TextStyle(
                                //     fontWeight: FontWeight.w600,
                                //     fontSize: SizeApp.LABEL_SMALL_FONT_SIZE,
                                //     color: ColorResources.PRIMARY_1),
                                width: SizeApp.setSizeWithWidth(percent: 0.35),
                                height: 40,
                                label: 'action_01'.tr,
                                fillColor: ColorResources.WHITE,
                                // : const BorderSide(
                                //     color: ColorResources.PRIMARY_1),
                              ),
                              InkWell(
                                onTap: () async {
                                  EasyLoading.show(status: 'status_01'.tr);
                                  await removeLocalData();
                                  await EasyLoading.dismiss();
                                  Get.offAllNamed(AuthRouter.LOGIN);
                                  AppAlert().success(message: 'alert_04'.tr);
                                  signOutWithApi();
                                },
                                // textStyle: TextStyle(
                                //   fontWeight: FontWeight.w600,
                                //   fontSize: SizeApp.LABEL_SMALL_FONT_SIZE,
                                // ),
                                // width: SizeApp.setSizeWithWidth(percent: 0.35),
                                // height: 40,
                                // content: 'action_02'.tr,
                              ),
                            ],
                          );
                        })
                      ],
                    ),
                  ),
                  // Positioned(
                  //   top: 0,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(100),
                  //     child: SizedBox(
                  //       height: 80,
                  //       width: 80,
                  //       child: AppImage(ImagesPath.icLogout),
                  //     ),
                  //   ),
                  // )
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

  @override
  void onClose() {
    super.onClose();
  }
}
