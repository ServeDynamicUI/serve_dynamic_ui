// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicText _$DynamicTextFromJson(Map<String, dynamic> json) {
  return DynamicText(
    key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
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
    height:
        WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
    alignment: WidgetUtil.getPositionalAlignment(json['alignment'] as String?),
    padding: WidgetUtil.getEdgeInsets(json['padding'] as String?),
    margin: WidgetUtil.getEdgeInsets(json['margin'] as String?),
  );
}
