import 'package:floor/floor.dart';

///[PageEntity] this is structure of a row in table ServeDynamicUI_CachedPage.
@Entity(tableName: 'ServeDynamicUI_CachedPage')
class PageEntity {
  @PrimaryKey(autoGenerate: false)
  final String pageKey;

  final String page;

  final int updatedAt;

  PageEntity(this.pageKey, this.page, this.updatedAt);
}
