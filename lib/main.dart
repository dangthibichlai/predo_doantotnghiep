import 'dart:async';
import 'dart:developer';

import 'package:feedback/feedback.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test_intern/app-binding.dart';
import 'package:test_intern/core/hepler/app-alert.dart';
import 'package:test_intern/firebase_options.dart';
import 'package:test_intern/presentation/pages/dashboard/dashboard_controller.dart';
import 'package:test_intern/presentation/pages/project/project_controller.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';
import 'package:test_intern/resources/export/core_export.dart';
import 'package:test_intern/routers/app-router.dart';
import 'package:test_intern/routers/auth_router.dart';
import 'package:test_intern/services/notification_services/firebase_service.dart';
import 'package:timeago/timeago.dart' as time_ago;
import 'package:uni_links/uni_links.dart';

import '../../resources/di_container.dart' as di;

DateTime? now;
Uri? _initialURI;
Uri? _currentURI;
Object? _err;

StreamSubscription? _streamSubscription;
bool _initialURILinkHandled = false;

Future<void> initUniLinks() async {
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    final initialLink = await getInitialLink();
    if (initialLink != null && !_initialURILinkHandled) {
      _initialURI = Uri.parse(initialLink);
      log('Initial link: $_initialURI');
      _initialURILinkHandled = true;
    }

    log('Initial link: ${initialLink.toString()}');
    // Parse the link and warn the user, if it is not correct,
    // but keep in mind it could be `null`.
  } on PlatformException {
    // Handle exception by warning the user their action did not succeed
    log('Error: $_err');
    // return?
  }

  _streamSubscription = linkStream.listen((String? link) async {
    // Parse the link and warn the user, if it is not correct
    log('Link: $link');
    await handleLink(Uri.parse(link!));

  }, onError: (err) {
    // Handle exception by warning the user their action did not succeed
    log('Error: $err');
  });
}

Future<void> handleLink(Uri uri) async {
  List<String> segments = uri.pathSegments;

  String lastSegment = segments.last;
  log(lastSegment);
  var token = sl<SharedPreferenceHelper>().getJwtToken;

  if (token != '') {
    ProjectReponsitory _projectReponsitory = ProjectReponsitory();
    _projectReponsitory.joinProject(
        tokenInvite: lastSegment,
        onSuccess: (data) {
          Get.find<ProjectController>().onInit();
          Get.find<DashboardController>().tabIndex = 1;
          Get.offNamed(HomeRouter.DASHBOARD);

          AppAlert(milliseconds: 3000).info(message: data);
        },
        onError: ((error) {
          AppAlert(milliseconds: 3000).error(message: error);
        }));
  } else {
    AppAlert(milliseconds: 3000)
        .error(message: 'You need to login first before join project.');
  }
}

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

  di.sl<SharedPreferenceHelper>().setTokenDevice(_deviceToken.toString());
  log('Device id: $_deviceToken');

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //set màu cho thanh điều hướng  tệp vào màu appBar mà bạn muốn
    statusBarColor: ColorResources.BGAPP,
    statusBarIconBrightness: Brightness.dark,
  ));
  time_ago.setLocaleMessages('en', time_ago.ViMessages());
  await initUniLinks();
//   PermissionStatus status = await Permission.notification.status;

//   if (!status.isGranted) {
// // The permission is not granted, request it. status = await Permission.notification.request();
//   }

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
          child: BetterFeedback(
            theme: FeedbackThemeData(
              background: Colors.grey,
              feedbackSheetColor: Colors.grey[50]!,
              drawColors: [
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.yellow,
              ],
            ),
            child: GetMaterialApp(
              initialRoute: AuthRouter.SPLASH,
              initialBinding: AppBinding(),
              transitionDuration: const Duration(),
              locale: LocalizationService.locale,
              fallbackLocale: LocalizationService.fallbackLocale,
              translations: LocalizationService(),
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
                      data: MediaQuery.of(context).copyWith(
                        boldText: false,
                      ),
                      child: widget!,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
