// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_stack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicStack _$DynamicStackFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicStack(
    key: json['key'] as String?,
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
        .toList(),
    alignment: WidgetUtil.getPositionalAlignment(json['alignment'] as String?),
    fit: WidgetUtil.getStackFit(json['fit'] as String?),
    clipBehavior: WidgetUtil.getClipBehavior(json['clipBehavior'] as String?),
    textDirection:
        WidgetUtil.getTextDirection(json['textDirection'] as String?),
  );
}
