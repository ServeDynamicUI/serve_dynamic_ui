// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicText _$DynamicTextFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicText(
    key: json['key'] as String?,
    text: json['text'] as String?,
    style: json['style'] == null
        ? null
        : TextStyleDTO.fromJson(json['style'] as Map<String, dynamic>),
    textDirection:
        WidgetUtil.getTextDirection(json['textDirection'] as String?),
    textAlign: WidgetUtil.getTextAlign(json['textAlign'] as String?),
    maxLines: json['maxLines'] as int?,
    overflow: WidgetUtil.getTextOverflow(json['overflow'] as String?),
    isHtmlText: json['isHtmlText'] as bool? ?? false,
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height: WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
    alignment: WidgetUtil.getPositionalAlignment(json['alignment'] as String?),
  );
}
