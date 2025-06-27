import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/foundation.dart'; 

@LazySingleton()
class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://dummyjson.com"))
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode, // disables in release mode
      ),
    );

  Future<Response> getUsers() async {
    return await _dio.get("/comments");
  }
}
