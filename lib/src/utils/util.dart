import 'package:flutter/foundation.dart';
import 'package:serve_dynamic_ui/src/constants/index.dart';
import 'package:serve_dynamic_ui/src/db/providers/ServeDynamicUIDatabseProvider.dart';
import 'package:serve_dynamic_ui/src/utils/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db/database/serve_dynamic_ui_database.dart';

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
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        return await prefs.setInt(
            Strings.pageCacheKeepTime, int.parse(pageCacheKeepTime));
      }
      return false;
    } catch (e) {
      debugPrint('Some error occurred: $e');
    }
    return false;
  }

  static Future<int?> getPageCacheTime() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getInt(Strings.pageCacheKeepTime);
    } catch (e) {
      debugPrint('Some error occurred: $e');
    }
    return null;
  }
}
