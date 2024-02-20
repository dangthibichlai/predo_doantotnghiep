import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_intern/app-binding.dart';
import 'package:test_intern/routers/app-router.dart';
import 'package:test_intern/routers/auth_router.dart';

void main() {
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
                      boldText: false, textScaler: const TextScaler.linear(1.0),
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
