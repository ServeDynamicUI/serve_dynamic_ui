import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_shimmer_row.g.dart';

///[DynamicShimmerRow] : A dynamic row that renders its child widgets in a horizontal direction.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicShimmerRow extends DynamicWidget {
  int itemCount;
  List<DynamicWidget>? childItems;
  @JsonKey(fromJson: WidgetUtil.getMainAxisAlignment)
  MainAxisAlignment? mainAxisAlignment;
  @JsonKey(fromJson: WidgetUtil.getCrossAxisAlignment)
  CrossAxisAlignment? crossAxisAlignment;
  double interItemSpacing;

  DynamicShimmerRow({
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

  factory DynamicShimmerRow.fromJson(Map<String, dynamic> json) =>
      _$DynamicShimmerRowFromJson(json);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: WidgetUtil.dynamicWidgetsSpacing(
        context,
        _listView(context),
        interItemSpacing,
        isHorizontal: true,
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
  List<DynamicWidget>? get childWidgets => childItems ?? [];

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
    WidgetUtil.callOnDisposeOnWidgets(childItems);
  }
}
