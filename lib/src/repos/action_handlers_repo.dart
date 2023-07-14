import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

///regex for various actions
final RegExp moveToScreen = RegExp(r'(^/?moveToScreen/?$)');
final RegExp form = RegExp(r'(^/?form/?$)');
final RegExp updateWidget = RegExp(r'(^/?updateWidget/?$)');

///[ActionHandlersRepo] : helps to register an action handler and handle task.
class ActionHandlersRepo {
  static final Map<RegExp, ActionHandler> _handlers = {};

  ///registers a handler
  static void _registerHandler(RegExp type, ActionHandler handler) {
    _handlers[type] = handler;
  }

  ///registers all handlers present in the map
  static void _registerHandlers(Map<RegExp, ActionHandler> actionHandlers) {
    _handlers.addAll(actionHandlers);
  }

  ///to initialize custom and predefined action handlers
  static void init({Map<RegExp, ActionHandler>? actionHandlers}) {
    _registerHandler(moveToScreen, MoveToScreenActorHandler());
    _registerHandler(form, FormActionHandler());
    _registerHandler(updateWidget, UpdateWidgetActionHandler());
    if (actionHandlers != null) {
      _registerHandlers(actionHandlers);
    }
  }

  ///tries to get an action handler to handle a specific handle.
  static void handle(ActionDTO? actionDTO, DynamicWidget widget,
      BuildContext context, OnHandledAction? onHandledAction) {
    if(actionDTO == null){
      return;
    }
    bool hasMatched = false;
    if (actionDTO.actionString != null) {
      Uri action = Uri.parse(actionDTO.actionString!);
      _handlers.forEach((key, handler) {
        if (!hasMatched) {
          if (key.hasMatch(action.path)) {
            Map<String, dynamic> extras = {Strings.widget: widget};
            if (actionDTO.extras != null) {
              extras.addAll(actionDTO.extras!);
            }
            handler.handleAction(context, action, extras, onHandledAction);
            hasMatched = true;
          }
        }
      });
    }
  }
}
