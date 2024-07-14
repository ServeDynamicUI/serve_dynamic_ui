import 'package:flutter/foundation.dart';
import 'package:serve_dynamic_ui/src/db/daos/cached_page_dao.dart';
import 'package:serve_dynamic_ui/src/utils/index.dart';

import '../db/providers/serve_dynamic_ui_database_provider.dart';

class DbUtil {
  static Future<bool> deleteCachedPagesOlderThanSetCacheTime() async {
    try {
      int? cacheTime = await Util.getPageCacheTime();
      if (Util.isValid(cacheTime)) {
        int lastTime = DateTime.now()
            .subtract(Duration(seconds: cacheTime!))
            .millisecondsSinceEpoch;
        CachedPageDao serveDynamicUIDatabase =
            await ServeDynamicUIDatabaseProvider.instance.database;
        int? deletedPages = await serveDynamicUIDatabase
            .deleteCachedPagesOlderThanTime(lastTime);
        debugPrint('Deleted pages count: $deletedPages');
        return Util.isValid(deletedPages) && deletedPages > 0;
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
        CachedPageDao serveDynamicUIDatabase =
            await ServeDynamicUIDatabaseProvider.instance.database;
        int deletedPage = await serveDynamicUIDatabase
            .deleteCachedPageIfOlderThanTime(pageKey, lastTime);
        debugPrint('deleted page $pageKey? : $deletedPage');
        return Util.isValid(deletedPage) && deletedPage > 0;
      }
    } catch (e) {
      debugPrint('Some error occurred: $e');
    }
    return false;
  }
}
