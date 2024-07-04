import 'package:flutter/material.dart';

class DynamicScaffoldLifecycleWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onDispose;
  final VoidCallback? onInit;
  const DynamicScaffoldLifecycleWidget(
      {super.key, required this.child, this.onDispose, this.onInit});

  @override
  State<DynamicScaffoldLifecycleWidget> createState() =>
      _DynamicScaffoldLifecycleWidgetState();
}

class _DynamicScaffoldLifecycleWidgetState
    extends State<DynamicScaffoldLifecycleWidget> {
  @override
  void initState() {
    widget.onInit?.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.onDispose?.call();
    super.dispose();
  }
}
