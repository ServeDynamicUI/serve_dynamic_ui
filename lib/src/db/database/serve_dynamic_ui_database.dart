import 'dart:async';

import 'package:floor/floor.dart';
import 'package:serve_dynamic_ui/src/db/daos/CachedPageDao.dart';
import 'package:serve_dynamic_ui/src/db/entities/PageEntity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'serve_dynamic_ui_database.g.dart';

@Database(version: 1, entities: [PageEntity])
abstract class ServeDynamicUIDatabase extends FloorDatabase {
  CachedPageDao get cachedPageDao;
}