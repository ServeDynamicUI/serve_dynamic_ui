import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:json_annotation/json_annotation.dart';

part 'linear_percent_indicator_dto.g.dart';

class LinearPercentIndicatorDTO {
  double percent;
  double lineHeight;
  @JsonKey(fromJson: WidgetUtil.getColor, defaultValue: Colors.transparent)
  Color fillColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? backgroundColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? progressColor;
  @JsonKey(fromJson: WidgetUtil.getLinearGradient)
  LinearGradient? linearGradient;
  @JsonKey(fromJson: WidgetUtil.getLinearGradient)
  LinearGradient? linearGradientBackgroundColor;
  bool animateFromLastPercent;
  bool isRTL;
  bool restartAnimation;
  bool addAutomaticKeepAlive;
  int animationDuration;
  bool animation;
  double? barRadius;
  DynamicWidget? leading;
  DynamicWidget? trailing;
  DynamicWidget? center;
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets padding;
  @JsonKey(fromJson: WidgetUtil.getCurve)
  Curve curve;
  bool clipLinearGradient;
  @JsonKey(fromJson: WidgetUtil.getMainAxisAlignment)
  MainAxisAlignment alignment;
  DynamicWidget? widgetIndicator;

  LinearPercentIndicatorDTO(
      {this.percent = 0,
      this.lineHeight = 8.0,
      this.fillColor = Colors.transparent,
      this.backgroundColor,
      this.progressColor,
      this.linearGradient,
      this.linearGradientBackgroundColor,
      this.animateFromLastPercent = false,
      this.isRTL = false,
      this.restartAnimation = false,
      this.addAutomaticKeepAlive = true,
      this.animationDuration = 500,
      this.animation = false,
      this.barRadius,
      this.leading,
      this.trailing,
      this.center,
      this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
      this.curve = Curves.linear,
      this.clipLinearGradient = false,
      this.alignment = MainAxisAlignment.start,
      this.widgetIndicator});

  factory LinearPercentIndicatorDTO.fromJson(Map<String, dynamic> json) =>
      _$LinearPercentIndicatorDTOFromJson(json);
}
