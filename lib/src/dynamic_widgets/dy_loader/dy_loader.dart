import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_loader.g.dart';

///[DynamicLoader] : A dynamic widget that shows loader widget.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicLoader extends DynamicWidget {
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? backgroundColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? color;
  @JsonKey(fromJson: WidgetUtil.getMainAxisAlignment)
  MainAxisAlignment mainAxisAlignment;
  @JsonKey(fromJson: WidgetUtil.getCrossAxisAlignment)
  CrossAxisAlignment crossAxisAlignment;
  String loadingText;
  TextStyleDTO? style;
  double? value;
  double strokeWidth;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? containerColor;
  double? containerColorOpacity;
  @JsonKey(fromJson: WidgetUtil.getValueOrInf)
  double? containerWidth;
  @JsonKey(fromJson: WidgetUtil.getValueOrInf)
  double? containerHeight;

  DynamicLoader({
    String? key,
    this.backgroundColor,
    this.color,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.loadingText = 'Loading',
    this.style,
    this.value,
    this.strokeWidth = 4.0,
    this.containerColor,
    this.containerColorOpacity,
    this.containerHeight,
    this.containerWidth,
  }) : super(
    key: key ?? "",
  );

  factory DynamicLoader.fromJson(Map<String, dynamic> json) =>
      _$DynamicLoaderFromJson(json);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: containerColor?.withOpacity(containerColorOpacity ?? 1),
      height: containerHeight,
      width: containerWidth,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          CircularProgressIndicator(
            backgroundColor: backgroundColor,
            color: color,
            value: value,
            strokeWidth: strokeWidth,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            loadingText,
            style: style?.textStyle ?? const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  @override
  List<DynamicWidget>? get childWidgets => [];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}
}
