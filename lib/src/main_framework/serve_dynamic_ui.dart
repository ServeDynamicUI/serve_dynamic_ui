import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import '../handlers/dynamic_widget_handlers.dart';

///[ServeDynamicUI] : class which is entry point to this packages that helps to init this package.
class ServeDynamicUI {
  ///helps to initialize the [widgetHandlers], [actionHandlers] and [dio].
  static init(
      {Dio? dio,
      Map<RegExp, ActionHandler>? actionHandlers,
      Map<String, DynamicWidgetHandler>? widgetHandlers}) {
    DynamicWidgetHandlers.init(handlers: widgetHandlers);
    ActionHandlersRepo.init(actionHandlers: actionHandlers);
    NetworkHandler.init(dio ?? Dio());
  }

  ///this is a method helps to create [DynamicWidget] from fetched asset json.
  static Widget fromAssets(
      String assetPath,{
        ShowLoaderWidgetBuilder? showLoaderWidgetBuilder,
        ShowErrorWidgetBuilder? showErrorWidgetBuilder,
      }) {
    return FutureBuilder<Map<String, dynamic>>(
      future: WidgetUtil.loadJson(assetPath),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            DynamicWidget? widget;
            if (showLoaderWidgetBuilder != null) {
              widget = showLoaderWidgetBuilder(context);
              return widget?.build(context) ?? const SizedBox.shrink();
            }
          case ConnectionState.done:
            if (snapshot.hasData) {
              if (context.mounted) {
                return _fromJson(snapshot.data!, context) ??
                    const SizedBox.shrink();
              }
              return const SizedBox.shrink();
            } else if (snapshot.hasError) {
              if (showErrorWidgetBuilder != null) {
                final widget = showErrorWidgetBuilder(context, snapshot.error);
                return widget?.build(context) ?? const SizedBox.shrink();
              }
              debugPrint(snapshot.error.toString());
            }
          default:
            break;
        }
        return Container(color: Colors.white);
      },
    );
  }

  ///this is a method helps to create [DynamicWidget] from fetched network json.
  static Widget fromNetwork(
    DynamicRequest request, {
    ShowLoaderWidgetBuilder? showLoaderWidgetBuilder,
    ShowErrorWidgetBuilder? showErrorWidgetBuilder,
  }) {
    return FutureBuilder<Response?>(
      future: NetworkHandler.getJsonFromRequest(request),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            DynamicWidget? widget;
            if (showLoaderWidgetBuilder != null) {
              widget = showLoaderWidgetBuilder(context);
              return widget?.build(context) ?? const SizedBox.shrink();
            }
          case ConnectionState.done:
            if (snapshot.hasData) {
              final json = jsonDecode(snapshot.data.toString());
              return _fromJson(json, context) ?? const SizedBox.shrink();
            } else if (snapshot.hasError) {
              if (showErrorWidgetBuilder != null) {
                final widget = showErrorWidgetBuilder(context, snapshot.error);
                return widget?.build(context) ?? const SizedBox.shrink();
              }
              debugPrint(snapshot.error.toString());
            }
          default:
            break;
        }
        return Container(color: Colors.white);
      },
    );
  }

  ///this is a private method helps to create [DynamicWidget] from passed json.
  static Widget? _fromJson(Map<String, dynamic>? json, BuildContext context) {
    try {
      if (json != null) {
        DynamicWidget dynamicWidget = DynamicWidget.fromJson(json);
        return DynamicProvider(dynamicWidget).build(context);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

}
