import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/models/board_model.dart';
import 'package:test_intern/repositories/base/api_response.dart';
import 'package:test_intern/repositories/exception/api_error_handler.dart';
import 'package:test_intern/resources/end-point.dart';
import 'package:test_intern/services/dio/dio_client.dart';

class BoardRepository {
  DioClient? dioClient = GetIt.I.get<DioClient>();

  Future<void> find(
    String id, {
    String? filter,
    required Function(List<BoardModel> event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String _uri = '${EndPoints.projectAdd}/$id/get-board-and-task';
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
      final List<dynamic> results = response.data as List<dynamic>;
      List<BoardModel> boards = results.map((data) => BoardModel.fromMap(data)).toList();

      onSuccess(boards);
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }
}
