// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicList _$DynamicListFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicList(
    key: json['key'] as String?,
    isVertical: json['isVertical'] as bool? ?? true,
    listItems: (json['listItems'] as List<dynamic>?)
        ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
        .toList(),
    separator: json['separator'] == null
        ? null
        : DynamicWidget.fromJson(json['separator'] as Map<String, dynamic>),
    shrinkWrap: json['shrinkWrap'] as bool? ?? false,
  );
}
