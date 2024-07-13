import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:shimmer/shimmer.dart';

part 'dy_shimmer_stack.g.dart';

///[DynamicShimmerStack] : A dynamic widget that holds its child elements and add shimmer effect on top of it.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicShimmerStack extends DynamicStack {
  @JsonKey(fromJson: Util.generateRandomString)
  String key;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shimmerBaseColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shimmerHighlightColor;
  double borderRadius;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? borderColor;
  @JsonKey(defaultValue: 1)
  double borderWidth;

  DynamicShimmerStack({
    required this.key,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    super.children,
    super.alignment,
    super.fit,
    super.clipBehavior,
    super.textDirection,
    super.height,
    super.width,
    this.borderRadius = 0,
    this.borderColor,
    this.borderWidth = 1.0,
    super.padding,
    super.margin,
  }) : super(key: key);

  factory DynamicShimmerStack.fromJson(Map<String, dynamic> json) =>
      _$DynamicShimmerStackFromJson(json);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: super.build(context),
        ),
        Positioned.fill(
          child: Shimmer.fromColors(
            baseColor: shimmerBaseColor?.withOpacity(0.4) ??
                Colors.grey.withOpacity(0.4),
            highlightColor: shimmerHighlightColor?.withOpacity(0.4) ??
                Colors.white.withOpacity(0.4),
            child: Container(
              width: width ?? double.maxFinite,
              padding: padding,
              margin: margin,
              height: height,
              decoration: BoxDecoration(
                color: shimmerBaseColor?.withOpacity(0.4) ??
                    Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(borderRadius),
                border: borderColor != null
                    ? Border.all(color: borderColor!, width: borderWidth)
                    : null,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  List<DynamicWidget>? get childWidgets => children ?? [];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}
}
