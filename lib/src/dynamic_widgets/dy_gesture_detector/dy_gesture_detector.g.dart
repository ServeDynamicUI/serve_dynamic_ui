// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_gesture_detector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicGestureDetector _$DynamicGestureDetectorFromJson(
    Map<String, dynamic> json) {
  return DynamicGestureDetector(
    key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
    onTapAction: json['onTapAction'] == null
        ? null
        : ActionDTO.fromJson(json['onTapAction'] as Map<String, dynamic>),
    onDoubleTapAction: json['onDoubleTapAction'] == null
        ? null
        : ActionDTO.fromJson(json['onDoubleTapAction'] as Map<String, dynamic>),
    onLongPressAction: json['onLongPressAction'] == null
        ? null
        : ActionDTO.fromJson(json['onLongPressAction'] as Map<String, dynamic>),
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height: WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
  );
}
