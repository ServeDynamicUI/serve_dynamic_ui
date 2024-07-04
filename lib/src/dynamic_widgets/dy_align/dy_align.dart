import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/index.dart';
import 'package:serve_dynamic_ui/src/utils/index.dart';

part 'dy_align.g.dart';

///[DynamicAlign] : A dynamic widget that helps to align its child widgets.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicAlign extends DynamicWidget {
  DynamicWidget? child;
  @JsonKey(fromJson: WidgetUtil.getPositionalAlignment)
  Alignment? alignment;
  double? widthFactor;
  double? heightFactor;

  DynamicAlign({
    required super.key,
    this.child,
    this.alignment,
    this.heightFactor,
    this.widthFactor,
  });

  factory DynamicAlign.fromJson(Map<String, dynamic> json) =>
      _$DynamicAlignFromJson(json);

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return Align(
        alignment: alignment ?? Alignment.center,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: child!.build(context),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  List<DynamicWidget>? get childWidgets => child != null ? [child!] : [];

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
}
