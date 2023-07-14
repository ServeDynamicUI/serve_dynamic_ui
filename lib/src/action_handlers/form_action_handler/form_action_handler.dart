
import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/src/constants/index.dart';

import '../../dynamic_widgets/index.dart';
import '../../handlers/index.dart';
import '../../resolvers/index.dart';

/// An action handler that gets the form input values in a page.
class FormActionHandler extends ActionHandler {

  ///handles the form action and processing the input data.
  @override
  void handleAction(
      BuildContext? context, Uri action, Map<String, dynamic>? extras, OnHandledAction? onHandledAction) {
    if (extras != null && extras.containsKey(Strings.widget)) {
      DynamicWidget widget = extras[Strings.widget];
      FormWidget? formWidget =
          WidgetResolver.getTopAncestorOfType<FormWidget>(widget);
      if (formWidget?.validate() ?? false) {
        onHandledAction?.call(formWidget?.getValues());
      }
      else{
        onHandledAction?.call(Strings.invalidInputValues);
      }
    }
  }
}
