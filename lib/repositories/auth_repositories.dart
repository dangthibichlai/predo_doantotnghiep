import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/models/auth_model.dart';
import 'package:test_intern/repositories/base/api_response.dart';
import 'package:test_intern/repositories/exception/api_error_handler.dart';
import 'package:test_intern/resources/di_container.dart';
import 'package:test_intern/resources/end-point.dart';
import 'package:test_intern/services/dio/dio_client.dart';

class AuthRepository {
  final _dio = sl.get<DioClient>();

  AuthRepository();

  ///
  /// Sign in.
  ///
  Future<void> signIn({
    required AuthModel data,
    required Function(AuthModel data) onSuccess,
    required Function(dynamic error) onError,
    required bool isSignInWithLocal,
  }) async {
    Response<dynamic>? response;
    String _uri = EndPoints.signInSocial;

    if (isSignInWithLocal) {
      // _uri = "http://172.25.88.235:3000/auth/sign-in";
      _uri = EndPoints.signInWithEmail;
    }

    try {
      response = await _dio.post(_uri, data: data.toJson());
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final _results = response.data as dynamic;

      log('Auth login result: $_results');

      // Call back data.
      final user = AuthModel.fromMap(_results['user'] as Map<String, dynamic>);

      user.accessToken = _results['accessToken'].toString();
      user.refreshToken = _results['refreshToken'].toString();
      user.isNewAccount = _results['isNewAccount'] == true;

      onSuccess(user);
    }
  }

  ///
  /// Sign up.
  ///
  Future<void> signUp({
    required AuthModel data,
    required Function(AuthModel data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    Response<dynamic>? response;
    const String _uri = EndPoints.signUpLocal;

    try {
      response = await _dio.post(_uri, data: data.toJson());
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final _results = response.data as dynamic;

      log('Auth sign up result: $_results');

      // Call back data.
      final user = AuthModel.fromMap(_results as Map<String, dynamic>);
      user.accessToken = _results['accessToken'].toString();
      user.refreshToken = _results['refreshToken'].toString();
      onSuccess(user);
    }
  }

  ///
  /// Send OTP.
  ///
  Future<void> sendOTP({
    required AuthModel data,
    required Function(String data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    Response<dynamic>? response;
    const String _uri = EndPoints.sendOTP;

    try {
      response = await _dio.post(_uri, data: data.toJson());
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final _results = response.data as Map<String, dynamic>;

      log('OTP sended $_results');

      onSuccess(_results.toString());
    }
  }

  Future<void> verify_sendOTP({
    required AuthModel data,
    required Function(String data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    Response<dynamic>? response;
    const String _uri = EndPoints.sendOTP;

    try {
      response = await _dio.post(_uri, data: data.toJson());
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final _results = response.data as Map<String, dynamic>;

      log('OTP sended $_results');

      onSuccess(_results.toString());
    }
  }

  ///
  /// Change Password.
  ///
  Future<void> changePassword({
    required AuthModel data,
    required Function(String data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    Response<dynamic>? response;
    const String _uri = EndPoints.changePassword;

    try {
      response = await _dio.put(_uri, data: data.toJson());
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }
    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final _results = response.data as String;

      log('Change password $_results');

      onSuccess(_results);
    }
  }

  ///
  /// Update
  ///
  // Future<void> update({
  //   required String id,
  //   required AuthModel data,
  //   required Function(UserModel data) onSuccess,
  //   required Function(dynamic error) onError,
  // }) async {
  //   late Response response;

  //   try {
  //     response = await _dio.put('${EndPoints.users}/$id', data: data.toMap());
  //   } catch (e) {
  //     onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
  //     return;
  //   }
  //   if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
  //     final results = response.data as dynamic;
  //     onSuccess(UserModel.fromMap(results as Map<String, dynamic>));
  //   } else {
  //     onError(ApiErrorHandler.getMessage(response.data));
  //   }
  // }

  ///
  /// Find bang-bang-cap by id
  ///
  Future<void> find(
    String id, {
    String? filter,
    required Function(AuthModel event) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String _uri = '${EndPoints.users}/$id';
    late Response response;

    if (!AppValidate.nullOrEmpty(filter)) {
      _uri += filter.toString();
    }

    try {
      response = await _dio.get(_uri);
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
      return;
    }

    if (!AppValidate.nullOrEmpty(response.statusCode) && response.statusCode! >= 200 && response.statusCode! <= 300) {
      final results = response.data as dynamic;
      onSuccess(AuthModel.fromMap(results as Map<String, dynamic>));
    } else {
      onError(ApiErrorHandler.getMessage(response.data));
    }
  }
}
