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
  final Exception? error;
  PageErrorEvent(super.children, this.error);
}

class PageProgressEvent extends PageDataEvent {
  PageProgressEvent(super.children);
}

class DyScaffoldState extends ScrollListener{
  String? nextUrl;
  DynamicWidget _parent;
  late bool _isFetchingPageInProgress;
  late ValueNotifier<PageDataEvent> pageDataEventNotifier;

  bool get isFetchingPageInProgress => _isFetchingPageInProgress;

  DyScaffoldState(this.nextUrl, this._parent){
    DynamicListeners.addListener(this);
    _isFetchingPageInProgress = false;
    pageDataEventNotifier = ValueNotifier(PageSuccessEvent(_parent.childWidgets));
  }


  _fetch() async{
    try{
      if(_isFetchingPageInProgress == false && nextUrl != null){
        _isFetchingPageInProgress = true;
        pageDataEventNotifier.value = PageProgressEvent(pageDataEventNotifier.value.children);
        Map<String, dynamic> jsonResponse = {};

        if(StringUtil.isUrlAssetPath(nextUrl!)){
          jsonResponse = await WidgetUtil.loadJson(nextUrl!);
        }
        else{
          jsonResponse = jsonDecode(
              (await NetworkHandler.getJsonFromRequest(
                  DynamicRequest(url: nextUrl!, requestType: RequestType.get)
              )
              )?.data?.toString() ?? '');
        }

        List<DynamicWidget> newChildren = [];

        List<Map<String, dynamic>>? newChildrenMap = List.from(jsonResponse['children'] as Iterable<dynamic>);

        for (var child in newChildrenMap) {
          newChildren.add(DynamicWidget.fromJson(child)..parent = _parent);
        }

        nextUrl = jsonResponse['nextUrl'] ?? '';
        pageDataEventNotifier.value.children?.addAll(newChildren);
        pageDataEventNotifier.value = PageSuccessEvent(pageDataEventNotifier.value.children);

        _isFetchingPageInProgress = false;
      }
    } on Exception catch(e){
      _isFetchingPageInProgress = false;
      pageDataEventNotifier.value = PageErrorEvent(pageDataEventNotifier.value.children, e);
    }
  }

  @override
  void onScrolled(String? widgetKey) {
    debugPrint('dy_scaffold onScrolled $widgetKey');
  }

  @override
  void onScrolledToEnd(String? widgetKey) {
    debugPrint('dy_scaffold onScrolledToEnd $widgetKey');
    _fetch();
  }

  @override
  void onScrolledToStart(String? widgetKey) {
    debugPrint('dy_scaffold onScrolledToStart $widgetKey');
  }
}