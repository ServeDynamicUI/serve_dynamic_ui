import 'dart:core';

import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:dio/dio.dart';

///[DynamicRequest] : an object that helps in network calls to configure properties.
class DynamicRequest {
  final String url;
  final RequestType requestType;
  Map<String, dynamic>? queryParameters;
  Map<String, dynamic>? headers;
  String? contentType;
  Map<String, dynamic>? data;
  CancelToken? cancelToken;
  Map<String, dynamic>? extra;
  Duration? sendTimeout;
  Duration? receiveTimeout;
  bool get isPageCacheEnabled {
    try {
      return Uri.parse(url)
              .queryParameters[Strings.isPageCacheEnabled]
              ?.parseBool() ??
          false;
    } on Exception {
      return false;
    }
  }

  DynamicRequest({
    required this.url,
    required this.requestType,
    this.queryParameters,
    this.contentType,
    this.data,
    this.headers,
    this.cancelToken,
    this.extra,
    this.sendTimeout,
    this.receiveTimeout,
  });
}

///extension to convert to RequestType from string.
extension MethodExtension on RequestType {
  ///fromString to convert from string to RequestType.
  RequestType? fromString(String value) {
    switch (value) {
      case Strings.get:
        return RequestType.get;
      case Strings.post:
        return RequestType.post;
      case Strings.delete:
        return RequestType.delete;
      case Strings.put:
        return RequestType.post;
      default:
        return null;
    }
  }
}

extension MethodStringExtension on String {
  RequestType requestTypeFromString() {
    switch (this) {
      case Strings.get:
        return RequestType.get;
      case Strings.post:
        return RequestType.post;
      case Strings.delete:
        return RequestType.delete;
      case Strings.put:
        return RequestType.post;
      default:
        return RequestType.get;
    }
  }
}
