import 'package:dio/dio.dart';

import '../error/exception.dart';
import 'end_points.dart';

abstract class ApiHelper {
  Future<Response> post({
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<Response> get({
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
}

class DioHelper implements ApiHelper {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseApiUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
    ),
  );

  @override
  Future<Response> get({
    required String endPoint,
    data,
    query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'Authorization': token,
    };
    final response = await dio.get(
      endPoint,
      queryParameters: query,
      cancelToken: cancelToken,
    ).onError((error, stackTrace) {


      throw Failure(
      code: 100,
      error: "Dio error",
      message: "Try again later.",
    );
    });

    return response;
  }

  @override
  Future<Response> post({
    required String endPoint,
    data,
    query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'Authorization': token,
    };

    final response = await dio.post(
      endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
    ).onError((error, stackTrace) => throw Failure(
      code: 100,
      error: "Dio error",
      message: "Try again later.",
    ));

    return response;
  }
}
