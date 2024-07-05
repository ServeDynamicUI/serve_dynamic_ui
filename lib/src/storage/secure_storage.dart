import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:serve_dynamic_ui/src/storage/storage.dart';
import 'package:flutter/foundation.dart';

class SecureStorage extends Storage<String, String?, dynamic> {
  final FlutterSecureStorage _secureStorage;

  SecureStorage._privateConstructor(this._secureStorage);

  static SecureStorage? _instance;

  static SecureStorage get instance {
    _instance ??= SecureStorage._privateConstructor(const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true)));
    return _instance!;
  }

  @override
  Future<dynamic> put({required String key, required String? value}) async {
    try {
      await _secureStorage.write(key: key, value: value);
      return true;
    } catch (e) {
      debugPrint('Error saving value for key $key: $e');
      return false;
    }
  }

  @override
  Future<String?> get({required String key}) async {
    try {
      return await _secureStorage.read(key: key);
    } catch (e) {
      debugPrint('Error reading value for key $key: $e');
      return null;
    }
  }

  @override
  Future<bool> delete({required String key}) async {
    try {
      await _secureStorage.delete(key: key);
      return true;
    } catch (e) {
      debugPrint('Error deleting value for key $key: $e');
      return false;
    }
  }

  @override
  Future<bool> deleteAll() async {
    try {
      await _secureStorage.deleteAll();
      return true;
    } catch (e) {
      debugPrint('Error deleting all values: $e');
      return false;
    }
  }

  @override
  getAll() async {
    try {
      return await _secureStorage.readAll();
    } catch (e) {
      debugPrint('Error reading all values: $e');
      return {};
    }
  }

  @override
  Future<bool> putAll({required Map<String, String?> data}) async {
    try {
      for (var entry in data.entries) {
        await _secureStorage.write(key: entry.key, value: entry.value);
      }
      return true;
    } catch (e) {
      debugPrint('Error saving multiple values: $e');
      return false;
    }
  }
}
