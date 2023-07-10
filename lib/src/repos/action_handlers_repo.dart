import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

///regex for various actions
final RegExp MOVE_TO_SCREEN = RegExp(r'(^/?moveToScreen/?$)');
final RegExp FORM = RegExp(r'(^/?form/?$)');
final RegExp UPDATE_TO_WIDGET = RegExp(r'(^/?updateWidget/?$)');

///[ActionHandlersRepo] : helps to register an action handler and handle task.
class ActionHandlersRepo {
  static final Map<RegExp, ActionHandler> _handlers = {};

  static void _registerHandler(RegExp type, ActionHandler handler) {
    _handlers[type] = handler;
  }

  static void _registerHandlers(Map<RegExp, ActionHandler> actionHandlers) {
    _handlers.addAll(actionHandlers);
  }

  ///to initialize custom and predefined action handlers
  static void init({Map<RegExp, ActionHandler>? actionHandlers}) {
    _registerHandler(MOVE_TO_SCREEN, MoveToScreenActorHandler());
    _registerHandler(FORM, FormActionHandler());
    _registerHandler(UPDATE_TO_WIDGET, UpdateWidgetActionHandler());
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
