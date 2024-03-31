import 'package:dio/dio.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/core/hepler/app_number.dart';
import 'package:test_intern/models/comment_model.dart';
import 'package:test_intern/repositories/base/api_response.dart';
import 'package:test_intern/repositories/exception/api_error_handler.dart';
import 'package:test_intern/resources/di_container.dart';
import 'package:test_intern/resources/end-point.dart';
import 'package:test_intern/services/dio/dio_client.dart';

class CommentRepository {
  final _dio = sl.get<DioClient>();

  Future<void> getComment(
    String idTask, {
    required Function(List<CommentModel> data) onSuccess,
    required Function(dynamic error) onError,
    Function(int count)? onTotalCount,
  }) async {
    late Response response;

    String _uri = '${EndPoints.comments}?taskId=$idTask'; //&deletedByUsers!=${sl<SharedPreferenceHelper>().getIdUser}

    try {
      response = await _dio.get(_uri);
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final results = response.data as List<dynamic>;
      onSuccess(results.map((e) => CommentModel.fromMap(e)).toList());
    }
  }

  Future<void> delete(
    String id, {
    required Function onSuccess,
    required Function(dynamic error) onError,
  }) async {
    late Response response;
    try {
      response = await _dio.delete("${EndPoints.comments}/$id");
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      onSuccess(
        response.data,
      );
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }

  Future<void> paginateMessage(
    int page,
    int limit,
    String filter, {
    required Function(List<CommentModel> data) onSuccess,
    required Function(dynamic error) onError,
    Function(int count)? onTotalCount,
  }) async {
    late Response response;

    String _uri = '${EndPoints.comments}/paginate/me?page=$page'.toString();

    if (!AppValidate.nullOrEmpty(filter)) {
      _uri = '${EndPoints.comments}/paginate?page=$page&limit=$limit$filter';
    }

    try {
      response = await _dio.get(_uri);
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final results = response.data['results'] as List<dynamic>;
      onSuccess(results.map((e) => CommentModel.fromMap(e as Map<String, dynamic>)).toList());

      if (onTotalCount != null) {
        onTotalCount(AppNumber.parseInt(response.data['totalResults'].toString()));
      }
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }

  Future<void> sendMessage({
    required CommentModel data,
    required Function(CommentModel data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    late Response response;

    try {
      response = await _dio.post(EndPoints.comments, data: data.toMap());
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final results = response.data as dynamic;
      onSuccess(CommentModel.fromMap(results as Map<String, dynamic>));
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }
}
