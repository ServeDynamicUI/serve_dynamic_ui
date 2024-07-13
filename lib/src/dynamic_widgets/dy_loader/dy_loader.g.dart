// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_loader.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicLoader _$DynamicLoaderFromJson(Map<String, dynamic> json) {
  return DynamicLoader(
      key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
      backgroundColor: WidgetUtil.getColor(json['backgroundColor'] as String?),
      color: WidgetUtil.getColor(json['color'] as String?),
      mainAxisAlignment: WidgetUtil.getMainAxisAlignment(
              json['mainAxisAlignment'] as String?) ??
          MainAxisAlignment.start,
      crossAxisAlignment: WidgetUtil.getCrossAxisAlignment(
              json['crossAxisAlignment'] as String?) ??
          CrossAxisAlignment.center,
      loadingText: json['loadingText'] as String? ?? 'Loading',
      style: json['style'] == null
          ? null
          : TextStyleDTO.fromJson(json['style'] as Map<String, dynamic>),
      value: (json['value'] as num?)?.toDouble(),
      strokeWidth: (json['strokeWidth'] as num?)?.toDouble() ?? 4.0,
      containerColor: WidgetUtil.getColor(json['containerColor'] as String?),
      containerColorOpacity:
          (json['containerColorOpacity'] as num?)?.toDouble(),
      containerHeight: WidgetUtil.getHeightValueOrInf(
          (json['containerHeight'] as num?)?.toDouble()),
      containerWidth: WidgetUtil.getWidthValueOrInf(
          (json['containerWidth'] as num?)?.toDouble()));
}
