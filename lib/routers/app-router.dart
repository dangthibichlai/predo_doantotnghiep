import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_intern/routers/auth_router.dart';
import 'package:test_intern/routers/home_router.dart';

mixin AppPages {
  static List<GetPage> list = [
    ...AuthRouter.listPage,
    ...HomeRouter.listPage,
  ];
}
