import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_intern/app-binding.dart';
import 'package:test_intern/firebase_options.dart';
import 'package:test_intern/resources/export/core_export.dart';
import 'package:test_intern/routers/app-router.dart';
import 'package:test_intern/routers/auth_router.dart';
import 'package:test_intern/services/notification_services/firebase_service.dart';
import 'package:timeago/timeago.dart' as time_ago;
import '../../resources/di_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';

DateTime? now;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Init Get it.
  await di.init();
  await Firebase.initializeApp(
    // name: "AIFriendChat",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Setup firebase services.
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  await FcmService().init();

  await FcmService().initForegroundNotification();
  FcmService().backgroundHandler();

  // Get device token.
  final String? _deviceToken = await messaging.getToken();

  log('Device id: $_deviceToken');
  di.sl<SharedPreferenceHelper>().setTokenDevice(_deviceToken.toString());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //set màu cho thanh điều hướng  tệp vào màu appBar mà bạn muốn
    statusBarColor: ColorResources.BGAPP,
    statusBarIconBrightness: Brightness.dark,
  ));
  time_ago.setLocaleMessages('vi', time_ago.ViMessages());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 800),
      useInheritedMediaQuery: true,
      builder: (context, index) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            initialRoute: AuthRouter.SPLASH,
            // initialRoute: HomeRouter.TASKDETAIL,
            initialBinding: AppBinding(),
            transitionDuration: const Duration(),
            getPages: AppPages.list,
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(
              builder: (context, widget) {
                return Theme(
                  data: ThemeData(
                    primarySwatch: Colors.blue,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                  ),
                  child: MediaQuery(
                    // Setting font does not change with system font size
                    data: MediaQuery.of(context).copyWith(
                      boldText: false,
                    ),
                    child: widget!,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
