import 'package:dio/dio.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

///[NetworkHandler] : handler to handling network requests made to fetch json.
abstract class NetworkHandler {
  static late Dio _dio;

  static void init(Dio dio) => _dio = dio;

  static Future<Response?> getJsonFromRequest(DynamicRequest dynamicRequest) {
    switch (dynamicRequest.requestType) {
      case RequestType.get:
        return getJsonFromGetRequest(dynamicRequest);
      case RequestType.post:
        return getJsonFromPostRequest(dynamicRequest);
      case RequestType.put:
        return getJsonFromPutRequest(dynamicRequest);
      case RequestType.delete:
        return getJsonFromDeleteRequest(dynamicRequest);
    }
  }

  static Future<Response?> getJsonFromGetRequest(DynamicRequest request) {
    return _dio.get(
      request.url,
      data: request.data,
      queryParameters: request.queryParameters,
      options: Options(
        contentType: request.contentType,
        headers: request.headers,
        extra: request.extra,
      ),
      cancelToken: request.cancelToken,
    );
  }

  static Future<Response?> getJsonFromPostRequest(DynamicRequest request) {
    return _dio.post(
      request.url,
      data: request.data,
      queryParameters: request.queryParameters,
      options: Options(
        contentType: request.contentType,
        headers: request.headers,
        extra: request.extra,
      ),
      cancelToken: request.cancelToken,
    );
  }

  static Future<Response?> getJsonFromPutRequest(DynamicRequest request) async {
    return _dio.put(
      request.url,
      data: request.data,
      queryParameters: request.queryParameters,
      options: Options(
        contentType: request.contentType,
        headers: request.headers,
        extra: request.extra,
      ),
      cancelToken: request.cancelToken,
    );
  }

  static Future<Response?> getJsonFromDeleteRequest(DynamicRequest request) async {
    return _dio.delete(
      request.url,
      data: request.data,
      queryParameters: request.queryParameters,
      options: Options(
        contentType: request.contentType,
        headers: request.headers,
        extra: request.extra,
        sendTimeout: request.sendTimeout,
        receiveTimeout: request.receiveTimeout
      ),
      cancelToken: request.cancelToken,
    );
  }
}
