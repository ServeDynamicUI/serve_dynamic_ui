import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/src/constants/index.dart';
import 'package:serve_dynamic_ui/src/listeners/data_event_listener/data_event_listener.dart';
import '../../handlers/index.dart';

/// An action handler that handles the incoming data event to pass to specific event id listeners.
class DataEventHandler extends ActionHandler {
  ///handles the incoming data event.
  @override
  void handleAction(BuildContext? context, Uri action,
      Map<String, dynamic>? extras, OnHandledAction? onHandledAction) {
    if (extras != null && extras.containsKey(Strings.dataEventId)) {
      String dataEventId = extras[Strings.dataEventId];
      dynamic data = extras[Strings.data];

      Map<String, dynamic> dataMap = {};

      //decode from json string
      if (data is String) {
        dataMap = jsonDecode(data);
      } else {
        dataMap = data ?? {};
      }

      DataEventListeners.callOnDataEvent(dataEventId, dataMap);
    }
  }
}
