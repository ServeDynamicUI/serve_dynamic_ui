import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:serve_dynamic_ui/src/storage/storage.dart';
import 'package:flutter/foundation.dart';

class SecureStorage extends Storage<String, dynamic, dynamic> {
  final FlutterSecureStorage _secureStorage;

  SecureStorage._privateConstructor(this._secureStorage);

  static SecureStorage get instance {
    return SecureStorage._privateConstructor(const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true)));
  }

  @override
  Future<dynamic> put({required String key, required String value}) async {
    try {
      await _secureStorage.write(key: key, value: value);
      return true;
    } catch (e) {
      debugPrint('Error saving value for key $key: $e');
      return false;
    }
  }

  // Method to retrieve a value securely by key
  @override
  Future<dynamic> get({required String key}) async {
    try {
      return await _secureStorage.read(key: key);
    } catch (e) {
      debugPrint('Error reading value for key $key: $e');
      return null;
    }
  }

  // Method to delete a value securely by key
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

  // Method to delete all values securely
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

  // Method to retrieve all key-value pairs securely
  @override
  Future<Map<String, String>> getAll() async {
    try {
      return await _secureStorage.readAll();
    } catch (e) {
      debugPrint('Error reading all values: $e');
      return {};
    }
  }

  // Method to store multiple key-value pairs securely
  @override
  Future<bool> putAll({required Map<String, String> data}) async {
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
