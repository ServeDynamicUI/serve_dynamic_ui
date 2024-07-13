import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_container.g.dart';

///[DynamicContainer] : A dynamic widget that creates a container to hold child widget.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicContainer extends DynamicWidget {
  @JsonKey(fromJson: Util.generateRandomString)
  String key;
  String? backgroundColor;
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? padding;
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? margin;
  @JsonKey(fromJson: WidgetUtil.getHeightValueOrInf)
  double? height;
  @JsonKey(fromJson: WidgetUtil.getWidthValueOrInf)
  double? width;
  DynamicWidget? child;
  @JsonKey(fromJson: WidgetUtil.getPositionalAlignment)
  Alignment? alignment;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? borderColor;
  @JsonKey(defaultValue: false)
  bool showBorder;
  double? borderRadius;
  @JsonKey(fromJson: WidgetUtil.getLinearGradient)
  LinearGradient? containerGradient;

  DynamicContainer({
    required this.key,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.child,
    this.alignment,
    required this.showBorder,
    this.borderColor,
    this.borderRadius,
    this.containerGradient,
  }) : super(key: key);

  factory DynamicContainer.fromJson(Map<String, dynamic> json) =>
      _$DynamicContainerFromJson(json);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: !showBorder
          ? backgroundColor != null
              ? Color(int.parse(backgroundColor!))
              : Colors.transparent
          : null,
      padding: padding != null ? padding! : EdgeInsets.zero,
      margin: margin != null ? margin! : EdgeInsets.zero,
      height: height,
      width: width,
      alignment: alignment ?? Alignment.center,
      decoration: showBorder
          ? BoxDecoration(
              color: backgroundColor != null
                  ? Color(int.parse(backgroundColor!))
                  : null,
              border:
                  Border.all(width: 1, color: borderColor ?? AppColors.black),
              borderRadius: BorderRadius.circular(borderRadius ?? 5),
              gradient: containerGradient)
          : null,
      child: child != null
          ? LayoutBuilder(builder: (context, _) {
              return child!.build(
                context,
              );
            })
          : const SizedBox.shrink(),
    );
  }

  @override
  List<DynamicWidget>? get childWidgets => child == null ? [] : [child!];

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
