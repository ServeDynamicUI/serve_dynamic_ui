import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_stack.g.dart';

///[DynamicStack] : A dynamic widget that holds its child elements in stack manner.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicStack extends DynamicWidget {
  List<DynamicWidget>? children;
  @JsonKey(fromJson: WidgetUtil.getPositionalAlignment)
  Alignment? alignment;
  @JsonKey(fromJson: WidgetUtil.getStackFit)
  StackFit? fit;
  @JsonKey(fromJson: WidgetUtil.getClipBehavior)
  Clip? clipBehavior;
  @JsonKey(fromJson: WidgetUtil.getTextDirection)
  TextDirection? textDirection;
  @JsonKey(fromJson: WidgetUtil.getHeightValueOrInf)
  double? height;
  @JsonKey(fromJson: WidgetUtil.getWidthValueOrInf)
  double? width;

  DynamicStack({
    required super.key,
    this.children,
    this.alignment,
    this.fit,
    this.clipBehavior,
    this.textDirection,
    this.height,
    this.width,
    super.padding,
    super.margin,
  });

  factory DynamicStack.fromJson(Map<String, dynamic> json) =>
      _$DynamicStackFromJson(json);

  @override
  Widget build(BuildContext context) {
    if (children == null) {
      return const SizedBox.shrink();
    }
    return Stack(
      alignment: alignment ?? AlignmentDirectional.topStart,
      fit: fit ?? StackFit.loose,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      textDirection: textDirection,
      children: children!.map((child) => child.build(context)).toList(),
    );
  }

  @override
  List<DynamicWidget>? get childWidgets => children ?? [];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  void postBuild() {}

  @override
  void preBuild() {}

  @override
  void onDispose() {
    WidgetUtil.callOnDisposeOnWidgets(children);
  }

  @override
  double? get dyHeight => height;

  @override
  double? get dyWidth => width;
}
