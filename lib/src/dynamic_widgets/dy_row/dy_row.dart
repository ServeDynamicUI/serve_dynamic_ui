import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_row.g.dart';

///[DynamicRow] : A dynamic widget that renders its child elements in horizontal direction.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicRow extends DynamicWidget {
  List<DynamicWidget>? children;
  @JsonKey(fromJson: WidgetUtil.getMainAxisAlignment)
  MainAxisAlignment? mainAxisAlignment;
  @JsonKey(fromJson: WidgetUtil.getCrossAxisAlignment)
  CrossAxisAlignment? crossAxisAlignment;
  @JsonKey(fromJson: WidgetUtil.getHeightValueOrInf)
  double? height;
  @JsonKey(fromJson: WidgetUtil.getWidthValueOrInf)
  double? width;
  DynamicRow({
    String? key,
    this.children,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.height,
    this.width,
  }) : super(
          key: key ?? "",
        );

  factory DynamicRow.fromJson(Map<String, dynamic> json) =>
      _$DynamicRowFromJson(json);

  @override
  Widget build(BuildContext context) {
    List<Widget> childWidgets = [];

    children?.forEach((element) {
      childWidgets.add(LayoutBuilder(builder: (context, _) {
        return element!.build(context);
      }));
    });

    return Row(
      key: ValueKey(key),
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: (children == null) ? [] : childWidgets,
    );
  }

  @override
  List<DynamicWidget>? get childWidgets => WidgetUtil.childrenFilter(children);

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
