import 'package:flutter/foundation.dart';
import 'package:serve_dynamic_ui/src/db/database/serve_dynamic_ui_database.dart';
import 'package:serve_dynamic_ui/src/utils/index.dart';

import '../db/providers/ServeDynamicUIDatabseProvider.dart';

class DbUtil {
  static Future<bool> deleteCachedPagesOlderThanSetCacheTime() async {
    try {
      int? cacheTime = await Util.getPageCacheTime();
      if (Util.isValid(cacheTime)) {
        int lastTime = DateTime.now()
            .subtract(Duration(seconds: cacheTime!))
            .millisecondsSinceEpoch;
        ServeDynamicUIDatabase serveDynamicUIDatabase =
            await ServeDynamicUIDatabaseProvider.instance.database;
        int? deletedPages = await serveDynamicUIDatabase.cachedPageDao
            .deleteCachedPagesOlderThanTime(lastTime);
        debugPrint('Deleted pages count: $deletedPages');
        return Util.isValid(deletedPages) && deletedPages! > 0;
      }
    } catch (e) {
      debugPrint('Some error occurred: $e');
    }
    return false;
  }

  static Future<bool> deleteCachedPageIfOlderThanSetCacheTime(
      String pageKey) async {
    try {
      int? cacheTime = await Util.getPageCacheTime();
      if (Util.isValid(cacheTime)) {
        int lastTime = DateTime.now()
            .subtract(Duration(seconds: cacheTime!))
            .millisecondsSinceEpoch;
        ServeDynamicUIDatabase serveDynamicUIDatabase =
            await ServeDynamicUIDatabaseProvider.instance.database;
        int? deletedPage = await serveDynamicUIDatabase.cachedPageDao
            .deleteCachedPagesOlderThanTime(lastTime);
        debugPrint('deleted page $pageKey? : $deletedPage');
        return Util.isValid(deletedPage) && deletedPage! > 0;
      }
    } catch (e) {
      debugPrint('Some error occurred: $e');
    }
    return false;
  }
}
