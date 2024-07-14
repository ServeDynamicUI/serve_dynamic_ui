import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'page_entity.g.dart';

///[PageEntity] this is structure of a row in table.
@HiveType(typeId: 0)
class PageEntity {
  @HiveField(0)
  final String pageKey;

  @HiveField(1)
  final String page;

  @HiveField(2)
  final int updatedAt;

  PageEntity(this.pageKey, this.page, this.updatedAt);
}
