// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_stack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicStack _$DynamicStackFromJson(Map<String, dynamic> json) {
  return DynamicStack(
    key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
        .toList(),
    alignment: WidgetUtil.getPositionalAlignment(json['alignment'] as String?),
    fit: WidgetUtil.getStackFit(json['fit'] as String?),
    clipBehavior: WidgetUtil.getClipBehavior(json['clipBehavior'] as String?),
    textDirection:
        WidgetUtil.getTextDirection(json['textDirection'] as String?),
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height:
        WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
    padding: WidgetUtil.getEdgeInsets(json['padding'] as String?),
    margin: WidgetUtil.getEdgeInsets(json['margin'] as String?),
  );
}
