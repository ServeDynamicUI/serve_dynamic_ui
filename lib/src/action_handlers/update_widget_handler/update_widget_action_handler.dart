import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

/// An action handler that helps you update a dynamic widget based on the widget key.
class UpdateWidgetActionHandler extends ActionHandler {
  ///action to update the widget based on the passed key.
  @override
  void handleAction(BuildContext? context, Uri action,
      Map<String, dynamic>? extras, OnHandledAction? onHandledAction) {
    if (extras != null) {
      String widgetKey = extras[Strings.widgetKey];
      DynamicWidget widget = extras[Strings.widget];
      DynamicWidget? screenWidget = WidgetResolver.getRoot(widget);

      if (screenWidget != null) {
        String methodName = extras[Strings.methodName];
        Map<String, dynamic>? params = extras[Strings.params];
        DynamicWidget? updateWidget =
            WidgetResolver.getWidgetByKey(screenWidget, widgetKey);
        updateWidget?.invokeMethod(methodName, params: params);
      }
    }
  }
}
