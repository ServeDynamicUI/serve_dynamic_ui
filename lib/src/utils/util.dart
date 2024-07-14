import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:serve_dynamic_ui/src/constants/index.dart';
import 'package:serve_dynamic_ui/src/storage/index.dart';
import 'package:serve_dynamic_ui/src/utils/index.dart';

class Util {
  static bool isValidList<T>(dynamic list) {
    if (list != null && list is List<T> && list.isNotEmpty) {
      return true;
    }
    return false;
  }

  static bool isValid(dynamic object) {
    return object != null;
  }

  static bool isValidBool(dynamic object) {
    return object is bool;
  }

  static Future<bool> setPageCacheTime(String pageCacheKeepTime) async {
    try {
      if (StringUtil.isNotEmptyNorNull(pageCacheKeepTime)) {
        final SharedPrefStorage prefs = await SharedPrefStorage.instance;
        return await prefs.put(
            key: Strings.pageCacheKeepTime,
            value: int.parse(pageCacheKeepTime));
      }
      return false;
    } catch (e) {
      debugPrint('Some error occurred: $e');
    }
    return false;
  }

  static Future<int?> getPageCacheTime() async {
    try {
      final SharedPrefStorage prefs = await SharedPrefStorage.instance;
      return await prefs.get(key: Strings.pageCacheKeepTime);
    } catch (e) {
      debugPrint('Some error occurred: $e');
    }
    return null;
  }

  static String generateRandomString({int length = 15}) {
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));
  }
}
