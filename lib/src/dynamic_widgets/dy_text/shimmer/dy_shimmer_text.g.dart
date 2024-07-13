// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_shimmer_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicShimmerText _$DynamicShimmerCardFromJson(Map<String, dynamic> json) {
  return DynamicShimmerText(
      key: (json['key'] as String?) ?? Util.generateRandomString(15),
      width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
      height:
          WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
      shimmerBaseColor:
          WidgetUtil.getColor(json['shimmerBaseColor'] as String?),
      shimmerHighlightColor:
          WidgetUtil.getColor(json['shimmerHighlightColor'] as String?),
      padding: WidgetUtil.getEdgeInsets(json['padding'] as String?),
      margin: WidgetUtil.getEdgeInsets(json['margin'] as String?),
      text: json['text'] as String?,
      textStyle: json['textStyle'] == null
          ? null
          : TextStyleDTO.fromJson(json['textStyle'] as Map<String, dynamic>));
}
