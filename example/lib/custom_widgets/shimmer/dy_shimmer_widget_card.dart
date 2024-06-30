import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_shimmer_widget_card.g.dart';

///[DynamicShimmerWidgetCard] : just a custom widget extending [DynamicWidget] to show custom widgets shimmer effect.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicShimmerWidgetCard extends DynamicWidget {
  DynamicWidget? prefixImage;
  DynamicWidget? body;
  double? elevation;
  double? borderRadius;
  @override
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? margin;
  @override
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? padding;

  DynamicShimmerWidgetCard({
    required super.key,
    this.prefixImage,
    this.body,
    this.elevation,
    this.borderRadius,
    this.margin,
    this.padding,
    super.height,
    super.width,
  });

  factory DynamicShimmerWidgetCard.fromJson(Map<String, dynamic> json) =>
      _$DynamicWidgetCardFromJson(json);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: Colors.grey.shade100,
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
            const SizedBox(width: 10,),
            if (body != null) body!.build(context),
          ],
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

  @override
  void onDispose() {
    prefixImage?.onDispose();
    body?.onDispose();
  }
}
