import 'package:flutter/material.dart';

import 'dynamic_widget.dart';

///view to show dynamic widget.
class DynamicView extends StatelessWidget {
  final Map<String, dynamic>? json;
  final DynamicWidget? child;

  const DynamicView({Key? key, this.json, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DynamicWidget? widget = child;
    if (child == null) {
      widget = DynamicWidget.fromJson(json!);
    }

    return Container(
      child: widget!.build(context),
    );
  }
}
