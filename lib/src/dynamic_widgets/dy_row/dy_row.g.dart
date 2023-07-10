// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicRow _$DynamicRowFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicRow(
    key: json['key'] as String?,
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : DynamicWidget.fromJson(e as Map<String, dynamic>))
        .toList(),
    mainAxisAlignment:
        WidgetUtil.getMainAxisAlignment(json['mainAxisAlignment'] as String?),
    crossAxisAlignment:
        WidgetUtil.getCrossAxisAlignment(json['crossAxisAlignment'] as String?),
  );
}
