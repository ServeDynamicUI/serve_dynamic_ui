import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_shimmer_text.g.dart';

/// [DynamicShimmerText] : A dynamic widget that extends [DynamicText] and adds a shimmer effect.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicShimmerText extends DynamicText {
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shimmerBaseColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shimmerHighlightColor;
  @override
  String? text;
  TextStyleDTO? textStyle;

  DynamicShimmerText(
      {String? key,
      this.shimmerBaseColor,
      this.shimmerHighlightColor,
      super.height,
      super.width,
      super.padding,
      super.margin,
      this.text,
      this.textStyle,
  }): super(key: key ?? "",);

  factory DynamicShimmerText.fromJson(Map<String, dynamic> json) =>
      _$DynamicShimmerCardFromJson(json);

  @override
  Widget build(BuildContext context) {
    if(text == null) return const SizedBox.shrink();

    return Shimmer.fromColors(
      baseColor: shimmerBaseColor ?? Colors.grey[300]!,
      highlightColor: shimmerHighlightColor ?? Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        child: Text(text!, style: textStyle?.textStyle,),
      ),
    );
  }

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}
}
