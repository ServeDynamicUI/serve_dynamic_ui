// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_shimmer_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicShimmerImage _$DynamicShimmerImageFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicShimmerImage(
    key: json['key'] as String,
    width: (json['width'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    placeholderImagePath: json['placeholderImagePath'] as String,
    fit: WidgetUtil.getBoxFit(json['fit'] as String?),
    clipBorderRadius: (json['clipBorderRadius'] as num?)?.toDouble(),
    shimmerBaseColor: WidgetUtil.getColor(json['shimmerBaseColor'] as String?),
    shimmerHighlightColor: WidgetUtil.getColor(json['shimmerHighlightColor'] as String?),
  );
}
