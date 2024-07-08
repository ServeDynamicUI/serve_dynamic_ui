// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_sized_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicSizedBox _$DynamicSizedBoxFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicSizedBox(
    key: json['key'] as String?,
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height: WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
  );
}
