// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_button.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicButton _$DynamicButtonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicButton(
    key: json['key'] as String,
    child: json['child'] == null ? null : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
    action: json['action'] == null
        ? null
        : ActionDTO.fromJson(json['action'] as Map<String, dynamic>),
    width: (json['width'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    padding: WidgetUtil.getEdgeInsets(json['padding'] as String?),
    margin: WidgetUtil.getEdgeInsets(json['margin'] as String?),
    borderWidth: (json['borderWidth'] as num?)?.toDouble(),
    buttonBorderColor:
        WidgetUtil.getColor(json['buttonBorderColor'] as String?),
    buttonBorderRadius: (json['buttonBorderRadius'] as num?)?.toDouble(),
    buttonColor: WidgetUtil.getColor(json['buttonColor'] as String?),
    onLongPressAction: json['onLongPressAction'] == null
        ? null
        : ActionDTO.fromJson(json['onLongPressAction'] as Map<String, dynamic>),
    onDoubleTapAction: json['onDoubleTapAction'] == null
        ? null
        : ActionDTO.fromJson(json['onDoubleTapAction'] as Map<String, dynamic>),
  );
}
