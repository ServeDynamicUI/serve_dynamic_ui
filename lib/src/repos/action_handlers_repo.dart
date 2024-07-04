import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

///regex for various actions
final RegExp moveToScreen = RegExp(r'(^/?moveToScreen/?$)');
final RegExp form = RegExp(r'(^/?form/?$)');
final RegExp updateWidget = RegExp(r'(^/?updateWidget/?$)');
final RegExp dataEventHook = RegExp(r'(^/?dataEventHook/?$)');

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
    _registerHandler(dataEventHook, DataEventHandler());
    if (actionHandlers != null) {
      _registerHandlers(actionHandlers);
    }
  }

  ///tries to get an action handler to handle a specific handle.
  static void handle(ActionDTO? actionDTO, DynamicWidget widget,
      BuildContext context, OnHandledAction? onHandledAction) {
    if (actionDTO == null) {
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
            _popVisibleScreen(context, action);
            handler.handleAction(context, action, extras, onHandledAction);
            hasMatched = true;
          }
        }
      });
    }
  }

  static void _popVisibleScreen(BuildContext context, Uri uri) {
    if (uri.queryParameters.containsKey(Strings.popAndNavigateStrategy)) {
      String? popStrategy = uri.queryParameters[Strings.popAndNavigateStrategy];
      if (popStrategy == PopAndNavigateStrategy.popToRoot.name) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      } else if (popStrategy == PopAndNavigateStrategy.popCurrent.name) {
        Navigator.pop(context, null);
      } else if (popStrategy == PopAndNavigateStrategy.popUntilScreen.name) {
        String? screenName = uri.queryParameters[Strings.screenName];
        if (StringUtil.isNotEmptyNorNull(screenName)) {
          Navigator.of(context).popUntil(ModalRoute.withName(screenName!));
        }
      }
    }
  }
}
