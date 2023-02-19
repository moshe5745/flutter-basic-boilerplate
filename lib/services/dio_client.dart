import 'package:flutter/foundation.dart';
import 'package:app_name/services/index.dart';

class DioClient {
  late InterceptorsWrapper tokenInterceptor;
  late Dio instance;

  void init() {
    instance = Dio()
      ..options.baseUrl = const String.fromEnvironment('BASE_URL',
          defaultValue: 'http://127.0.0.1:8000')
      ..options.contentType = Headers.jsonContentType
      ..options.connectTimeout = const Duration(seconds: 10)
      ..options.receiveTimeout = const Duration(seconds: 10)
      ..options.sendTimeout = const Duration(seconds: 10);

    if (kDebugMode) instance.interceptors.add(PrettyDioLogger(requestBody: true));
  }

  void setAccessToken(String token) {
    instance.interceptors.remove(tokenInterceptor);

    tokenInterceptor = InterceptorsWrapper(onRequest: (options, handler) {
      options.headers['Authorization'] = 'Bearer $token';
      return handler.next(options);
    });

    instance.interceptors.add(tokenInterceptor);
  }
}
