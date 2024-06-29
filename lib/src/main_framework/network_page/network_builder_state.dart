import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:serve_dynamic_ui/src/listeners/data_event_listener/data_event_listener.dart';
import 'package:serve_dynamic_ui/src/network/index.dart';
import 'package:flutter/material.dart';

abstract class NetworkPageStatusEvent {}

class NetworkPagePendingStatusEvent extends NetworkPageStatusEvent {}

class NetworkPageFailureStatusEvent extends NetworkPageStatusEvent {
  final Exception error;
  NetworkPageFailureStatusEvent(this.error);
}

class NetworkPageSuccessStatusEvent extends NetworkPageStatusEvent {
  final Map<String, dynamic>? pageResponse;
  NetworkPageSuccessStatusEvent(this.pageResponse);
}

class NetworkBuilderState implements DataEventListener{
  final DynamicRequest request;
  
  NetworkBuilderState(this.request);
  
  final ValueNotifier<NetworkPageStatusEvent> networkPageStatusNotifier = ValueNotifier(NetworkPagePendingStatusEvent());

  List<String> pageRefreshEventList = [];

  void reload(){
    fetchPage();
  }
  
  void fetchPage() async{
    try {
      networkPageStatusNotifier.value = NetworkPagePendingStatusEvent();
      Response? pageResponse = await NetworkHandler.getJsonFromRequest(request);
      Map<String, dynamic>? pageResponseJson = jsonDecode(pageResponse!.data.toString());
      networkPageStatusNotifier.value = NetworkPageSuccessStatusEvent(pageResponseJson);
    } on Exception catch(e){
      networkPageStatusNotifier.value = NetworkPageFailureStatusEvent(e);
      debugPrint("Unable to load page $e");
    }
  }

  void initScreenEventsIfAny(Map<String, dynamic>? screenJson) {
    if (Util.isValidList<dynamic>(screenJson?[Strings.data][Strings.pageRefreshEvents])) {
      List<String> eventList = screenJson?[Strings.data][Strings.pageRefreshEvents].cast<String>();
      pageRefreshEventList = eventList;
      for (var event in pageRefreshEventList) {
        debugPrint('adding data event listener for $event');
        DataEventListeners.addDataEventListener(event, this);
      }
    }
  }

  void disposeScreenEventsIfAny() {
    for (var event in pageRefreshEventList) {
      debugPrint('removing data event listener for $event');
      DataEventListeners.removeDataEventListener(event, this);
    }
  }

  @override
  void onDataEvent(String dataEventKey, Map<String, dynamic> data) {
    switch (dataEventKey) {
      case 'RELOAD':
        debugPrint('Key: $dataEventKey , Data: $data');
        reload();
        break;
      default:
    }
  }
}