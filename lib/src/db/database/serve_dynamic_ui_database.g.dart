// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serve_dynamic_ui_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorServeDynamicUIDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ServeDynamicUIDatabaseBuilder databaseBuilder(String name) =>
      _$ServeDynamicUIDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ServeDynamicUIDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ServeDynamicUIDatabaseBuilder(null);
}

class _$ServeDynamicUIDatabaseBuilder {
  _$ServeDynamicUIDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ServeDynamicUIDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ServeDynamicUIDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ServeDynamicUIDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ServeDynamicUIDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ServeDynamicUIDatabase extends ServeDynamicUIDatabase {
  _$ServeDynamicUIDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CachedPageDao? _cachedPageDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ServeDynamicUI_CachedPage` (`pageKey` TEXT NOT NULL, `page` TEXT NOT NULL, `updatedAt` INTEGER NOT NULL, PRIMARY KEY (`pageKey`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CachedPageDao get cachedPageDao {
    return _cachedPageDaoInstance ??= _$CachedPageDao(database, changeListener);
  }
}

class _$CachedPageDao extends CachedPageDao {
  _$CachedPageDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _pageEntityInsertionAdapter = InsertionAdapter(
            database,
            'ServeDynamicUI_CachedPage',
            (PageEntity item) => <String, Object?>{
                  'pageKey': item.pageKey,
                  'page': item.page,
                  'updatedAt': item.updatedAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PageEntity> _pageEntityInsertionAdapter;

  @override
  Future<List<PageEntity>> getAllCachedPage() async {
    return _queryAdapter.queryList('SELECT * FROM ServeDynamicUI_CachedPage',
        mapper: (Map<String, Object?> row) => PageEntity(
            row['pageKey'] as String,
            row['page'] as String,
            row['updatedAt'] as int));
  }

  @override
  Future<PageEntity?> findCachedPageByPageKey(String pageKey) async {
    return _queryAdapter.query(
        'SELECT * FROM ServeDynamicUI_CachedPage WHERE pageKey = ?1',
        mapper: (Map<String, Object?> row) => PageEntity(
            row['pageKey'] as String,
            row['page'] as String,
            row['updatedAt'] as int),
        arguments: [pageKey]);
  }

  @override
  Future<int?> deleteCachedPagesOlderThanTime(int time) async {
    return _queryAdapter.query(
        'DELETE FROM ServeDynamicUI_CachedPage WHERE pageKey in (SELECT pageKey FROM ServeDynamicUI_CachedPage WHERE updatedAt < ?1)',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [time]);
  }

  @override
  Future<int?> deleteCachedPageIfOlderThanTime(
    String pageKey,
    int time,
  ) async {
    return _queryAdapter.query(
        'DELETE FROM ServeDynamicUI_CachedPage WHERE pageKey = ?1 AND updatedAt < ?2',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [pageKey, time]);
  }

  @override
  Future<int?> deleteAllCachedPages() async {
    return _queryAdapter.query('DELETE FROM ServeDynamicUI_CachedPage',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<int?> deleteCachePageByKey(String pageKey) async {
    return _queryAdapter.query(
        'DELETE FROM ServeDynamicUI_CachedPage where pageKey = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [pageKey]);
  }

  @override
  Future<void> insertCachedPage(PageEntity pageEntity) async {
    await _pageEntityInsertionAdapter.insert(
        pageEntity, OnConflictStrategy.replace);
  }
}
