// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_shimmer_button.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicShimmerButton _$DynamicShimmerButtonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicShimmerButton(
    key: json['key'] as String,
    width: (json['width'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    buttonBorderRadius: (json['buttonBorderRadius'] as num?)?.toDouble(),
    shimmerBaseColor: WidgetUtil.getColor(json['shimmerBaseColor'] as String?),
    shimmerHighlightColor:
        WidgetUtil.getColor(json['shimmerHighlightColor'] as String?),
  );
}
