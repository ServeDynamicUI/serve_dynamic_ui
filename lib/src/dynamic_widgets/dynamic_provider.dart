import 'dart:async';

import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/view.dart';

import 'dynamic_widget.dart';

///[DynamicProvider] : helps to provide state management in app among dynamic widgets.
class DynamicProvider extends DynamicWidget {
  final Map<String, dynamic> _stateCache;

  Map<String?, dynamic> get stateCache => _stateCache;

  final Map<String, dynamic> _controllerCache;

  Map<String?, dynamic> get controllerCache => _controllerCache;

  final DynamicWidget? child;

  DynamicProvider(
    this.child, {
    String key = '',
    Map<String, dynamic>? stateCache,
    Map<String, dynamic>? controllerCache,
  })  : _stateCache = stateCache ?? <String, dynamic>{},
        _controllerCache = controllerCache ?? <String, dynamic>{},
        super(key: key) {
    child?.parent = this;
  }

  @override
  Widget build(BuildContext context) {
    return DynamicView(
      child: child,
    );
  }

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  List<DynamicWidget>? get childWidgets => [if (child != null) child!];

  @override
  void postBuild() {

  }

  @override
  void preBuild() {

  }
}
