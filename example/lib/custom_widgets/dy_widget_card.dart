import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_widget_card.g.dart';

///[DynamicWidgetCard] : just a custom widget extending [DynamicWidget] to show custom widgets.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicWidgetCard extends DynamicWidget {
  DynamicWidget? prefixImage;
  DynamicWidget? body;
  double? elevation;
  double? borderRadius;
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? margin;
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? padding;
  ActionDTO? action;

  DynamicWidgetCard({
    required String key,
    this.prefixImage,
    this.body,
    this.elevation,
    this.borderRadius,
    this.margin,
    this.padding,
    this.action,
    super.height,
    super.width,
  }) : super(
          key: key,
        );

  factory DynamicWidgetCard.fromJson(Map<String, dynamic> json) =>
      _$DynamicWidgetCardFromJson(json);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      ///just long press on the card.
      onLongPress: () {
        if (action != null) {
          ActionHandlersRepo.handle(action, this, context, (value) {
            debugPrint(value);
          });
        }
      },
      child: Card(
        elevation: elevation,
        margin: margin ?? EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: Container(
          height: height,
          width: width,
          padding: padding ?? EdgeInsets.zero,
          child: Row(
            children: [
              if (prefixImage != null) prefixImage!.build(context),
              if (body != null) body!.build(context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  List<DynamicWidget>? get childWidgets => WidgetUtil.childrenFilter([prefixImage, body]);

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  void postBuild() {

  }

  @override
  void preBuild() {

  }
}
