import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/models/chart_model.dart';
import 'package:test_intern/repositories/base/api_response.dart';
import 'package:test_intern/repositories/exception/api_error_handler.dart';
import 'package:test_intern/resources/end-point.dart';
import 'package:test_intern/services/dio/dio_client.dart';

class ChartRepository {
  DioClient? dioClient = GetIt.I.get<DioClient>();
  Future<void> getChart(
    String id,
    String filter, {
    required Function(List<ChartDataModel> event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    late Response response;
    String _uri = '${EndPoints.projects}/$id/get-chart?$filter';

    try {
      response = await dioClient!.get(_uri);
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) &&
        response.statusCode! >= 200 &&
        response.statusCode! <= 300) {
      final results = response.data as List<dynamic>;
      onSuccess(results
          .map((e) => ChartDataModel.fromMap(e as Map<String, dynamic>))
          .toList());
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }
}
