// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_positioned.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicPositioned _$DynamicPositionedFromJson(Map<String, dynamic> json) {
  return DynamicPositioned(
    key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height: WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
    left: (json['left'] as num?)?.toDouble(),
    right: (json['right'] as num?)?.toDouble(),
    bottom: (json['bottom'] as num?)?.toDouble(),
    top: (json['top'] as num?)?.toDouble(),
  );
}
