import 'package:hive_flutter/adapters.dart';
import 'package:serve_dynamic_ui/src/db/daos/cached_page_dao.dart';
import 'package:serve_dynamic_ui/src/db/entities/page_entity.dart';

///[ServeDynamicUIDatabaseProvider] this provider helps to get singleton instance of [ServeDynamicUIDatabase]
class ServeDynamicUIDatabaseProvider {
  ServeDynamicUIDatabaseProvider._privateConstructor();

  static final ServeDynamicUIDatabaseProvider instance =
      ServeDynamicUIDatabaseProvider._privateConstructor();

  CachedPageDao? _database;

  Future<CachedPageDao> get database async {
    if (_database == null) {
      await _initHive();
    }
    _database ??= CachedPageDao.instance;
    return _database!;
  }

  Future<void> _initHive() async {
    await Hive.initFlutter('serve_dynamic_ui');
    Hive.registerAdapter(PageEntityAdapter());
    await Hive.openBox<PageEntity>('cachedPages');
  }
}
