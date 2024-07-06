import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

///[DynamicWidget] : an abstract class that helps to create a dynamic widget from json.
@JsonSerializable(
  createToJson: false,
  createFactory: false,
)
abstract class DynamicWidget {
  @JsonKey(required: true)
  final String key;

  @JsonKey(required: false)
  final double? height;

  @JsonKey(required: false, fromJson: WidgetUtil.getValueOrInf)
  final double? width;

  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? margin;
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? padding;

  @JsonKey(includeFromJson: false, includeToJson: false)
  DynamicWidget? parent;

  DynamicWidget({
    required this.key,
    this.parent,
    this.height,
    this.width,
    this.margin,
    this.padding,
  });

  ///helps to build in-built flutter widget.
  Widget build(BuildContext context);

  void preBuild();

  void postBuild();

  void onDispose();

  ///this factory constructor takes the json and creates a dynamic widget and its sub children.
  factory DynamicWidget.fromJson(Map<String, dynamic> json) {
    try {
      String type = json[Strings.type];
      DynamicWidgetHandler? dynamicWidgetHandler =
          DynamicWidgetHandlerRepo.getDynamicWidgetHandlerForType(type);
      if (dynamicWidgetHandler != null && json.containsKey(Strings.data)) {
        DynamicWidget widget = dynamicWidgetHandler(json[Strings.data]);
        List<DynamicWidget?>? children = widget.childWidgets;
        children?.forEach((element) {
          element?.parent = widget;
        });
        widget.preBuild();
        return widget;
      } else {
        debugPrint(
            'failed to create dynamic widget ${json[Strings.type]} ${json[Strings.data][Strings.key]}');
        return DynamicContainer(width: 0.0, showBorder: false);
      }
    } catch (e) {
      debugPrint(
          'failed to create dynamic widget  ${json[Strings.type]} ${json[Strings.data][Strings.key]}');
      return DynamicContainer(width: 0.0, showBorder: false);
    }
  }

  ///used to invoke methods in a dynamic widget
  FutureOr<dynamic> invokeMethod(
    String methodName, {
    Map<String, dynamic>? params,
  });

  ///list of children under this instance.
  List<DynamicWidget>? get childWidgets;
}
