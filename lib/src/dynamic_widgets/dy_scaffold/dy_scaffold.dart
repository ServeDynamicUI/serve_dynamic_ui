import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_scaffold.g.dart';

///[DynamicScaffold] : A dynamic widget that crates a basic structure for building app's layout.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicScaffold extends DynamicWidget implements FormWidget {
  String? pageTitle;
  DynamicWidget? child;
  DynamicWidget? floatingActionWidget;
  DynamicWidget? bottomNavigationBar;
  bool scrollable;
  bool primary;
  bool extendBody;
  bool? resizeToAvoidBottomInset;
  bool drawerEnableOpenDragGesture;
  bool extendBodyBehindAppBar;
  bool endDrawerEnableOpenDragGesture;

  DynamicScaffold({
    String? key,
    this.child,
    this.pageTitle,
    this.floatingActionWidget,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.scrollable = true,
    this.primary = true,
    this.extendBody = false,
    this.drawerEnableOpenDragGesture = true,
    this.extendBodyBehindAppBar = false,
    this.endDrawerEnableOpenDragGesture = true,
  }) : super(
          key: key ?? "",
        );

  factory DynamicScaffold.fromJson(Map<String, dynamic> json) =>
      _$DynamicScaffoldFromJson(json);

  @override
  List<DynamicWidget?>? get childWidgets => child != null ? [child!] : [];

  ScrollController get _scrollController {
    DynamicProvider dynamicProvider =
        WidgetResolver.getTopAncestorOfType<DynamicProvider>(this)!;
    String controllerKey = key!;
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

    return Scaffold(
      key: ValueKey(key),
      appBar: pageTitle == null
          ? null
          : AppBar(
              title: Text(pageTitle!),
            ),
      body: _getBody(context),
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
    if (child == null) {
      return const SizedBox.shrink();
    }
    if (scrollable) {
      return SingleChildScrollView(
        controller: _scrollController,
        child: LayoutBuilder(builder: (context, _) {
          return child!.build(context);
        }),
      );
    }
    return child!.build(context);
  }

  @override
  Map<String, dynamic> getValues() {
    return getValuesFromChild(child);
  }

  Map<String, dynamic> getValuesFromChild(DynamicWidget? widget) {
    if (widget != null) {
      if (widget is FormWidget) {
        return (widget as FormWidget).getValues();
      } else {
        if (widget.childWidgets?.isNotEmpty ?? false) {
          Map<String, dynamic> map = {};
          for (var child in widget.childWidgets!) {
            if (child != null) {
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
    return validateFormWidgets(child);
  }

  bool validateFormWidgets(DynamicWidget? widget) {
    if (widget != null) {
      if (widget is FormWidget) {
        return (widget as FormWidget).validate();
      } else {
        if (widget.childWidgets?.isNotEmpty ?? false) {
          bool validate = true;
          for (var child in widget.childWidgets!) {
            if (child != null) {
              validate = validate && validateFormWidgets(child);
            }
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
}
