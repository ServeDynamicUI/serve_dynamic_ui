// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_align.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicAlign _$DynamicAlignFromJson(Map<String, dynamic> json) {
  return DynamicAlign(
    key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
    alignment: WidgetUtil.getPositionalAlignment(json['alignment'] as String?),
    heightFactor: (json['heightFactor'] as num?)?.toDouble(),
    widthFactor: (json['widthFactor'] as num?)?.toDouble(),
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height: WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
  );
}
