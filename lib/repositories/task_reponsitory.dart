
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/models/task_model.dart';
import 'package:test_intern/repositories/base/api_response.dart';
import 'package:test_intern/repositories/exception/api_error_handler.dart';
import 'package:test_intern/resources/end-point.dart';
import 'package:test_intern/services/dio/dio_client.dart';

class TaskReponsitory {
  DioClient? dioClient = GetIt.I.get<DioClient>();
  Future<void> paginate(
    int page,
    int limit, {
    required String option,
    required Function(List<TaskModel> event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    late Response response;
    String _uri = '${EndPoints.tasks}/aggregate-issues?options=$option&page=$page&limit=$limit';

    try {
      response = await dioClient!.get(_uri);
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final results = response.data['results'] as List<dynamic>;
      onSuccess(results.map((e) => TaskModel.fromJson(e as Map<String, dynamic>)).toList());
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }

  Future<void> update({
    required String id,
    required TaskModel data,
    required Function(TaskModel event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    late Response response;
    try {
      response = await dioClient!.put('${EndPoints.tasks}/$id', data: data.toJson());
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final results = response.data as dynamic;
      onSuccess(TaskModel.fromJson(results as Map<String, dynamic>));
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }

  Future<void> findTaskBoard(
    String id, {
    String? filter,
    required Function(TaskModel event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String _uri = '${EndPoints.tasks}/$id?populate=boardId.projectId.members.userId';
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
      final results = response.data as Map<String, dynamic>;

      onSuccess(TaskModel.fromJson(results));
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }

  Future<void> find(
    String id, {
    String? filter,
    required Function(TaskModel event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String _uri = '${EndPoints.tasks}/$id';
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
      final results = response.data as Map<String, dynamic>;
      onSuccess(TaskModel.fromJson(results));
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }

  Future<void> findBoard(
    String id, {
    String? filter,
    required Function(String projectId) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String _uri = '${EndPoints.tasks}/$id?populate=boardId';

    if (!AppValidate.nullOrEmpty(filter)) {
      _uri += filter.toString();
    }

    try {
      final response = await dioClient!.get(_uri);

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! <= 300) {
        final data = response.data;

        final boardIdData = data['boardId'];
        final projectId = boardIdData['projectId'];

        onSuccess(projectId);
      } else {
        onError(ApiErrorHandler.getMessage(response.data));
      }
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

  Future<void> findTaskAssgnee(
    String assgneee, {
    String? filter,
    required Function(List<TaskModel> event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String _uri = '${EndPoints.tasks}?assignee=$assgneee';
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
      onSuccess(results.map((e) => TaskModel.fromJson(e as Map<String, dynamic>)).toList());
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }

  Future<void> getSubtask(
    String id, {
    String? filter,
    required Function(List<TaskModel> event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String _uri = '${EndPoints.tasks}/$id';
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
      onSuccess(results.map((e) => TaskModel.fromJson(e as Map<String, dynamic>)).toList());
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }

  Future<void> add({
    required TaskModel data,
    required Function(TaskModel event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    late Response response;

    try {
      response = await dioClient!.post(EndPoints.tasks, data: data.toJson());
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)));
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final results = response.data as dynamic;
      onSuccess(TaskModel.fromJson(results as Map<String, dynamic>));
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }
}
