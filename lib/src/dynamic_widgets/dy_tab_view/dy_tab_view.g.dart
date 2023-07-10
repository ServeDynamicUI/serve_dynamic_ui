// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_tab_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicTabView _$DynamicTabViewFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicTabView(
    key: json['key'] as String?,
    selectedTabIndex: json['selectedTabIndex'] as int? ?? 0,
    margin: (json['margin'] as num?)?.toDouble() ?? 0,
    indicatorColor: WidgetUtil.getColor(json['indicatorColor'] as String?),
    labelColor: WidgetUtil.getColor(json['labelColor'] as String?),
    unselectedLabelColor:
        WidgetUtil.getColor(json['unselectedLabelColor'] as String?),
    tabs: (json['tabs'] as List<dynamic>?)
        ?.map((e) => TabDTO.fromJson(e as Map<String, dynamic>))
        .toList(),
    tabsBackgroundColor:
        WidgetUtil.getColor(json['tabsBackgroundColor'] as String?),
    cornerRadius: (json['cornerRadius'] as num?)?.toDouble() ?? 8,
    wantKeepAlive: json['wantKeepAlive'] as bool? ?? false,
  );
}
