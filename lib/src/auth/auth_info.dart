
abstract class AuthInfo {
  AuthInfo();

  Map<String, dynamic> toJson();

  factory AuthInfo.fromJson(Map<String, dynamic>? json) {
    throw UnimplementedError('fromJson() must be implemented in subclasses');
  }
}