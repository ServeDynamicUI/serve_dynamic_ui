// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_column.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicColumn _$DynamicColumnFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicColumn(
    key: json['key'] as String?,
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
        .toList(),
    mainAxisAlignment:
        WidgetUtil.getMainAxisAlignment(json['mainAxisAlignment'] as String?),
    crossAxisAlignment:
        WidgetUtil.getCrossAxisAlignment(json['crossAxisAlignment'] as String?),
  );
}
