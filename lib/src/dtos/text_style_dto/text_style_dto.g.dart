// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_style_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextStyleDTO _$TextStyleDTOFromJson(Map<String, dynamic> json) => TextStyleDTO(
      color: WidgetUtil.getColor(json['color'] as String?),
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      backgroundColor: WidgetUtil.getColor(json['backgroundColor'] as String?),
      fontWeight: WidgetUtil.getFontWeight(json['fontWeight'] as String?),
      textOverflow: WidgetUtil.getTextOverflow(json['textOverflow'] as String?),
      fontStyle: WidgetUtil.getFontStyle(json['fontStyle'] as String?),
    );
