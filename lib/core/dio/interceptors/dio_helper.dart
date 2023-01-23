// ignore_for_file: strict_raw_type

import 'package:agrostack/core/dio/dio_client.dart';
import 'package:agrostack/core/dio/dio_util.dart';
import 'package:agrostack/core/entity/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioHelper = Provider<DioHelper>((ref) {
  return DioHelper(ref);
});

class DioHelper {
  DioHelper(Ref read) : _ref = read;

  final Ref _ref;

  Dio get _dio => _ref.read(dioProvider);

  Future<Either<Response, Failure>> request<R>({
    required DioMethod reqType,
    required String endpoint,
    R? reqBody,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParam,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final method = describeEnum(reqType);

      final response = await _dio.request(
        endpoint,
        queryParameters: queryParam ?? <String, dynamic>{},
        data: reqBody,
        options: Options(
          method: method,
          contentType: Headers.jsonContentType,
          headers: headers,
        ),
      );

      return Left(response);
    } on DioError catch (e) {
      return Right(e.toFailure);
    } catch (e) {
      return Right(Failure.fromException(e));
    }
  }

  Object? parseInternalData<R>(dynamic data) {
    if (data is List) {
      return data.map((e) => e as R).toList();
    } else {
      return data as R;
    }
  }
}
