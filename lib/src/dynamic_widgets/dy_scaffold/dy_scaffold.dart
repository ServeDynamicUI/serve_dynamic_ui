import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_loader/index.dart';

part 'dy_scaffold.g.dart';

///[DynamicScaffold] : A dynamic widget that crates a basic structure for building app's layout.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicScaffold extends DynamicWidget implements FormWidget {
  String? pageTitle;
  bool centerPageTitle;
  List<DynamicWidget>? children;
  List<DynamicWidget>? rightActions;
  List<DynamicWidget>? leftActions;
  double? leftActionsWidth;
  DynamicWidget? floatingActionWidget;
  DynamicWidget? bottomNavigationBar;
  DynamicWidget? paginatedLoaderWidget;
  bool showPaginatedLoaderOnTop;
  bool scrollable;
  bool paginated;
  bool primary;
  bool extendBody;
  bool? resizeToAvoidBottomInset;
  bool drawerEnableOpenDragGesture;
  bool extendBodyBehindAppBar;
  bool endDrawerEnableOpenDragGesture;
  String? nextUrl;
  double? itemsSpacing;
  @JsonKey(fromJson: WidgetUtil.getCrossAxisAlignment)
  CrossAxisAlignment crossAxisAlignment;

  DynamicScaffold(
      {required String key,
      this.children,
      this.rightActions,
      this.leftActions,
      this.leftActionsWidth,
      this.pageTitle,
      this.floatingActionWidget,
      this.bottomNavigationBar,
      this.paginatedLoaderWidget,
      this.resizeToAvoidBottomInset,
      this.centerPageTitle = true,
      this.scrollable = true,
      this.paginated = false,
      this.primary = true,
      this.extendBody = false,
      this.drawerEnableOpenDragGesture = true,
      this.extendBodyBehindAppBar = false,
      this.endDrawerEnableOpenDragGesture = true,
      this.nextUrl,
      this.itemsSpacing,
      this.showPaginatedLoaderOnTop = false,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      super.margin,
      super.padding,
      })
      : super(
          key: key ?? "",
        );

  factory DynamicScaffold.fromJson(Map<String, dynamic> json) =>
      _$DynamicScaffoldFromJson(json);

  @override
  List<DynamicWidget>? get childWidgets => children != null ? children! : [];

  ScrollController get _scrollController {
    DynamicProvider dynamicProvider =
        WidgetResolver.getTopAncestorOfType<DynamicProvider>(this)!;
    String controllerKey = key;
    if (dynamicProvider.controllerCache[controllerKey] != null) {
      return dynamicProvider.controllerCache[controllerKey];
    }
    ScrollController scrollController = ScrollController();
    dynamicProvider.controllerCache[controllerKey] = scrollController;
    scrollController.addListener(() {
      _scrollListener();
    });
    return dynamicProvider.controllerCache[controllerKey];
  }

  DyScaffoldState get _scaffoldState {
    DynamicProvider dynamicProvider =
        WidgetResolver.getTopAncestorOfType<DynamicProvider>(this)!;
    if (dynamicProvider.stateCache[key] != null) {
      return dynamicProvider.stateCache[key]!;
    } else {
      DyScaffoldState dyScaffoldState = DyScaffoldState(nextUrl, this);
      dynamicProvider.stateCache[key] = dyScaffoldState;
      return dyScaffoldState;
    }
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
    return Scaffold(
      key: ValueKey(key),
      appBar: _appBar(context, pageTitle, centerPageTitle, leftActions,
          rightActions, leftActionsWidth),
      body: Container(padding: padding, margin: margin, child: _getBody(context),),
      floatingActionButton: floatingActionWidget?.build(context),
      bottomNavigationBar: bottomNavigationBar?.build(context),
      primary: primary,
      extendBody: extendBody,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
    );
  }

  Widget _getBody(BuildContext context) {
    if (children == null) {
      return const SizedBox.shrink();
    }
    if (scrollable) {
      if (paginated) {
        if (showPaginatedLoaderOnTop) {
          return SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                _paginatedWidget(),
                ValueListenableBuilder(
                    valueListenable:
                        _scaffoldState.showPaginatedLoaderOnTopNotifier,
                    builder: (ctx, data, _) {
                      if (data) {
                        if (paginatedLoaderWidget != null) {
                          return paginatedLoaderWidget!.build(context);
                        }
                        return SizedBox(
                          width: double.infinity,
                          child: DynamicLoader(
                                  key: UniqueKey().toString(),
                                  backgroundColor: Colors.transparent,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center)
                              .build(context),
                        );
                      }
                      return const SizedBox.shrink();
                    })
              ],
            ),
          );
        }
        return _paginatedWidget();
      }
      return _unPaginatedWidget();
    }
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: WidgetUtil.childrenFilter(children)
          .map((dyWidget) => dyWidget.build(context))
          .toList(),
    );
  }

  Widget _unPaginatedWidget() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: LayoutBuilder(builder: (context, _) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: WidgetUtil.childrenFilter(children)
                .map((dyWidget) => dyWidget.build(context))
                .toList(),
          ),
        );
      }),
    );
  }

  Widget _paginatedWidget() {
    return ValueListenableBuilder(
        valueListenable: _scaffoldState.pageDataEventNotifier,
        builder: (context, event, _) {
          List<Widget> widgets = WidgetUtil.childrenFilter(event.children)
              .map((child) => child.build(context))
              .toList();
          if (event is PageSuccessEvent || event is PageProgressEvent) {
            if (!showPaginatedLoaderOnTop &&
                StringUtil.isNotEmptyNorNull(_scaffoldState.nextUrl) &&
                widgets.isNotEmpty) {
              if (paginatedLoaderWidget == null) {
                widgets.add(_loaderWidget());
              } else {
                widgets.add(paginatedLoaderWidget!.build(context));
              }
            }
            return _paginatedListWidget(widgets);
          } else if (event is PageErrorEvent) {
            return _paginatedListWidget(widgets);
          }
          return const SizedBox.shrink();
        });
  }

  Widget _paginatedListWidget(List<Widget> widgets) {
    return ListView.separated(
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return widgets[index];
        },
        separatorBuilder: (context, index) {
          return Container(
            height: itemsSpacing,
          );
        },
        itemCount: widgets.length,
    );
  }

  Widget _loaderWidget() {
    return const Card(
      shadowColor: AppColors.greenYellow,
      color: AppColors.mantis,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 14,
              width: 14,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                strokeWidth: 2,
              ),
            ),
            Spacer(),
            Text(
              "Loading...",
              style: TextStyle(color: AppColors.white, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }

  @override
  Map<String, dynamic> getValues() {
    Map<String, dynamic> values = {};
    childWidgets?.forEach((widget) {
      values.addAll(getValuesFromChild(widget));
    });
    return values;
  }

  Map<String, dynamic> getValuesFromChild(DynamicWidget? widget) {
    if (widget != null) {
      if (widget is FormWidget) {
        return (widget as FormWidget).getValues();
      } else {
        if (widget.childWidgets?.isNotEmpty ?? false) {
          Map<String, dynamic> map = {};
          for (var child in widget.childWidgets!) {
            var childMap = getValuesFromChild(child);
            childMap.forEach((key, value) {
              if (map.containsKey(key)) {
                if (map[key] is List) {
                  map[key]?.add(value);
                } else {
                  map[key] = [map[key], value];
                }
              } else {
                map[key] = value;
              }
            });
          }
          return map;
        }
        return {};
      }
    } else {
      return {};
    }
  }

  @override
  bool validate() {
    bool validated = true;
    childWidgets?.forEach((widget) {
      validated &= validateFormWidgets(widget);
    });
    return validated;
  }

  bool validateFormWidgets(DynamicWidget? widget) {
    if (widget != null) {
      if (widget is FormWidget) {
        return (widget as FormWidget).validate();
      } else {
        if (widget.childWidgets?.isNotEmpty ?? false) {
          bool validate = true;
          for (var child in widget.childWidgets!) {
            validate = validate && validateFormWidgets(child);
          }
          return validate;
        }
        return true;
      }
    } else {
      return true;
    }
  }

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  PreferredSizeWidget? _appBar(
      BuildContext context,
      String? pageTitle,
      bool centerPageTitle,
      List<DynamicWidget>? leftActions,
      List<DynamicWidget>? rightActions,
      double? leftActionsWidth) {
    if (pageTitle == null) {
      return null;
    }

    return AppBar(
      title: Text(pageTitle),
      centerTitle: centerPageTitle,
      leadingWidth: leftActions != null ? leftActionsWidth : null,
      leading: leftActions == null
          ? null
          : Row(
              mainAxisAlignment: leftActions.length == 1
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: WidgetUtil.dynamicWidgetsSpacing(context, leftActions, 2),
            ),
      actions: rightActions == null
          ? null
          : [
              Row(
                mainAxisAlignment: rightActions.length == 1
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.end,
                children: WidgetUtil.dynamicWidgetsSpacing(context, rightActions, 2),
              )
            ],
    );
  }

  @override
  void postBuild() {

  }

  @override
  void preBuild() {

  }
}
