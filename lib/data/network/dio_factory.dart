// lib/data/network/dio_factory.dart
import 'package:dio/dio.dart';

class DioFactory {
  static Dio create() {
    final dio = Dio();
    return dio;
  }
}
