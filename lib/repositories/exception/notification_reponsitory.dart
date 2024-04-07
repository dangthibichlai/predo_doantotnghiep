import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/models/notification_model.dart';
import 'package:test_intern/repositories/base/api_response.dart';
import 'package:test_intern/repositories/exception/api_error_handler.dart';
import 'package:test_intern/resources/end-point.dart';
import 'package:test_intern/services/dio/dio_client.dart';

class NotificationRepository {
  DioClient? dioClient = GetIt.I.get<DioClient>();
  Future<void> paginate(
    String id,
    int page,
    int limit, {
    required Function(List<NotificationModel> event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    late Response response;
    String _uri = '${EndPoints.notifications}/paginate?userId=${id}&page=$page&limit=$limit';

    try {
      response = await dioClient!.get(_uri);
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final results = response.data['results'] as List<dynamic>;
      onSuccess(results.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>)).toList());
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }

  Future<void> getNoti(
    String id, {
    String? filter,
    required Function(List<NotificationModel> event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String _uri = '${EndPoints.notifications}?userId=$id';
    late Response response;

    if (!AppValidate.nullOrEmpty(filter)) {
      _uri += filter.toString();
    }
    try {
      response = await dioClient!.get(_uri);
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }

    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final results = response.data as List<dynamic>;
      onSuccess(results.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>)).toList());
      // try {
      //   final NotificationModels = results.map((e) => NotificationModel.fromMap(e as Map<String, dynamic>)).toList();
      //   onSuccess(NotificationModels);
      // } catch (e) {
      //   onError(ApiResponse.withError("Error parsing data").error);
      // }
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }

  Future<void> delete({
    String? filter,
    required Function(String event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    late Response response;
    String uri = '${EndPoints.notifications}';
    if (!AppValidate.nullOrEmpty(filter)) {
      uri += filter.toString();
    }
    try {
      response = await dioClient!.delete(uri);
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      onSuccess('Delete success');
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }
}
