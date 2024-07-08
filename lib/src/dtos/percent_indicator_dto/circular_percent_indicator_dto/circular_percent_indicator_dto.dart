import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'circular_percent_indicator.g.dart';

///[CircularPercentIndicatorDTO] : dto which holds properties required in an CircularPercentIndicator Widget.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class CircularPercentIndicatorDTO {
  double percent;
  double lineWidth;
  double startAngle;
  double radius;
  @JsonKey(fromJson: WidgetUtil.getColor, defaultValue: Colors.transparent)
  Color fillColor;
  @JsonKey(fromJson: WidgetUtil.getColor, defaultValue: Color(0xFFB8C7CB))
  Color backgroundColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? progressColor;
  double backgroundWidth;
  @JsonKey(fromJson: WidgetUtil.getLinearGradient)
  LinearGradient? linearGradient;
  bool animation;
  int animationDuration;
  DynamicWidget? header;
  DynamicWidget? footer;
  DynamicWidget? center;
  bool addAutomaticKeepAlive;
  @JsonKey(fromJson: WidgetUtil.getCircularStrokeCap, defaultValue: CircularStrokeCap.butt)
  CircularStrokeCap circularStrokeCap;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? arcBackgroundColor;
  @JsonKey(fromJson: WidgetUtil.getArcType)
  ArcType? arcType;
  bool animateFromLastPercent;
  bool reverse;
  @JsonKey(fromJson: WidgetUtil.getCurve, defaultValue: Curves.linear)
  Curve curve;
  bool restartAnimation;
  DynamicWidget? widgetIndicator;
  bool rotateLinearGradient;

  CircularPercentIndicatorDTO({
    this.percent = 0.0,
    this.lineWidth = 5.0,
    this.startAngle = 0.0,
    this.radius = 10,
    this.fillColor = Colors.transparent,
    this.backgroundColor = const Color(0xFFB8C7CB),
    this.progressColor,
    this.backgroundWidth = -1,
    this.linearGradient,
    this.animation = false,
    this.animationDuration = 500,
    this.header,
    this.footer,
    this.center,
    this.addAutomaticKeepAlive = true,
    this.circularStrokeCap = CircularStrokeCap.butt,
    this.arcBackgroundColor,
    this.arcType,
    this.animateFromLastPercent = false,
    this.reverse = false,
    this.curve = Curves.linear,
    this.restartAnimation = false,
    this.widgetIndicator,
    this.rotateLinearGradient = false,
  });

  factory CircularPercentIndicatorDTO.fromJson(Map<String, dynamic> json) =>
      _$CircularPercentIndicatorDTOFromJson(json);
}

