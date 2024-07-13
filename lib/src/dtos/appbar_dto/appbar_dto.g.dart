// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appbar_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppBarDto _$AppBarDtoFromJson(Map<String, dynamic> json) {
  return AppBarDto(
    key: json['key'] == null ? null : Key(json['key'] as String),
    pageTitle: json['pageTitle'] as String?,
    leading: json['leading'] == null
        ? null
        : DynamicWidget.fromJson(json['leading'] as Map<String, dynamic>),
    automaticallyImplyLeading:
        json['automaticallyImplyLeading'] as bool? ?? true,
    title: json['title'] == null
        ? null
        : DynamicWidget.fromJson(json['title'] as Map<String, dynamic>),
    rightActions: json['rightActions'] == null
        ? null
        : (json['rightActions'] as List<dynamic>?)
            ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
            .toList(),
    leftActions: json['leftActions'] == null
        ? null
        : (json['leftActions'] as List<dynamic>?)
            ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
            .toList(),
    flexibleSpace: json['flexibleSpace'] == null
        ? null
        : DynamicWidget.fromJson(json['flexibleSpace'] as Map<String, dynamic>),
    bottom: json['bottom'] == null
        ? null
        : DynamicWidget.fromJson(json['bottom'] as Map<String, dynamic>),
    elevation: (json['elevation'] as num?)?.toDouble(),
    scrolledUnderElevation:
        (json['scrolledUnderElevation'] as num?)?.toDouble(),
    shadowColor: WidgetUtil.getColor(json['shadowColor'] as String?),
    surfaceTintColor: WidgetUtil.getColor(json['surfaceTintColor'] as String?),
    backgroundColor: WidgetUtil.getColor(json['backgroundColor'] as String?),
    foregroundColor: WidgetUtil.getColor(json['foregroundColor'] as String?),
    primary: json['primary'] as bool? ?? true,
    centerTitle: json['centerTitle'] as bool?,
    excludeHeaderSemantics: json['excludeHeaderSemantics'] as bool? ?? false,
    titleSpacing: (json['titleSpacing'] as num?)?.toDouble(),
    toolbarOpacity: (json['toolbarOpacity'] as num?)?.toDouble() ?? 1.0,
    bottomOpacity: (json['bottomOpacity'] as num?)?.toDouble() ?? 1.0,
    toolbarHeight: (json['toolbarHeight'] as num?)?.toDouble(),
    leadingWidth: (json['leadingWidth'] as num?)?.toDouble(),
    toolbarTextStyle: json['toolbarTextStyle'] == null
        ? null
        : TextStyleDTO.fromJson(
            json['toolbarTextStyle'] as Map<String, dynamic>),
    titleTextStyle: json['titleTextStyle'] == null
        ? null
        : TextStyleDTO.fromJson(json['titleTextStyle'] as Map<String, dynamic>),
    forceMaterialTransparency:
        json['forceMaterialTransparency'] as bool? ?? false,
    clipBehavior: json['clipBehavior'] == null
        ? null
        : WidgetUtil.getClipBehavior(json['clipBehavior'] as String?),
    appBarGradient:
        WidgetUtil.getLinearGradient(json['appBarGradient'] as String?),
  );
}
