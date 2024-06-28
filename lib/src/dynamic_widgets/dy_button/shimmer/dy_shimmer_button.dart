import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_shimmer_button.g.dart';

/// [DynamicShimmerButton] : A dynamic widget that extends [DynamicButton] and adds a shimmer effect.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicShimmerButton extends DynamicButton {
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shimmerBaseColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shimmerHighlightColor;

  DynamicShimmerButton({
    required super.key,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    super.width,
    super.height,
    super.buttonBorderRadius,
  });

  factory DynamicShimmerButton.fromJson(Map<String, dynamic> json) =>
      _$DynamicShimmerButtonFromJson(json);

  @override
  Widget build(BuildContext context) {
    Widget buttonContent = Container(
      decoration: BoxDecoration(
        color: shimmerBaseColor ?? Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(
            buttonBorderRadius ?? 0,
          ),
        ),
      ),
      height: height,
      width: width,
    );

    return Shimmer.fromColors(
      baseColor: shimmerBaseColor ?? Colors.grey,
      highlightColor: shimmerHighlightColor ?? Colors.white,
      child: buttonContent,
    );
  }

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  void postBuild() {

  }

  @override
  void preBuild() {

  }
}
