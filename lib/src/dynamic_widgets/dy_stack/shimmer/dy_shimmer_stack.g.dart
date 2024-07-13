// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_shimmer_stack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicShimmerStack _$DynamicShimmerStackFromJson(Map<String, dynamic> json) {
  return DynamicShimmerStack(
    key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
    shimmerBaseColor: WidgetUtil.getColor(json['shimmerBaseColor'] as String?),
    shimmerHighlightColor:
        WidgetUtil.getColor(json['shimmerHighlightColor'] as String?),
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
        .toList(),
    alignment: WidgetUtil.getPositionalAlignment(json['alignment'] as String?),
    fit: WidgetUtil.getStackFit(json['fit'] as String?),
    clipBehavior: WidgetUtil.getClipBehavior(json['clipBehavior'] as String?),
    textDirection:
        WidgetUtil.getTextDirection(json['textDirection'] as String?),
    height:
        WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    borderRadius: (json['borderRadius'] as num?)?.toDouble() ?? 0,
    borderWidth: (json['borderWidth'] as num?)?.toDouble() ?? 1,
    borderColor: WidgetUtil.getColor(json['borderColor'] as String?),
    padding: WidgetUtil.getEdgeInsets(json['padding'] as String?),
    margin: WidgetUtil.getEdgeInsets(json['margin'] as String?),
  );
}
