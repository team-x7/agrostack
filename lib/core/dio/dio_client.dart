import 'package:agrostack/core/dio/interceptors/error_interceptors.dart';
import 'package:agrostack/core/dio/interceptors/request_interceptors.dart';
import 'package:agrostack/core/dio/interceptors/response_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const String authToken = 'authType';
final baseUrlProvider =
    Provider<String>((ref) => 'http://165.232.188.88:7000/api/v1');

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  final baseUrl = ref.watch(baseUrlProvider);
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = 30000; //30 sec
  dio.options.receiveTimeout = 30000;
  dio.options.contentType = Headers.jsonContentType;
  dio.options.headers = <String, dynamic>{
    'Accept': Headers.jsonContentType,
  };

  dio.options.validateStatus =
      (status) => status != null && status >= 200 && status < 400;

  dio.interceptors.addAll([
    if (kDebugMode) LogInterceptor(),
    RequestInterceptor(ref),
    ResponseInterceptor(dio),
    ErrorInterceptor(dio),
  ]);
  return dio;
});
