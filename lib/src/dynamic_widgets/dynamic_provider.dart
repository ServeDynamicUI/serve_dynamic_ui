import 'dart:async';

import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_scaffold/index.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/view.dart';

import 'dynamic_widget.dart';

///[DynamicProvider] : helps to provide state management in app among dynamic widgets.
class DynamicProvider extends DynamicWidget {
  final Map<String, dynamic> _stateCache;

  Map<String?, dynamic> get stateCache => _stateCache;

  final Map<String, dynamic> _controllerCache;

  Map<String?, dynamic> get controllerCache => _controllerCache;

  final DynamicScaffold? child;

  DynamicProvider(
    this.child, {
    super.key = '',
    Map<String, dynamic>? stateCache,
    Map<String, dynamic>? controllerCache,
  })  : _stateCache = stateCache ?? <String, dynamic>{},
        _controllerCache = controllerCache ?? <String, dynamic>{} {
    child?.parent = this;
  }

  @override
  Widget build(BuildContext context) {
    if (child is DynamicScaffold) {
      return DynamicView(
        child: child,
      );
    }
    return const SizedBox.shrink();
  }

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  List<DynamicWidget>? get childWidgets => [if (child != null) child!];

  @override
  void postBuild() {}

  @override
  void preBuild() {}

  void deleteStateByKey(String key) {
    _stateCache.remove(key);
  }

  void deleteControllerByKey(String key) {
    _stateCache.remove(key);
  }

  @override
  void onDispose() {}
}
