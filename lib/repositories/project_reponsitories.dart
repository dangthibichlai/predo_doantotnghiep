import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/models/auth_model.dart';
import 'package:test_intern/models/project_model.dart';
import 'package:test_intern/repositories/base/api_response.dart';
import 'package:test_intern/repositories/exception/api_error_handler.dart';
import 'package:test_intern/resources/end-point.dart';
import 'package:test_intern/services/dio/dio_client.dart';

class ProjectReponsitory {
  DioClient? dioClient = GetIt.I.get<DioClient>();
  Future<void> find(
    String id, {
    String? filter,
    required Function(List<ProjectModel> event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String _uri = '${EndPoints.project}/$id';
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
      onSuccess(results.map((e) => ProjectModel.fromMap(e as Map<String, dynamic>)).toList());
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }

  Future<void> findProjectID(
    String id, {
    String? filter,
    required Function(List<AuthModel> event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String _uri = '${EndPoints.project}/$id?populate=members.userId';
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
      final results = response.data[0]['members'] as List<dynamic>;

      try {
        final authModels = results.map((e) => AuthModel.fromMap(e['userId'] as Map<String, dynamic>)).toList();
        onSuccess(authModels);
      } catch (e) {
        onError(ApiResponse.withError("Error parsing data").error);
      }
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }

  Future<void> add({
    required ProjectModel data,
    required Function(ProjectModel event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    late Response response;

    try {
      response = await dioClient!.post(EndPoints.projectAdd, data: data.toMap());
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)));
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final results = response.data as dynamic;
      onSuccess(ProjectModel.fromMap(results as Map<String, dynamic>));
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }
}
