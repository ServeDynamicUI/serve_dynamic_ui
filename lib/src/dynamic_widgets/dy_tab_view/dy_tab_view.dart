import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_tab_view/single_tab_view.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_tab_view/tab_index_state.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_tab_view/tab_view.dart';

part 'dy_tab_view.g.dart';

///[DynamicTabView] : A dynamic widget that allows you to create a set of tabs with corresponding content views.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicTabView extends DynamicWidget {
  @JsonKey(defaultValue: 0)
  final int selectedTabIndex;
  @JsonKey(fromJson: WidgetUtil.getColor)
  final Color? indicatorColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  final Color? labelColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  final Color? unselectedLabelColor;
  final List<TabDTO>? tabs;
  @JsonKey(fromJson: WidgetUtil.getColor)
  final Color? tabsBackgroundColor;
  @JsonKey(defaultValue: 8)
  final double cornerRadius;
  @JsonKey(defaultValue: false)
  final bool wantKeepAlive;
  @JsonKey(includeFromJson: false, includeToJson: false)
  TabView? tabview;

  DynamicTabView({
    required super.key,
    required this.selectedTabIndex,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.tabs,
    this.tabsBackgroundColor,
    required this.cornerRadius,
    required this.wantKeepAlive,
    super.padding,
    super.margin,
  });

  factory DynamicTabView.fromJson(Map<String, dynamic> json) =>
      _$DynamicTabViewFromJson(json);

  @JsonKey(includeFromJson: false, includeToJson: false)
  TabIndexState get _indexState {
    DynamicProvider widgetDataProvider =
        WidgetResolver.getTopAncestorOfType<DynamicProvider>(this)!;
    String controllerCacheKey = 'indexController$key';
    TabIndexState controller =
        widgetDataProvider.controllerCache.putIfAbsent(controllerCacheKey, () {
      return TabIndexState(selectedTabIndex);
    }) as TabIndexState;
    return controller;
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  ScrollController get _scrollController {
    DynamicProvider dynamicProvider =
        WidgetResolver.getTopAncestorOfType<DynamicProvider>(this)!;
    String controllerKey = '${Strings.scrollController}$key';
    ScrollController scrollController = ScrollController();
    dynamicProvider.controllerCache
        .putIfAbsent(controllerKey, () => scrollController);
    scrollController.addListener(_scrollListener);
    return dynamicProvider.controllerCache[controllerKey];
  }

  void _scrollListener() {
    ScrollController scrollController = _scrollController;
    if (scrollController.position.pixels !=
        scrollController.position.minScrollExtent) {
      ScrollListeners.callOnScrolled(key);
    }
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      ScrollListeners.callOnScrolledToEnd(key);
    }
    if (scrollController.position.pixels ==
        scrollController.position.minScrollExtent) {
      ScrollListeners.callOnScrolledToStart(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    tabview = TabView(
      indexState: _indexState,
      tabTitles: _tabTitles(),
      tabChildren: tabs!.map((TabDTO tab) => _getTab(context, tab)).toList(),
      tabsBackgroundColor: tabsBackgroundColor ?? AppColors.transparent,
      indicatorColor: indicatorColor ?? AppColors.transparent,
      labelColor: labelColor ?? AppColors.transparent,
    );
    return Card(
      margin: margin,
      child: _child(context),
    );
  }

  List<String> _tabTitles() => tabs!.map((TabDTO tab) => tab.title!).toList();

  Widget? _child(BuildContext context) {
    return tabs!.isNotEmpty && tabs!.length == 1
        ? _getSingleTabView(context)
        : tabview;
  }

  Widget _getTab(BuildContext context, TabDTO tab) {
    if (tab.pageUrl != null && tab.pageUrl!.isNotEmpty) {
      Uri uri = Uri.parse(tab.pageUrl!);
      String urlType = uri.queryParameters[Strings.urlType] ?? Strings.local;
      if (urlType == Strings.local) {
        return ServeDynamicUI.fromAssets(tab.pageUrl!);
      } else if (urlType == Strings.network) {
        return ServeDynamicUI.fromNetwork(
          DynamicRequest(url: tab.pageUrl!, requestType: RequestType.get),
        );
      } else {
        String requestType = uri.queryParameters[Strings.requestType] ?? Strings.get;
        return ServeDynamicUI.fromNetwork(DynamicRequest(
            url: tab.pageUrl!, requestType: requestType.requestTypeFromString()));
      }
    } else {
      return SingleChildScrollView(
        key: (tab.scrollKey != null) ? PageStorageKey(tab.scrollKey) : null,
        controller: _scrollController,
        child: DynamicView(
          child: tab.child!,
        ),
      );
    }
  }

  Widget _getSingleTabView(BuildContext context) {
    return SingleTabView(
      tabsBackgroundColor: tabsBackgroundColor ?? AppColors.transparent,
      indicatorColor: indicatorColor ?? AppColors.transparent,
      labelColor: labelColor ?? AppColors.transparent,
      title: tabs!.first.title,
      child: Flexible(
        child: _getTab(context, tabs!.first),
      ),
    );
  }

  @override
  List<DynamicWidget>? get childWidgets =>
      tabs
          ?.map((TabDTO tab) => tab.child)
          .whereType<DynamicWidget>()
          .toList() ??
      [];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}
}
