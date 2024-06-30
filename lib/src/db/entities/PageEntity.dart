import 'package:floor/floor.dart';

@Entity(tableName: 'ServeDynamicUI_CachedPage')
class PageEntity {
  @PrimaryKey(autoGenerate: false)
  final String pageKey;

  final String page;

  final int updatedAt;

  PageEntity(this.pageKey, this.page, this.updatedAt);
}