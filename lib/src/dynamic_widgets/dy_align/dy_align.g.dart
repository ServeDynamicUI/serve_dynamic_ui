// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_align.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicAlign _$DynamicAlignFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicAlign(
    key: json['key'] as String?,
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
    alignment: WidgetUtil.getPositionalAlignment(json['alignment'] as String?),
    heightFactor: (json['heightFactor'] as num?)?.toDouble(),
    widthFactor: (json['widthFactor'] as num?)?.toDouble(),
  );
}
