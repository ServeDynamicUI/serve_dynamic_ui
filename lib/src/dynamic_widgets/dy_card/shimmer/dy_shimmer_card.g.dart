// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_shimmer_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicShimmerCard _$DynamicShimmerCardFromJson(Map<String, dynamic> json) {
  return DynamicShimmerCard(
    key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height:
        WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
    borderRadius: (json['borderRadius'] as num?)?.toDouble(),
    shimmerBaseColor: WidgetUtil.getColor(json['shimmerBaseColor'] as String?),
    shimmerHighlightColor:
        WidgetUtil.getColor(json['shimmerHighlightColor'] as String?),
  );
}
