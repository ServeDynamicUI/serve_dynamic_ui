// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_positioned.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicPositioned _$DynamicPositionedFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicPositioned(
    key: json['key'] as String?,
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
    width: (json['width'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    left: (json['left'] as num?)?.toDouble(),
    right: (json['right'] as num?)?.toDouble(),
    bottom: (json['bottom'] as num?)?.toDouble(),
    top: (json['top'] as num?)?.toDouble(),
  );
}
