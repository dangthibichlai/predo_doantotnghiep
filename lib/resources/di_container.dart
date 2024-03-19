// ignore_for_file: unused_local_variable

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_intern/repositories/auth_repositories.dart';
import 'package:test_intern/repositories/board_repository.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';
import 'package:test_intern/repositories/task_repository.dart';
import 'package:test_intern/services/dio/dio_client.dart';
import 'package:test_intern/services/dio/logging_interceptor.dart';
import 'package:test_intern/services/share_preference._helper.dart';
import 'package:test_intern/services/social_auth/social_auth_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ExternalshowADS(context)
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferenceHelper>(SharedPreferenceHelper(sharedPreferences));
  sl.registerSingleton<LoggingInterceptor>(LoggingInterceptor());
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerLazySingleton<SocialAuthService>(() => SocialAuthService());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository());
  sl.registerLazySingleton<ProjectReponsitory>(() => ProjectReponsitory());
  sl.registerLazySingleton<BoardRepository>(() => BoardRepository());
  sl.registerLazySingleton<TaskReponsitory>(() => TaskReponsitory());
}
