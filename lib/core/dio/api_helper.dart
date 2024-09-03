// ignore_for_file: unused_element, deprecated_member_use

import 'dart:async';
import 'dart:collection';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:pyramakerz_atendnace/core/app-preferances/app_preferances.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_constants.dart';
import '../error/error_message_model.dart';
import '../error/server_exception.dart';
import 'my_dio.dart';

const somethingWentWrong = 'Something went wrong';

@injectable.Order(-4)
@injectable.lazySingleton
class ApiHelper {
  final Dio? dio = DioClient().createDioClient();
  ApiHelper() {
    dio!.options.baseUrl = ApiConstants.baseUrl;
    var interceptor = InterceptorsWrapper(
      onRequest: (req, handler) async {
        final AppPreferences localDataSource = AppPreferences(
            sharedPreferences: await SharedPreferences.getInstance());

        final authToken = localDataSource.getToken();
        // final authToken = token;
//
        // final locale = LocaleKeys.app_locale.tr();
        // req.headers['Authorization'] = 'Bearer $token';
        if (authToken != null) {
          req.headers["Authorization"] = "Bearer $authToken";
        }
        handler.next(req);
      },
      onResponse: (res, handler) {
        handler.next(res);
      },
    );
    dio!.interceptors.add(interceptor);
  }

  Future<Either<ServerException, Response>> post(
          {required String path,
          Map<String, dynamic>? body,
          dynamic headers,
          String? contentType}) async =>
      await safeApiHelperRequest(
        () async {
          final Response res = await dio!.post(
            path,
            data: body,
            options: Options(
              headers: headers,
              contentType: contentType,
            ),
          );
          return res;
        },
      );
  Future<Either<ServerException, Response>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async =>
      await safeApiHelperRequest(
        () async {
          final Response res = await dio!.delete(
            path,
            options: Options(headers: headers),
            queryParameters: queryParameters,
          );
          return res;
        },
      );
  Future<Either<ServerException, Response>> postForm<T>(
          String path, FormData body,
          {dynamic headers}) async =>
      await (safeApiHelperRequest(
        () => dio!.post(
          path,
          data: body,
          options: Options(
            headers: {'content_type': 'multipart/form-data'},
          ),
        ),
      ));

  Future<Either<ServerException, Response>> get<T>({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async =>
      safeApiHelperRequest(
        () => dio!.get(
          path,
          options: Options(headers: headers),
          queryParameters: queryParameters,
        ),
      );

  Future<Either<ServerException, Response>> put(
    String path,
    HashMap<String, dynamic> body, {
    dynamic headers,
  }) async =>
      await safeApiHelperRequest(
        () async {
          final Response res = await dio!.put(
            path,
            data: FormData.fromMap(body),
            options: Options(headers: headers),
          );
          return res;
        },
      );

  Future<Either<ServerException, Response>> safeApiHelperRequest(
    Future<dynamic> Function() function,
  ) async {
    try {
      // Attempt to call the function and get the response
      final Response response = await function.call();

      // Check for success status codes
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return Right(response);
      } else {
        // Handle specific error responses with custom logic
        if (response.statusCode == 401 && response.data['detail'] != null) {
          return Left(ServerException(
            errorMessageModel: ErrorMessageModel(
              statusCode: response.statusCode,
              message: response.data['message'], // Use backend-provided message
              success: false,
            ),
          ));
        }
      }

      // General failure case
      return Left(ServerException(
        errorMessageModel: ErrorMessageModel(
          statusCode: response.statusCode,
          message: response.data['message'] ??
              'Something went wrong', // Try to use backend message if available
        ),
      ));
    } on DioException catch (e) {
      // Check for network-related Dio exceptions
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectionError) {
        // This indicates a connectivity issue, such as no network
        return const Left(ServerException(
          errorMessageModel: ErrorMessageModel(
            statusCode: 500,
            message:
                'No network connection. Please check your internet and try again.',
          ),
        ));
      }

      // Handle cases where the response is null, indicating no response from the server
      if (e.response == null) {
        // If no response from the server
        return const Left(ServerException(
          errorMessageModel: ErrorMessageModel(
            statusCode: 500,
            message: 'No response from the server. Please try again later.',
          ),
        ));
      }

      // If the response is available, but the status code indicates an error
      if (e.response != null) {
        final response = e.response!;
        final errorMessage = response.data['message'] ??
            'Unexpected error occurred'; // Extract backend message if available

        return Left(ServerException(
          errorMessageModel: ErrorMessageModel(
            statusCode: response.statusCode,
            message: errorMessage, // Use the backend message or a default one
          ),
        ));
      }

      // Handle general Dio error
      return Left(ServerException(
        errorMessageModel: ErrorMessageModel(
          statusCode: e.response?.statusCode ?? 500,
          message:
              e.message ?? e.type.name, // Use the Dio error message or type
        ),
      ));
    } catch (e) {
      // Handle any other types of errors
      return const Left(ServerException(
        errorMessageModel: ErrorMessageModel(
          statusCode: 500,
          message: 'An unexpected error occurred.',
        ),
      ));
    }
  }

  String _handleError(DioException error) {
    String errorDescription = "";

    DioError dioError = error;
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.badResponse:
        errorDescription =
            "Received invalid status code: ${dioError.response!.statusCode}";
        break;
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.unknown:
        errorDescription =
            "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.badCertificate:
        errorDescription = "Bad certfiicate";
        break;
      case DioErrorType.connectionError:
        errorDescription = "Something went wrong";
        break;
    }

    return errorDescription;
  }
}
