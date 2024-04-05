// ignore_for_file: unused_local_variable

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_intern/isar/isar_project_reponsitory.dart';
import 'package:test_intern/isar/isar_task_reponsitory.dart';
import 'package:test_intern/repositories/auth_repositories.dart';
import 'package:test_intern/repositories/board_repository.dart';
import 'package:test_intern/repositories/chart_repository.dart';
import 'package:test_intern/repositories/comment_reponsitory.dart';
import 'package:test_intern/repositories/exception/isar_repositories.dart';
import 'package:test_intern/repositories/project_reponsitories.dart';
import 'package:test_intern/repositories/task_reponsitory.dart';
import 'package:test_intern/services/dio/dio_client.dart';
import 'package:test_intern/services/dio/logging_interceptor.dart';
import 'package:test_intern/services/share_preference._helper.dart';
import 'package:test_intern/services/social_auth/social_auth_service.dart';
import 'package:test_intern/services/socket_io/socket_io.dart';

import '../repositories/exception/notification_reponsitory.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final _isar = await IsarRepository().init();
  sl.registerSingleton(IsarProjectRepository(_isar));
  sl.registerSingleton<IsarTaskRepository>(IsarTaskRepository(_isar));

  // ExternalshowADS(context)
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferenceHelper>(SharedPreferenceHelper(sharedPreferences));

  sl.registerSingleton<LoggingInterceptor>(LoggingInterceptor());
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerLazySingleton<NotificationRepository>(() => NotificationRepository());
  sl.registerLazySingleton<SocialAuthService>(() => SocialAuthService());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository());
  sl.registerLazySingleton<CommentRepository>(() => CommentRepository());
  sl.registerLazySingleton<SocketIO>(() => SocketIO());

  sl.registerLazySingleton<ProjectReponsitory>(() => ProjectReponsitory());
  sl.registerLazySingleton<BoardRepository>(() => BoardRepository());
  sl.registerLazySingleton<TaskReponsitory>(() => TaskReponsitory());
  sl.registerLazySingleton<ChartRepository>(() => ChartRepository());
}
