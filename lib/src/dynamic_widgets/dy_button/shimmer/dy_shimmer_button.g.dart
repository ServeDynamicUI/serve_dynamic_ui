// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_shimmer_button.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicShimmerButton _$DynamicShimmerButtonFromJson(Map<String, dynamic> json) {
  return DynamicShimmerButton(
    key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height: WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
    buttonBorderRadius: (json['buttonBorderRadius'] as num?)?.toDouble(),
    shimmerBaseColor: WidgetUtil.getColor(json['shimmerBaseColor'] as String?),
    shimmerHighlightColor:
        WidgetUtil.getColor(json['shimmerHighlightColor'] as String?),
  );
}
