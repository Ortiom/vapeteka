import 'package:dio/dio.dart';
import 'package:vapeteka/constants/url.dart';

import 'response_result.dart';

const get = 'get';
const post = 'post';
const put = 'put';
const delete = 'delete';

class RestService {
  Dio? _dio;

  RestService() {
    _dio = Dio(_options);
  }

  final BaseOptions _options = BaseOptions(
    baseUrl: baseApi,
    connectTimeout: 60000,
    receiveTimeout: 60000,
    sendTimeout: 60000,
    headers: {'Accept': 'application/json'},
  );

  Future<Result<dynamic>> request(String url,
      {String method = get,
      data,
      Map<String, dynamic>? queryParameters,
      String token = ''}) async {
    try {
      if (token != '') _options.headers["Authorization"] = token;
      switch (method) {
        case post:
          Response response = await _dio!.post(url, data: data);
          return Result<dynamic>(data: response.data, status: Status.success);
        case put:
          Response response = await _dio!.put(url, data: data);
          return Result<dynamic>(data: response.data, status: Status.success);
        case delete:
          Response response =
              await _dio!.delete(url, queryParameters: queryParameters);
          return Result<dynamic>(data: response.data, status: Status.success);
        default:
          Response response =
              await _dio!.get(url, queryParameters: queryParameters);
          return Result<dynamic>(data: response.data, status: Status.success);
      }
      // ignore: unused_catch_stack
    } catch (e) {
      return Result(
          errorText: handleError(e), status: Status.error, statusCode: 500);
    }
  }
}
