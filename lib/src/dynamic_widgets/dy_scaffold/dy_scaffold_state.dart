import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

class PageDataEvent {
  List<DynamicWidget>? children;

  PageDataEvent(this.children);
}

class PageInitEvent extends PageDataEvent {
  PageInitEvent(super.children);
}

class PageSuccessEvent extends PageDataEvent {
  PageSuccessEvent(super.children);
}

class PageErrorEvent extends PageDataEvent {
  final String? error;

  PageErrorEvent(super.children, this.error);
}

class PageProgressEvent extends PageDataEvent {
  PageProgressEvent(super.children);
}

class DyScaffoldState extends ScrollListener {
  String? nextUrl;
  DynamicScaffold _parent;
  late bool _isFetchingPageInProgress;
  late ValueNotifier<PageDataEvent> pageDataEventNotifier;
  late ValueNotifier<bool> showPaginatedLoaderOnTopNotifier;

  bool get isFetchingPageInProgress => _isFetchingPageInProgress;

  DyScaffoldState(this.nextUrl, this._parent) {
    DynamicListeners.addListener(_parent.key, this);
    _isFetchingPageInProgress = false;
    pageDataEventNotifier = ValueNotifier(PageSuccessEvent(_parent.children));
    showPaginatedLoaderOnTopNotifier = ValueNotifier(_isFetchingPageInProgress);
  }

  _fetch() async {
    try {
      if (_isFetchingPageInProgress == false &&
          StringUtil.isNotEmptyNorNull(nextUrl)) {
        _isFetchingPageInProgress = true;
        showPaginatedLoaderOnTopNotifier.value = _isFetchingPageInProgress;
        await Future.delayed(const Duration(milliseconds: 500));
        pageDataEventNotifier.value =
            PageProgressEvent(pageDataEventNotifier.value.children);
        Map<String, dynamic> jsonResponse = {};

        if (StringUtil.isUrlAssetPath(nextUrl!)) {
          jsonResponse = await WidgetUtil.loadJson(nextUrl!);
        } else {
          jsonResponse = jsonDecode((await NetworkHandler.getJsonFromRequest(
                DynamicRequest(
                    url: nextUrl!,
                    requestType: RequestType.get,
                    sendTimeout: Duration(seconds: 20),
                    receiveTimeout: Duration(seconds: 20)),
              ))
                  ?.data
                  ?.toString() ??
              '');
        }

        List<DynamicWidget> newChildren = [];

        List<Map<String, dynamic>>? newChildrenMap =
            List.from(jsonResponse['children'] as Iterable<dynamic>);

        for (var child in newChildrenMap) {
          newChildren.add(DynamicWidget.fromJson(child)..parent = _parent);
        }

        if (Util.isValidList<dynamic>(newChildrenMap)) {
          nextUrl = jsonResponse['nextUrl'] ?? '';
        } else {
          nextUrl = '';
        }
        pageDataEventNotifier.value.children?.addAll(newChildren);
        pageDataEventNotifier.value =
            PageSuccessEvent(pageDataEventNotifier.value.children);

        _isFetchingPageInProgress = false;
        showPaginatedLoaderOnTopNotifier.value = _isFetchingPageInProgress;
      }
    } on Error catch (e) {
      pageDataEventNotifier.value =
          PageErrorEvent(pageDataEventNotifier.value.children, e.toString());
    } on Exception catch (e) {
      pageDataEventNotifier.value =
          PageErrorEvent(pageDataEventNotifier.value.children, e.toString());
    } finally {
      _isFetchingPageInProgress = false;
      showPaginatedLoaderOnTopNotifier.value = _isFetchingPageInProgress;
    }
  }

  @override
  void onScrolled(String? widgetKey) {
    debugPrint(
        'dy_scaffold ${_parent.appBar!.pageTitle} onScrolled $widgetKey');
  }

  @override
  void onScrolledToEnd(String? widgetKey) {
    debugPrint(
        'dy_scaffold ${_parent.appBar!.pageTitle}  onScrolledToEnd $widgetKey');
    _fetch();
  }

  @override
  void onScrolledToStart(String? widgetKey) {
    debugPrint(
        'dy_scaffold ${_parent.appBar!.pageTitle}  onScrolledToStart $widgetKey');
  }
}
