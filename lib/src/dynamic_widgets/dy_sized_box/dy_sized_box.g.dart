// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_sized_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicSizedBox _$DynamicSizedBoxFromJson(Map<String, dynamic> json) {
  return DynamicSizedBox(
    key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height: WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
  );
}
