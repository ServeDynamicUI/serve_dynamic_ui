import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dynamic_widget.dart';

part 'dy_sized_box.g.dart';

///[DynamicSizedBox] : A dynamic widget that creates fixed sized box based on given [width] and [height].
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicSizedBox extends DynamicWidget {
  double? height;
  double? width;
  DynamicWidget? child;

  DynamicSizedBox({
    String? key,
    this.height,
    this.width,
    this.child,
  }) : super(
          key: key ?? "",
        );

  factory DynamicSizedBox.fromJson(Map<String, dynamic> json) =>
      _$DynamicSizedBoxFromJson(json);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height != null
          ? ((height! < 0) ? MediaQuery.of(context).size.height : height)
          : null,
      width: width != null
          ? ((width! < 0) ? MediaQuery.of(context).size.width : width)
          : null,
      child: child != null
          ? LayoutBuilder(builder: (context, _) {
              return child!.build(
                context,
              );
            })
          : null,
    );
  }

  @override
  List<DynamicWidget>? get childWidgets => child == null ? [] : [child!];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  void postBuild() {

  }

  @override
  void preBuild() {

  }
}
