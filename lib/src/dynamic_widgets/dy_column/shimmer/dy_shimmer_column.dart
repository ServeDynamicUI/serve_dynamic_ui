import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_shimmer_column.g.dart';

///[DynamicShimmerColumn] : A dynamic column that renders its child widgets in a vertical direction.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicShimmerColumn extends DynamicWidget {
  int itemCount;
  List<DynamicWidget>? childItems;
  @JsonKey(fromJson: WidgetUtil.getMainAxisAlignment)
  MainAxisAlignment? mainAxisAlignment;
  @JsonKey(fromJson: WidgetUtil.getCrossAxisAlignment)
  CrossAxisAlignment? crossAxisAlignment;
  double interItemSpacing;

  DynamicShimmerColumn({
    String? key,
    required this.itemCount,
    required this.childItems,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.interItemSpacing = 10,
    super.height,
    super.width,
  }) : super(
          key: key ?? "",
        );

  factory DynamicShimmerColumn.fromJson(Map<String, dynamic> json) =>
      _$DynamicShimmerColumnFromJson(json);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: WidgetUtil.dynamicWidgetsSpacing(
        context,
        _listView(context),
        interItemSpacing,
        isHorizontal: false,
      ),
    );
  }

  List<DynamicWidget> _listView(BuildContext context) {
    List<DynamicWidget> widgets = [];

    if (itemCount > 0) {
      for (int i = 0; i < itemCount; i++) {
        if(childWidgets != null){
          widgets.addAll(
            childItems!.toList()
          );
        }
      }
    }
    return widgets;
  }

  @override
  List<DynamicWidget>? get childWidgets => [];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}
}
