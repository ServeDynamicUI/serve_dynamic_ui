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
  final String key;

  double? get dyHeight;

  double? get dyWidth;

  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? margin;
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? padding;

  @JsonKey(includeFromJson: false, includeToJson: false)
  DynamicWidget? parent;

  DynamicWidget({
    required this.key,
    this.parent,
    this.margin,
    this.padding,
  });

  ///helps to build in-built flutter widget.
  Widget build(BuildContext context);

  ///called build build is invoked
  void preBuild();

  void postBuild();

  ///called on widgets which are being disposed
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
        return DynamicContainer(
            width: 0.0, showBorder: false, key: 'failed_container_key');
      }
    } catch (e) {
      debugPrint(
          'failed to create dynamic widget  ${json[Strings.type]} ${json[Strings.data][Strings.key]}');
      return DynamicContainer(
          width: 0.0, showBorder: false, key: 'exception_container_key');
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
