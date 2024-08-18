// ignore_for_file: unused_element, deprecated_member_use

import 'dart:async';
import 'dart:collection';
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
const token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3BlcnNvbmFsdHJhaW5lcmttbS5jb20vYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MTIwNjg1MDIsIm5iZiI6MTcxMjA2ODUwMiwianRpIjoiQmNwODhZa2xYVjVHWWlqayIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.4JxB4JmzhaLUBXhf5rE4t4EyFQ3UY2ibgJflBWAtlY8';

@injectable.Order(-3)
@injectable.injectable
class ApiHelper {
  final Dio? dio = DioClient().createDioClient();
  ApiHelper({String? customBearerToken}) {
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
          req.headers["Authorization"] = customBearerToken == null
              ? "Bearer $authToken"
              : "Bearer $customBearerToken";
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
      // stores what is returned from this function
      final Response response = await (function.call());
      // he never reaches this line so we need to handle before call
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return Right(response);
      } else {
        if (response.statusCode == 401 && response.data['detail'] != null) {
          return Left(ServerException(
              errorMessageModel: ErrorMessageModel(
                  statusCode: response.statusCode,
                  message: response.data['message'],
                  success: false)));
        }
      }

      return Left(ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: response.statusCode, message: somethingWentWrong)));
    } on DioException catch (e) {
      if (e.response == null || e.response?.statusCode == 404) {
        return Left(ServerException(
            errorMessageModel: ErrorMessageModel(
                statusCode: e.response?.statusCode, message: e.message)));
      }
      if (e.response != null && e.response!.data != null) {
        return Left(ServerException(
            errorMessageModel: ErrorMessageModel(
                statusCode: e.response?.statusCode,
                message: e.response!.data!['message'])));
      }

      // if (e.response?.statusCode != 500 && e.response?.data['detail'] != null) {
      //   return Left(UnAuthorized(e.response?.data['detail']));
      // }
      // if (e.response?.statusCode == 401 && e.response?.data['detail'] != null) {
      //   return Left(UnAuthorized(e.response?.data['detail']));
      // }
      // if (e.response?.statusCode != 500 && e.response != null) {
      //   return Left(AppFailure(e.response!));
      // }
      return Left(ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: e.response?.statusCode, message: e.type.name)));
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
