import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

///[SnackBarActionHandler] : handler that shows you can extend from [ActionHandler] and create your own actions.
class SnackBarActionHandler extends ActionHandler {
  @override
  void handleAction(BuildContext? context, Uri action,
      Map<String, dynamic>? extras, OnHandledAction? onHandledAction) {
    if (context?.mounted ?? false) {
      String cardTitle = extras?['title'];
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          content: Text('This is a $cardTitle'),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.only(bottom: 16),
        ),
      );
      onHandledAction?.call('displayed');
    }
  }
}
