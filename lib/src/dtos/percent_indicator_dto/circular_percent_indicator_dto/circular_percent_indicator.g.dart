// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circular_percent_indicator_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircularPercentIndicatorDTO _$CircularPercentIndicatorDTOFromJson(Map<String, dynamic> json) =>
    CircularPercentIndicatorDTO(
      percent: (json['percent'] as num?)?.toDouble() ?? 0,
      lineWidth: (json['lineWidth'] as num?)?.toDouble() ?? 5,
      startAngle: (json['startAngle'] as num?)?.toDouble() ?? 0.0,
      radius: (json['radius'] as num?)?.toDouble() ?? 10,
      fillColor: WidgetUtil.getColor(json['fillColor'] as String?) ?? Colors.transparent,
      backgroundColor: WidgetUtil.getColor(json['backgroundColor'] as String?) ?? const Color(0xFFB8C7CB),
      progressColor: WidgetUtil.getColor(json['progressColor'] as String?),
      backgroundWidth: (json['backgroundWidth'] as num?)?.toDouble() ?? -1,
      linearGradient: WidgetUtil.getLinearGradient(json['linearGradient'] as String?),
      animation: json['animation'] as bool? ?? false,
      animationDuration: (json['animationDuration'] as num?)?.toInt() ?? 500,
      header: json['header'] == null
          ? null
          : DynamicWidget.fromJson(json['header'] as Map<String, dynamic>),
      footer: json['footer'] == null
          ? null
          : DynamicWidget.fromJson(json['footer'] as Map<String, dynamic>),
      center: json['center'] == null
          ? null
          : DynamicWidget.fromJson(json['center'] as Map<String, dynamic>),
      addAutomaticKeepAlive: json['addAutomaticKeepAlive'] as bool? ?? true,
      circularStrokeCap: WidgetUtil.getCircularStrokeCap(json['circularStrokeCap'] as String?) ?? CircularStrokeCap.butt,
      arcBackgroundColor: WidgetUtil.getColor(json['arcBackgroundColor'] as String?),
      arcType: WidgetUtil.getArcType(json['arcType'] as String?),
      animateFromLastPercent: json['animateFromLastPercent'] as bool? ?? false,
      reverse: json['reverse'] as bool? ?? false,
      curve: WidgetUtil.getCurve(json['curve'] as String?) ?? Curves.linear,
      restartAnimation: (json['restartAnimation'] as bool?) ?? false,
      widgetIndicator: json['widgetIndicator'] == null
          ? null
          : DynamicWidget.fromJson(json['widgetIndicator'] as Map<String, dynamic>),
      rotateLinearGradient: (json['rotateLinearGradient'] as bool?) ?? false,
    );
