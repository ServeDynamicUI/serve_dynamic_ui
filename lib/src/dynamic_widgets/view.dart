import 'package:flutter/material.dart';

import 'dynamic_widget.dart';

///view to show dynamic widget.
class DynamicView extends StatelessWidget {
  final Map<String, dynamic>? json;
  final DynamicWidget? child;

  const DynamicView({super.key, this.json, this.child});

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
