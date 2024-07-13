import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_card.g.dart';

///[DynamicCard] : A dynamic widgets that helps to create visually appealing container.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicCard extends DynamicWidget {
  @JsonKey(fromJson: Util.generateRandomString)
  String key;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? color;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shadowColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? surfaceTintColor;
  double? elevation;
  bool borderOnForeground;
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? margin;
  @JsonKey(fromJson: WidgetUtil.getClipBehavior)
  Clip? clipBehavior;
  DynamicWidget? child;
  bool semanticContainer;
  double? borderRadius;
  @JsonKey(fromJson: WidgetUtil.getLinearGradient)
  LinearGradient? linearGradient;
  @JsonKey(fromJson: WidgetUtil.getHeightValueOrInf)
  double? height;
  @JsonKey(fromJson: WidgetUtil.getWidthValueOrInf)
  double? width;

  DynamicCard(
      {required this.key,
      this.color,
      this.child,
      this.clipBehavior,
      this.margin,
      this.borderOnForeground = true,
      this.elevation,
      this.semanticContainer = true,
      this.shadowColor,
      this.surfaceTintColor,
      this.borderRadius,
      this.linearGradient,
      this.height,
      this.width})
      : super(
          key: key,
        );

  factory DynamicCard.fromJson(Map<String, dynamic> json) =>
      _$DynamicCardFromJson(json);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: shadowColor,
      clipBehavior: clipBehavior,
      color: color,
      elevation: elevation,
      semanticContainer: semanticContainer,
      borderOnForeground: borderOnForeground,
      surfaceTintColor: surfaceTintColor,
      margin: margin ?? EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: linearGradient,
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        child: child?.build(context),
      ),
    );
  }

  @override
  List<DynamicWidget>? get childWidgets => child == null ? [child!] : [];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  void postBuild() {}

  @override
  void preBuild() {}

  @override
  void onDispose() {
    WidgetUtil.callOnDisposeOnWidget(child);
  }

  @override
  double? get dyHeight => height;

  @override
  double? get dyWidth => width;
}
