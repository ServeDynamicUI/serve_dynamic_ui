import 'package:hive/hive.dart';
import 'package:serve_dynamic_ui/src/db/entities/page_entity.dart';

///[CachedPageDao] this dao helps to query and store pages in db.
class CachedPageDao {
  final Box<PageEntity> box = Hive.box<PageEntity>('cachedPages');

  CachedPageDao._privateConstructor();

  static final CachedPageDao instance = CachedPageDao._privateConstructor();

  Future<void> insertCachedPage(PageEntity pageEntity) async {
    await box.put(pageEntity.pageKey, pageEntity);
  }

  Future<List<PageEntity>> getAllCachedPage() async {
    return box.values.toList();
  }

  Future<PageEntity?> findCachedPageByPageKey(String pageKey) async {
    return box.get(pageKey);
  }

  Future<int> deleteCachedPagesOlderThanTime(int time) async {
    final keysToDelete = box.values
        .where((page) => page.updatedAt < time)
        .map((page) => page.pageKey)
        .toList();
    await box.deleteAll(keysToDelete);
    return keysToDelete.length;
  }

  Future<int> deleteCachedPageIfOlderThanTime(String pageKey, int time) async {
    final page = box.get(pageKey);
    if (page != null && page.updatedAt < time) {
      await box.delete(pageKey);
      return 1;
    }
    return 0;
  }

  Future<int> deleteAllCachedPages() async {
    final count = box.length;
    await box.clear();
    return count;
  }

  Future<int> deleteCachePageByKey(String pageKey) async {
    await box.delete(pageKey);
    return 1;
  }
}
