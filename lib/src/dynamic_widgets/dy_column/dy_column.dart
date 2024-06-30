import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_column.g.dart';

///[DynamicColumn] : A dynamic column that renders its child widgets in a vertical direction.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicColumn extends DynamicWidget {
  List<DynamicWidget>? children;
  @JsonKey(fromJson: WidgetUtil.getMainAxisAlignment)
  MainAxisAlignment? mainAxisAlignment;
  @JsonKey(fromJson: WidgetUtil.getCrossAxisAlignment)
  CrossAxisAlignment? crossAxisAlignment;

  DynamicColumn({
    String? key,
    this.children,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : super(
          key: key ?? "",
        );

  factory DynamicColumn.fromJson(Map<String, dynamic> json) =>
      _$DynamicColumnFromJson(json);

  @override
  Widget build(BuildContext context) {
    List<Widget> childWidgets = [];

    children?.forEach((element) {
      childWidgets.add(LayoutBuilder(builder: (context, _) {
        return element!.build(context);
      }));
    });

    return Column(
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
  void postBuild() {

  }

  @override
  void preBuild() {

  }

  @override
  void onDispose() {
    WidgetUtil.callOnDisposeOnWidgets(children);
  }
}
