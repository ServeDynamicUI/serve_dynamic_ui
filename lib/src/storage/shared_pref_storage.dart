import 'package:serve_dynamic_ui/src/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefValueType {
  string,
  int,
  double,
  bool,
  stringList,
}

class SharedPrefStorage extends Storage<String, dynamic, bool> {
  final SharedPreferences _prefs;

  SharedPrefStorage._privateConstructor(this._prefs);

  static SharedPrefStorage? _instance;

  static Future<SharedPrefStorage> get instance async {
    _instance ??= SharedPrefStorage._privateConstructor(
        await SharedPreferences.getInstance());
    return _instance!;
  }

  @override
  Future<bool> put({required String key, required dynamic value}) async {
    if (value is String) {
      return await _prefs.setString(key, value);
    } else if (value is int) {
      return await _prefs.setInt(key, value);
    } else if (value is double) {
      return await _prefs.setDouble(key, value);
    } else if (value is bool) {
      return await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      return await _prefs.setStringList(key, value);
    } else {
      throw ArgumentError('Unsupported value type');
    }
  }

  @override
  Future<dynamic> get({required String key}) async {
    return _prefs.get(key);
  }

  @override
  Map<String, dynamic> getAll() {
    final Set<String> keys = _prefs.getKeys();
    Map<String, dynamic> allPrefs = {};

    for (String key in keys) {
      final value = _prefs.get(key);
      allPrefs[key] = value;
    }
    return allPrefs;
  }

  @override
  Future<bool> putAll({required Map<String, dynamic> data}) async {
    for (var entry in data.entries) {
      String key = entry.key;
      dynamic value = entry.value;

      if (value is String) {
        await _prefs.setString(key, value);
      } else if (value is int) {
        await _prefs.setInt(key, value);
      } else if (value is double) {
        await _prefs.setDouble(key, value);
      } else if (value is bool) {
        await _prefs.setBool(key, value);
      } else if (value is List<String>) {
        await _prefs.setStringList(key, value);
      } else {
        throw ArgumentError('Unsupported value type for key $key');
      }
    }
    return true;
  }

  @override
  Future<bool> delete({required String key}) async {
    return await _prefs.remove(key);
  }

  @override
  Future<bool> deleteAll() async {
    return await _prefs.clear();
  }
}
