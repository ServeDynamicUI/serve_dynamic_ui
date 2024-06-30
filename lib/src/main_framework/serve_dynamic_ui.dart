import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:serve_dynamic_ui/src/main_framework/network_page/network_builder.dart';
import 'package:serve_dynamic_ui/src/utils/db_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../handlers/dynamic_widget_handlers.dart';

///[ServeDynamicUI] : class which is entry point to this packages that helps to init this package.
class ServeDynamicUI {
  ///helps to initialize the [widgetHandlers], [actionHandlers] and [dio].
  static init(
      {Dio? dio,
      Map<RegExp, ActionHandler>? actionHandlers,
      Map<String, DynamicWidgetHandler>? widgetHandlers}) async{
    try{
      DynamicWidgetHandlers.init(handlers: widgetHandlers);
      ActionHandlersRepo.init(actionHandlers: actionHandlers);
      await Util.setPageCacheTime(const String.fromEnvironment(Strings.pageCacheKeepTime));
      DbUtil.deleteCachedPagesOlderThanSetCacheTime().then((delete)=>{
        debugPrint('deleted cached pages? $delete')
      });
      NetworkHandler.init(dio ?? Dio());
    } catch(e) {
      debugPrint('Some error occured $e');
    }
  }

  ///this is a method helps to create [DynamicWidget] from fetched asset json.
  static Widget fromAssets(
      String assetPath,{
        ShowLoaderWidgetBuilder? showLoaderWidgetBuilder,
        ShowErrorWidgetBuilder? showErrorWidgetBuilder,
        Map<String, String>? assetJsonValueReplacer
      }) {
    return FutureBuilder<Map<String, dynamic>>(
      future: WidgetUtil.loadJson(assetPath, assetJsonValueReplacer: assetJsonValueReplacer),
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
                return WidgetUtil.fromJson(snapshot.data!, context) ??
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
    String? templateJsonPath,
    ShowLoaderWidgetBuilder? showLoaderWidgetBuilder,
    ShowErrorWidgetBuilder? showErrorWidgetBuilder,
  }) {
    return NetworkBuilder(
      request: request,
      templateJsonPath: templateJsonPath,
      showErrorWidgetBuilder: showErrorWidgetBuilder,
      showLoaderWidgetBuilder: showLoaderWidgetBuilder,
    );
  }
}
