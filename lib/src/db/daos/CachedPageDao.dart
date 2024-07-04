import 'package:floor/floor.dart';
import 'package:serve_dynamic_ui/src/db/entities/PageEntity.dart';

@dao
abstract class CachedPageDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCachedPage(PageEntity pageEntity);

  @Query('SELECT * FROM ServeDynamicUI_CachedPage')
  Future<List<PageEntity>> getAllCachedPage();

  @Query('SELECT * FROM ServeDynamicUI_CachedPage WHERE pageKey = :pageKey')
  Future<PageEntity?> findCachedPageByPageKey(String pageKey);

  @Query(
      'DELETE FROM ServeDynamicUI_CachedPage WHERE pageKey in (SELECT pageKey FROM ServeDynamicUI_CachedPage WHERE updatedAt < :time)')
  Future<int?> deleteCachedPagesOlderThanTime(int time);

  @Query(
      'DELETE FROM ServeDynamicUI_CachedPage WHERE pageKey = :pageKey AND updatedAt < :time')
  Future<int?> deleteCachedPageIfOlderThanTime(String pageKey, int time);

  @Query('DELETE FROM ServeDynamicUI_CachedPage')
  Future<int?> deleteAllCachedPages();

  @Query('DELETE FROM ServeDynamicUI_CachedPage where pageKey = :pageKey')
  Future<int?> deleteCachePageByKey(String pageKey);
}
