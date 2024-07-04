import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:serve_dynamic_ui/src/db/database/serve_dynamic_ui_database.dart';
import 'package:serve_dynamic_ui/src/db/entities/PageEntity.dart';
import 'package:serve_dynamic_ui/src/db/providers/ServeDynamicUIDatabseProvider.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dynamic_provider.dart';
import 'package:serve_dynamic_ui/src/listeners/data_event_listener/data_event_listener.dart';
import 'package:serve_dynamic_ui/src/network/index.dart';
import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/src/utils/db_util.dart';

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

class NetworkBuilderState implements DataEventListener {
  final DynamicRequest request;

  NetworkBuilderState(this.request);

  final ValueNotifier<NetworkPageStatusEvent> networkPageStatusNotifier =
      ValueNotifier(NetworkPagePendingStatusEvent());

  List<String> pageRefreshEventList = [];
  bool get isPageCacheEnabled => request.isPageCacheEnabled;

  CancelToken? _cancelToken;

  //this will be set after dynamic provider is created not before
  DynamicProvider? _child;

  Map<String, dynamic>? _cachedPageJson;

  bool isPageRefreshEventsAdded = false;

  void reload() {
    fetchPage();
  }

  void fetchPage() async {
    try {
      debugPrint('isPageCacheEnabled: $isPageCacheEnabled');
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
    _cancelToken = CancelToken();
    request.cancelToken = _cancelToken;
    Response? pageResponse = await NetworkHandler.getJsonFromRequest(request);
    String pageDataString = pageResponse!.data.toString();
    _cachedPageJson = jsonDecode(pageDataString);
    _insertPageInDBIfEnabled(pageDataString, _cachedPageJson);
    networkPageStatusNotifier.value =
        NetworkPageSuccessStatusEvent(_cachedPageJson);
  }

  void _insertPageInDBIfEnabled(
      String pageDataString, Map<String, dynamic>? pageResponseJson) async {
    if (isPageCacheEnabled) {
      ServeDynamicUIDatabase serveDynamicUIDatabase =
          await ServeDynamicUIDatabaseProvider.instance.database;
      serveDynamicUIDatabase.cachedPageDao.insertCachedPage(PageEntity(
          _getPageKeyFromUrl(),
          pageDataString,
          DateTime.now().millisecondsSinceEpoch));
    }
  }

  Future<PageEntity?> _getPageDataFromDB() async {
    ServeDynamicUIDatabase serveDynamicUIDatabase =
        await ServeDynamicUIDatabaseProvider.instance.database;
    return await serveDynamicUIDatabase.cachedPageDao
        .findCachedPageByPageKey(_getPageKeyFromUrl());
  }

  void _deleteCachedPages() async {
    ServeDynamicUIDatabase serveDynamicUIDatabase =
        await ServeDynamicUIDatabaseProvider.instance.database;
    serveDynamicUIDatabase.cachedPageDao.deleteAllCachedPages();
  }

  String _getPageKeyFromUrl() {
    String url = request.url;
    var bytes = utf8.encode(url);
    return sha256.convert(bytes).toString();
  }

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

  void cancelNetworkPageRequest() {
    if (Util.isValid(_cancelToken) && _cancelToken!.isCancelled) {
      _cancelToken!.cancel();
    }
  }

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

  void assignNetworkStateChild(DynamicProvider dyProvider) {
    _child = dyProvider;
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
