import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/models/project_model.dart';
import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/repositories/base/api_response.dart';
import 'package:test_intern/repositories/exception/api_error_handler.dart';
import 'package:test_intern/resources/end-point.dart';
import 'package:test_intern/services/dio/dio_client.dart';

class TaskReponsitory {
  DioClient? dioClient = GetIt.I.get<DioClient>();
  Future<void> add({
    required TaskModel data,
    required Function(TaskModel event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    late Response response;

    try {
      response = await dioClient!.post(EndPoints.tasks, data: data.toMap());
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)));
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final results = response.data as dynamic;
      onSuccess(TaskModel.fromMap(results as Map<String, dynamic>));
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }
}
