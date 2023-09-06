import 'package:dio/dio.dart';

import 'api_url.dart';

class DioHelper {
  static Dio? dio;
  static String token = "";
  static Map<String, dynamic> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    if (token.isNotEmpty) "Authorization": token,
  };

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json,
      headers: headers,
    ));
  }

  ///Get Data
  Future<Response> getData({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final response = await dio!.get(path, data: body);

    return response;
  }

  /// Post Data
  Future<Response> postData({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    final response =
        await dio!.post(path, data: body, queryParameters: queryParams);

    return response;
  }

  /// Put
  /// Patch
}
