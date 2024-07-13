import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:serve_dynamic_ui/src/dtos/percent_indicator_dto/index.dart';

part 'dy_percentage_indicator.g.dart';

///[DynamicPercentageIndicator] : A dynamic widget that shows percentage.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicPercentageIndicator extends DynamicWidget {
  String key;
  @JsonKey(fromJson: WidgetUtil.getHeightValueOrInf)
  double? height;
  @JsonKey(fromJson: WidgetUtil.getWidthValueOrInf)
  double? width;
  @JsonKey(fromJson: WidgetUtil.getPercentageIndicatorType, defaultValue: PercentageIndicatorType.linear)
  PercentageIndicatorType type;
  LinearPercentIndicatorDTO? linearPercentIndicator;
  CircularPercentIndicatorDTO? circularPercentIndicator;

  DynamicPercentageIndicator({
    required this.key,
    this.height,
    this.width,
    this.type = PercentageIndicatorType.linear,
    this.linearPercentIndicator,
    this.circularPercentIndicator,
  }) : super(
          key: key,
        );

  factory DynamicPercentageIndicator.fromJson(Map<String, dynamic> json) =>
      _$DynamicPercentageIndicatorFromJson(json);

  @override
  Widget build(BuildContext context) {
    if(type == PercentageIndicatorType.circular){
      return CircularPercentIndicator(
        radius: circularPercentIndicator!.radius,
        lineWidth: circularPercentIndicator!.lineWidth,
        percent: circularPercentIndicator!.percent,
        startAngle: circularPercentIndicator!.startAngle,
        fillColor: circularPercentIndicator!.fillColor,
        backgroundColor: circularPercentIndicator!.backgroundColor,
        progressColor: circularPercentIndicator!.progressColor,
        backgroundWidth: circularPercentIndicator!.backgroundWidth,
        linearGradient: circularPercentIndicator!.linearGradient,
        animation: circularPercentIndicator!.animation,
        animationDuration: circularPercentIndicator!.animationDuration,
        header: circularPercentIndicator!.header?.build(context),
        footer: circularPercentIndicator!.footer?.build(context),
        center: circularPercentIndicator!.center?.build(context),
        addAutomaticKeepAlive: circularPercentIndicator!.addAutomaticKeepAlive,
        circularStrokeCap: circularPercentIndicator!.circularStrokeCap,
        arcBackgroundColor: circularPercentIndicator!.arcBackgroundColor,
        arcType: circularPercentIndicator!.arcType,
        animateFromLastPercent: circularPercentIndicator!.animateFromLastPercent,
        reverse: circularPercentIndicator!.reverse,
        curve: circularPercentIndicator!.curve,
        restartAnimation: circularPercentIndicator!.restartAnimation,
        widgetIndicator: circularPercentIndicator!.widgetIndicator?.build(context),
        rotateLinearGradient: circularPercentIndicator!.rotateLinearGradient,
      );
    }
    return LinearPercentIndicator(
      lineHeight: linearPercentIndicator!.lineHeight,
      percent: linearPercentIndicator!.percent,
      animation: linearPercentIndicator!.animation,
      barRadius: Radius.circular(linearPercentIndicator!.barRadius ?? 0),
      animationDuration: linearPercentIndicator!.animationDuration,
      leading: linearPercentIndicator!.leading?.build(context),
      center: linearPercentIndicator!.center?.build(context),
      trailing: linearPercentIndicator!.trailing?.build(context),
      backgroundColor: linearPercentIndicator!.backgroundColor,
      progressColor: linearPercentIndicator!.progressColor,
      fillColor: linearPercentIndicator!.fillColor,
      width: width,
      linearGradientBackgroundColor: linearPercentIndicator!.linearGradientBackgroundColor,
      linearGradient: linearPercentIndicator!.linearGradient,
      animateFromLastPercent: linearPercentIndicator!.animateFromLastPercent,
      isRTL: linearPercentIndicator!.isRTL,
      addAutomaticKeepAlive: linearPercentIndicator!.addAutomaticKeepAlive,
      padding: linearPercentIndicator!.padding,
      alignment: linearPercentIndicator!.alignment,
      curve: linearPercentIndicator!.curve,
      widgetIndicator: linearPercentIndicator!.widgetIndicator?.build(context),
      clipLinearGradient: linearPercentIndicator!.clipLinearGradient,
      restartAnimation: linearPercentIndicator!.restartAnimation
    );
  }

  @override
  List<DynamicWidget>? get childWidgets {
    List<DynamicWidget?> children = [];

    if(type == PercentageIndicatorType.circular){
      children.add(circularPercentIndicator!.header);
      children.add(circularPercentIndicator!.center);
      children.add(circularPercentIndicator!.footer);
    }
    else{
      children.add(linearPercentIndicator!.leading);
      children.add(linearPercentIndicator!.center);
      children.add(linearPercentIndicator!.trailing);
    }
    return WidgetUtil.childrenFilter(children);
  }

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  void postBuild() {}

  @override
  void preBuild() {}

  @override
  void onDispose() {}

  @override
  double? get dyHeight => height;

  @override
  double? get dyWidth => width;
}
