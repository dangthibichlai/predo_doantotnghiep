// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_intern/presentation/pages/TEST.dart';
import 'package:test_intern/presentation/pages/introduction/introduction_binding.dart';
import 'package:test_intern/presentation/pages/introduction/introduction_page.dart';
import 'package:test_intern/presentation/pages/login/login_binding.dart';
import 'package:test_intern/presentation/pages/login/login_page.dart';
import 'package:test_intern/presentation/pages/otp/otp_binding.dart';
import 'package:test_intern/presentation/pages/otp/otp_page.dart';
import 'package:test_intern/presentation/pages/register/register_binding.dart';
import 'package:test_intern/presentation/pages/register/register_page.dart';
import 'package:test_intern/presentation/pages/splash/splash_binding.dart';
import 'package:test_intern/presentation/pages/splash/splash_page.dart';

mixin AuthRouter {
  static const String SPLASH = '/splash';
  static const String INTRODUCTION = '/introduction';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String OTP = '/otp';
  static const String TEST = '/test';

  static List<GetPage> listPage = [
    GetPage(
      name: TEST,
      page: () => HorizontalExample(),
    ),
    GetPage(
      name: SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: INTRODUCTION,
      page: () => const IntroductionPage(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(name: OTP, page: () => const OtpPage(), binding: OtpBinding()),
  ];
}
