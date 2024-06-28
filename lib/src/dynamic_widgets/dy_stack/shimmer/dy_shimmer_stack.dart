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
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shimmerBaseColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shimmerHighlightColor;

  DynamicShimmerStack({
    required super.key,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    super.children,
    super.alignment,
    super.fit,
    super.clipBehavior,
    super.textDirection,
    super.height,
    super.width,
  });

  factory DynamicShimmerStack.fromJson(Map<String, dynamic> json) =>
      _$DynamicShimmerStackFromJson(json);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height ?? MediaQuery.of(context).size.height - 2 * kToolbarHeight,
          width: width ?? double.infinity,
          child: super.build(context),
        ),
        Positioned.fill(
          child: Shimmer.fromColors(
            baseColor: shimmerBaseColor?.withOpacity(0.4) ?? Colors.grey.withOpacity(0.4),
            highlightColor:
                shimmerHighlightColor?.withOpacity(0.4) ?? Colors.white.withOpacity(0.4),
            child: Container(
              width: double.maxFinite,
              color: shimmerBaseColor?.withOpacity(0.4)  ?? Colors.grey.withOpacity(0.4),
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
