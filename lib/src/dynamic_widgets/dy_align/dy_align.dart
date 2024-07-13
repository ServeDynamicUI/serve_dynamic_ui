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
  @JsonKey(fromJson: Util.generateRandomString)
  final String key;
  DynamicWidget? child;
  @JsonKey(fromJson: WidgetUtil.getPositionalAlignment)
  Alignment? alignment;
  double? widthFactor;
  double? heightFactor;
  @JsonKey(fromJson: WidgetUtil.getHeightValueOrInf)
  double? height;
  @JsonKey(fromJson: WidgetUtil.getWidthValueOrInf)
  double? width;

  DynamicAlign(
      {required this.key,
      this.child,
      this.alignment,
      this.heightFactor,
      this.widthFactor,
      this.height,
      this.width})
      : super(key: key);

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

  @override
  double? get dyHeight => height;

  @override
  double? get dyWidth => width;
}
