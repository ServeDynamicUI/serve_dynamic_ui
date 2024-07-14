import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:serve_dynamic_ui/src/db/daos/cached_page_dao.dart';
import 'package:serve_dynamic_ui/src/db/entities/page_entity.dart';
import 'package:serve_dynamic_ui/src/db/providers/serve_dynamic_ui_database_provider.dart';
import 'package:flutter/material.dart';

///[NetworkPageStatusEvent] parent class of all status events.
abstract class NetworkPageStatusEvent {}

class NetworkPagePendingStatusEvent extends NetworkPageStatusEvent {
  final Map<String, dynamic>? pageResponse;
  NetworkPagePendingStatusEvent({this.pageResponse});
}

class NetworkPageFailureStatusEvent extends NetworkPageStatusEvent {
  final Exception error;
  NetworkPageFailureStatusEvent(this.error);
}

class NetworkPageSuccessStatusEvent extends NetworkPageStatusEvent {
  final Map<String, dynamic>? pageResponse;
  NetworkPageSuccessStatusEvent(this.pageResponse);
}

///[NetworkBuilderState] state class which handles dynamic network page state change tasks
class NetworkBuilderState implements DataEventListener {
  final DynamicRequest request;

  NetworkBuilderState(this.request);

  ///notifier which notifies about status
  final ValueNotifier<NetworkPageStatusEvent> networkPageStatusNotifier =
      ValueNotifier(NetworkPagePendingStatusEvent());

  List<String> pageRefreshEventList = [];
  bool get isPageCacheEnabled => request.isPageCacheEnabled;

  CancelToken? _cancelToken;

  Map<String, dynamic>? _cachedPageJson;

  bool isPageRefreshEventsAdded = false;

  ///reload to fetch updated json from network
  void reload() {
    fetchPage();
  }

  /// will be called to fetch the json from network
  void fetchPage() async {
    try {
      debugPrint('isPageCacheEnabled: $isPageCacheEnabled');
      networkPageStatusNotifier.value =
          NetworkPagePendingStatusEvent(pageResponse: _cachedPageJson);
      await Future.delayed(const Duration(milliseconds: 500));
      if (isPageCacheEnabled) {
        bool pageDeletedFromDB =
            await DbUtil.deleteCachedPageIfOlderThanSetCacheTime(
                _getPageKeyFromUrl());
        if (!pageDeletedFromDB) {
          await _loadPageFromDB();
        } else {
          _cachedPageJson = null;
          networkPageStatusNotifier.value =
              NetworkPagePendingStatusEvent(pageResponse: null);
          // await Future.delayed(Duration(milliseconds: 500));
        }
      }
      await _loadPageFromNetwork();
      if (!isPageRefreshEventsAdded) {
        initScreenEventsIfAny(_cachedPageJson);
      }
    } on Exception catch (e) {
      bool fetchedFromDB = await _loadPageFromDB();
      if (!fetchedFromDB) {
        networkPageStatusNotifier.value = NetworkPageFailureStatusEvent(e);
        debugPrint('Unable to fetch from network');
      } else {
        networkPageStatusNotifier.value =
            NetworkPageSuccessStatusEvent(_cachedPageJson);
        debugPrint('Loading page from db due to error.');
      }
    } finally {
      _cancelToken = null;
      request.cancelToken = null;
    }
  }

  Future<bool> _loadPageFromDB() async {
    try {
      if (isPageCacheEnabled) {
        if (_cachedPageJson == null) {
          PageEntity? cachedPageEntity = await _getPageDataFromDB();
          if (Util.isValid(cachedPageEntity)) {
            _cachedPageJson = jsonDecode((cachedPageEntity!.page));
            debugPrint('Loaded page from db');
          }
        }
        networkPageStatusNotifier.value =
            NetworkPagePendingStatusEvent(pageResponse: _cachedPageJson);
      }
      return _cachedPageJson != null;
    } catch (e) {
      debugPrint("Unable to fetch page from DB");
      return false;
    }
  }

  Future<void> _loadPageFromNetwork() async {
    try {
      _cancelToken = CancelToken();
      request.cancelToken = _cancelToken;
      Response? pageResponse = await NetworkHandler.getJsonFromRequest(request);
      String pageDataString = pageResponse!.data.toString();
      if (pageResponse.data is Map) {
        _cachedPageJson = pageResponse.data;
      } else {
        _cachedPageJson = jsonDecode(pageDataString);
      }
      _insertPageInDBIfEnabled(pageDataString, _cachedPageJson);
      networkPageStatusNotifier.value =
          NetworkPageSuccessStatusEvent(_cachedPageJson);
    } catch (e) {
      debugPrint('Error ${e.toString()}');
    }
  }

  void _insertPageInDBIfEnabled(
      String pageDataString, Map<String, dynamic>? pageResponseJson) async {
    if (isPageCacheEnabled) {
      CachedPageDao serveDynamicUIDatabase =
          await ServeDynamicUIDatabaseProvider.instance.database;
      serveDynamicUIDatabase.insertCachedPage(PageEntity(_getPageKeyFromUrl(),
          pageDataString, DateTime.now().millisecondsSinceEpoch));
    }
  }

  Future<PageEntity?> _getPageDataFromDB() async {
    CachedPageDao serveDynamicUIDatabase =
        await ServeDynamicUIDatabaseProvider.instance.database;
    return await serveDynamicUIDatabase
        .findCachedPageByPageKey(_getPageKeyFromUrl());
  }

  String _getPageKeyFromUrl() {
    String url = request.url;
    var bytes = utf8.encode(url);
    return sha256.convert(bytes).toString();
  }

  /// initialize the screen events coming from json
  void initScreenEventsIfAny(Map<String, dynamic>? screenJson) {
    if (Util.isValidList<dynamic>(
        screenJson?[Strings.data][Strings.pageRefreshEvents])) {
      List<String> eventList =
          screenJson?[Strings.data][Strings.pageRefreshEvents].cast<String>();
      pageRefreshEventList = eventList;
      for (var event in pageRefreshEventList) {
        debugPrint('adding data event listener for $event');
        DataEventListeners.addDataEventListener(event, this);
      }
      isPageRefreshEventsAdded = true;
    }
  }

  /// cancels any ongoing request with cancelToken
  void cancelNetworkPageRequest() {
    if (Util.isValid(_cancelToken) && _cancelToken!.isCancelled) {
      _cancelToken!.cancel();
    }
  }

  ///dispose the resources.
  void onDispose() {
    cancelNetworkPageRequest();
    disposeScreenEventsIfAny();
  }

  void disposeScreenEventsIfAny() {
    for (var event in pageRefreshEventList) {
      debugPrint('removing data event listener for $event');
      DataEventListeners.removeDataEventListener(event, this);
    }
    isPageRefreshEventsAdded = false;
  }

  /// this will help to reload the page(dy_scaffold)
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
