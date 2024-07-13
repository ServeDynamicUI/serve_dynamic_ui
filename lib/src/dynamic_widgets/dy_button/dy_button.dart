import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_button.g.dart';

///[DynamicButton] : A dynamic widget that helps to perform any action mentioned in its [action] property in an appealing clickable container.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicButton extends DynamicWidget {
  String key;
  DynamicWidget? child;
  ActionDTO? action;
  ActionDTO? onDoubleTapAction;
  ActionDTO? onLongPressAction;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? buttonColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? buttonBorderColor;
  double? buttonBorderRadius;
  double? borderWidth;
  @JsonKey(fromJson: WidgetUtil.getHeightValueOrInf)
  double? height;
  @JsonKey(fromJson: WidgetUtil.getWidthValueOrInf)
  double? width;
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? margin;
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? padding;

  DynamicButton({
    required this.key,
    this.child,
    this.action,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderWidth,
    this.buttonBorderColor,
    this.buttonBorderRadius,
    this.buttonColor,
    this.onLongPressAction,
    this.onDoubleTapAction,
  }) : super(key: key);

  @override
  List<DynamicWidget>? get childWidgets => child != null ? [child!] : [];

  factory DynamicButton.fromJson(Map<String, dynamic> json) =>
      _$DynamicButtonFromJson(json);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (action != null) {
          ActionHandlersRepo.handle(action!, this, context, (value) {
            debugPrint(value.toString());
          });
        }
      },
      onDoubleTap: () {
        ActionHandlersRepo.handle(onDoubleTapAction, this, context, null);
      },
      onLongPress: () {
        ActionHandlersRepo.handle(onLongPressAction, this, context, null);
      },
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(
            color: buttonBorderColor ?? AppColors.black,
            width: borderWidth ?? 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              buttonBorderRadius ?? 0,
            ),
          ),
        ),
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        child: child?.build(context),
      ),
    );
  }

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
