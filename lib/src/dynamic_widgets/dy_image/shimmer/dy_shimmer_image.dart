import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_shimmer_image.g.dart';

/// [DynamicShimmerImage] : A dynamic widget that extends [DynamicWidget] and adds a shimmer effect over placeholder image.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicShimmerImage extends DynamicWidget {
  String placeholderImagePath;
  @JsonKey(fromJson: WidgetUtil.getBoxFit)
  BoxFit? fit;
  double? clipBorderRadius;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shimmerBaseColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shimmerHighlightColor;

  DynamicShimmerImage({
    required super.key,
    required this.placeholderImagePath,
    super.width,
    super.height,
    this.fit,
    this.clipBorderRadius,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
  });

  factory DynamicShimmerImage.fromJson(Map<String, dynamic> json) =>
      _$DynamicShimmerImageFromJson(json);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(clipBorderRadius ?? 0),
        child: Stack(
          children: [
            Image.asset(
              placeholderImagePath,
              fit: fit ?? BoxFit.cover,
              width:  width ?? 300,
              height: height ?? 200,
            ),
            // Shimmer overlay
            Shimmer.fromColors(
              baseColor: shimmerBaseColor ?? Colors.transparent,
              highlightColor: shimmerHighlightColor ?? Colors.white.withOpacity(0.5),
              child: Container(
                width:  width,
                height: height,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(clipBorderRadius ?? 0)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  List<DynamicWidget>? get childWidgets => null;

  @override
  void postBuild() {}

  @override
  void preBuild() {}
}
