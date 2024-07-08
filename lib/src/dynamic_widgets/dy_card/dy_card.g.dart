// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicCard _$DynamicCardFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicCard(
    key: json['key'] as String?,
    color: WidgetUtil.getColor(json['color'] as String?),
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
    clipBehavior: WidgetUtil.getClipBehavior(json['clipBehavior'] as String?),
    margin: WidgetUtil.getEdgeInsets(json['margin'] as String?),
    borderOnForeground: json['borderOnForeground'] as bool? ?? true,
    elevation: (json['elevation'] as num?)?.toDouble(),
    semanticContainer: json['semanticContainer'] as bool? ?? true,
    shadowColor: WidgetUtil.getColor(json['shadowColor'] as String?),
    surfaceTintColor: WidgetUtil.getColor(json['surfaceTintColor'] as String?),
    borderRadius: (json['borderRadius'] as num?)?.toDouble(),
    linearGradient:
        WidgetUtil.getLinearGradient(json['linearGradient'] as String?),
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height: WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
  );
}
