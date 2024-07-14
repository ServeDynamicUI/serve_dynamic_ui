import '../database/serve_dynamic_ui_database.dart';

///[ServeDynamicUIDatabaseProvider] this provider helps to get singleton instance of [ServeDynamicUIDatabase]
class ServeDynamicUIDatabaseProvider {
  static String dbName = 'serve_dynamic_ui_database.db';

  ServeDynamicUIDatabaseProvider._privateConstructor();

  static final ServeDynamicUIDatabaseProvider instance =
      ServeDynamicUIDatabaseProvider._privateConstructor();

  ServeDynamicUIDatabase? _database;

  Future<ServeDynamicUIDatabase> get database async {
    _database ??=
        await $FloorServeDynamicUIDatabase.databaseBuilder(dbName).build();
    return _database!;
  }
}
