import 'dart:developer';

import 'package:agrostack/authentication/infrastructure/authenticator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestInterceptor extends Interceptor {
  RequestInterceptor(this._ref);

  final Ref _ref;

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final credential = await _ref.read(authProvider).currentUser?.getIdToken();
    log(credential.toString());
    final modifiedOptions = options
      ..headers.addAll({'authorization': 'Bearer $credential'});

    log(modifiedOptions.headers.toString());
    handler.next(modifiedOptions);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('----- Status Code: $response');
    super.onResponse(response, handler);
  }
}
