import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_positioned.g.dart';

///[DynamicPositioned] : A dynamic widget that renders child widget based on the values passed to it [top], [bottom], [left], [right].
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicPositioned extends DynamicWidget {
  DynamicWidget? child;
  double? left;
  double? right;
  double? top;
  double? bottom;
  double? height;
  double? width;

  DynamicPositioned({
    required super.key,
    this.child,
    this.width,
    this.height,
    this.left,
    this.right,
    this.bottom,
    this.top,
  });

  factory DynamicPositioned.fromJson(Map<String, dynamic> json) =>
      _$DynamicPositionedFromJson(json);

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return Positioned(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
        height: height,
        width: width,
        child: child!.build(context),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  List<DynamicWidget>? get childWidgets => child != null ? [child!] : [];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

}
