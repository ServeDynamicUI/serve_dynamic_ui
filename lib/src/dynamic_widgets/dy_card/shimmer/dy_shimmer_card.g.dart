// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_shimmer_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicShimmerCard _$DynamicShimmerCardFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicShimmerCard(
    key: json['key'] as String,
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
    width: (json['width'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    borderRadius: (json['borderRadius'] as num?)?.toDouble(),
    shimmerBaseColor: WidgetUtil.getColor(json['shimmerBaseColor'] as String?),
    shimmerHighlightColor: WidgetUtil.getColor(json['shimmerHighlightColor'] as String?),
  );
}
