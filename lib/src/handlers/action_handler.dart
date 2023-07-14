import 'package:flutter/material.dart';

///[OnHandledAction] : callback when an action handler is done performing action and return back some data.
typedef OnHandledAction = void Function(dynamic value);

///[ActionHandler] : an abstract class that helps to handle actions.
abstract class ActionHandler {
  ///method to handle the action.
  void handleAction(BuildContext? context, Uri action,
      Map<String, dynamic>? extras, OnHandledAction? onHandledAction) async {}
}
