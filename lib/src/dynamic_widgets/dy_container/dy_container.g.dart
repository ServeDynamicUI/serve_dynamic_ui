// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicContainer _$DynamicContainerFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicContainer(
    key: json['key'] as String?,
    backgroundColor: json['backgroundColor'] as String?,
    padding: WidgetUtil.getEdgeInsets(json['padding'] as String?),
    margin: WidgetUtil.getEdgeInsets(json['margin'] as String?),
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height: WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
    alignment: WidgetUtil.getPositionalAlignment(json['alignment'] as String?),
    showBorder: json['showBorder'] as bool? ?? false,
    borderColor: WidgetUtil.getColor(json['borderColor'] as String?),
    borderRadius: (json['borderRadius'] as num?)?.toDouble(),
  );
}
