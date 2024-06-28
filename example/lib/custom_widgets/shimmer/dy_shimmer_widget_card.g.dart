// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_shimmer_widget_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicShimmerWidgetCard _$DynamicWidgetCardFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicShimmerWidgetCard(
    key: json['key'] as String,
    prefixImage: json['prefixImage'] == null
        ? null
        : DynamicWidget.fromJson(json['prefixImage'] as Map<String, dynamic>),
    body: json['body'] == null
        ? null
        : DynamicWidget.fromJson(json['body'] as Map<String, dynamic>),
    elevation: (json['elevation'] as num?)?.toDouble(),
    borderRadius: (json['borderRadius'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    width: (json['width'] as num?)?.toDouble(),
    margin: WidgetUtil.getEdgeInsets(json['margin'] as String?),
    padding: WidgetUtil.getEdgeInsets(json['padding'] as String?),
  );
}
