// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_shimmer_stack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicShimmerStack _$DynamicShimmerStackFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicShimmerStack(
    key: json['key'] as String,
    shimmerBaseColor: WidgetUtil.getColor(json['shimmerBaseColor'] as String?),
    shimmerHighlightColor: WidgetUtil.getColor(json['shimmerHighlightColor'] as String?),
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
        .toList(),
    alignment: WidgetUtil.getPositionalAlignment(json['alignment'] as String?),
    fit: WidgetUtil.getStackFit(json['fit'] as String?),
    clipBehavior: WidgetUtil.getClipBehavior(json['clipBehavior'] as String?),
    textDirection: WidgetUtil.getTextDirection(json['textDirection'] as String?),
    height: (json['height'] as num?)?.toDouble(),
    width: (json['width'] as num?)?.toDouble(),
  );
}
