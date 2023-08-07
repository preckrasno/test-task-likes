import 'package:dio/dio.dart';

class DioFactory {
  const DioFactory(this._baseUrl);

  final String _baseUrl;

  Dio create() => Dio(_createBaseOptions());

  BaseOptions _createBaseOptions() => BaseOptions(
        // Request base url
        baseUrl: _baseUrl,

        // Timeout in milliseconds for receiving data
        receiveTimeout: const Duration(milliseconds: 15000),

        // Timeout in milliseconds for sending data
        sendTimeout: const Duration(milliseconds: 15000),

        // Timeout in milliseconds for opening url
        connectTimeout: const Duration(milliseconds: 5000),
      );
}
