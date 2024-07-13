// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linear_percent_indicator_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinearPercentIndicatorDTO _$LinearPercentIndicatorDTOFromJson(Map<String, dynamic> json) {

      return LinearPercentIndicatorDTO(
            percent: (json['percent'] is String) ? (double.parse(json['percent'])).toDouble() :(json['percent'] as num?)?.toDouble() ?? 0.0,
            lineHeight: (json['lineHeight'] as num?)?.toDouble() ?? 8.0,
            fillColor: WidgetUtil.getColor(json['fillColor'] as String?) ?? Colors.transparent,
            backgroundColor: WidgetUtil.getColor(json['backgroundColor'] as String?),
            progressColor: WidgetUtil.getColor(json['progressColor'] as String?),
            linearGradient: WidgetUtil.getLinearGradient(json['linearGradient'] as String?),
            linearGradientBackgroundColor: WidgetUtil.getLinearGradient(json['linearGradientBackgroundColor'] as String?),
            animation: (json['animation'] as bool?) ?? false,
            animateFromLastPercent: (json['animateFromLastPercent'] as bool?) ?? false,
            isRTL: (json['isRTL'] as bool?) ?? false,
            restartAnimation: (json['restartAnimation'] as bool?) ?? false,
            addAutomaticKeepAlive: (json['addAutomaticKeepAlive'] as bool?) ?? true,
            animationDuration: (json['animationDuration'] as num?)?.toInt() ?? 500,
            barRadius: (json['barRadius'] as num?)?.toDouble() ?? 0.0,
            leading: json['leading'] == null ? null : DynamicWidget.fromJson(json['leading'] as Map<String, dynamic>),
            center: json['center'] == null ? null : DynamicWidget.fromJson(json['center'] as Map<String, dynamic>),
            trailing: json['trailing'] == null ? null : DynamicWidget.fromJson(json['trailing'] as Map<String, dynamic>),
            padding: WidgetUtil.getEdgeInsets(json['padding'] as String?) ?? const EdgeInsets.symmetric(horizontal: 10.0),
            curve: WidgetUtil.getCurve(json['curve'] as String?) ?? Curves.linear,
            clipLinearGradient: (json['clipLinearGradient'] as bool?) ?? false,
            alignment: WidgetUtil.getMainAxisAlignment(json['alignment'] as String?) ?? MainAxisAlignment.start,
            widgetIndicator: json['widgetIndicator'] == null ? null : DynamicWidget.fromJson(json['widgetIndicator'] as Map<String, dynamic>),
      );
}
