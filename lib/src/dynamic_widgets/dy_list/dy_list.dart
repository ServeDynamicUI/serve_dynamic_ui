import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'list_view_widget.dart';

part 'dy_list.g.dart';

///[DynamicList] : a dynamic widget that renders its child elements in vertical or horizontal direction in an efficient manner.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicList extends DynamicWidget {
  bool isVertical;
  bool isScrollable;
  bool shrinkWrap;
  List<DynamicWidget>? listItems;
  DynamicWidget? separator;
  @JsonKey(fromJson: WidgetUtil.getHeightValueOrInf)
  double? height;
  @JsonKey(fromJson: WidgetUtil.getWidthValueOrInf)
  double? width;

  DynamicList(
      {required super.key,
      this.isVertical = true,
      this.listItems,
      this.separator,
      this.shrinkWrap = false,
      this.isScrollable = true,
        this.height,
        this.width,
      });

  factory DynamicList.fromJson(Map<String, dynamic> json) =>
      _$DynamicListFromJson(json);

  @override
  Widget build(BuildContext context) {
    if (listItems == null || listItems!.isEmpty) {
      return const SizedBox.shrink();
    }
    return ListViewWidget(
      isVertical: isVertical,
      shrinkWrap: shrinkWrap,
      listItems: listItems,
      separator: separator,
      isScrollable: isScrollable,
      key: ValueKey(key),
    );
  }

  @override
  List<DynamicWidget>? get childWidgets => listItems ?? [];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  void postBuild() {}

  @override
  void preBuild() {}

  @override
  void onDispose() {
    WidgetUtil.callOnDisposeOnWidgets(listItems);
  }

  @override
  double? get dyHeight => height;

  @override
  double? get dyWidth => width;
}
