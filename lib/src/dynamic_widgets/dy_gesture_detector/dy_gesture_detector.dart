import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_gesture_detector.g.dart';

///[DynamicGestureDetector] : A dynamic widget that helps to perform an action mentioned in [onTapAction], [onDoubleTapAction], [onLongPressAction].
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicGestureDetector extends DynamicWidget {
  DynamicWidget? child;
  ActionDTO? onTapAction;
  ActionDTO? onDoubleTapAction;
  ActionDTO? onLongPressAction;

  DynamicGestureDetector({
    String? key,
    this.child,
    this.onTapAction,
    this.onDoubleTapAction,
    this.onLongPressAction,
  }) : super(
          key: key ?? "",
        );

  factory DynamicGestureDetector.fromJson(Map<String, dynamic> json) =>
      _$DynamicGestureDetectorFromJson(json);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child?.build(context),
      onTap: () {
        ActionHandlersRepo.handle(onTapAction, this, context, (value) {});
      },
      onDoubleTap: () {
        ActionHandlersRepo.handle(onDoubleTapAction, this, context, (value) {});
      },
      onLongPress: () {
        ActionHandlersRepo.handle(onLongPressAction, this, context, (value) {});
      },
    );
  }

  @override
  List<DynamicWidget>? get childWidgets => child == null ? [] : [child!];

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
    WidgetUtil.callOnDisposeOnWidget(child);
  }
}
