import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

/// An action handler that helps navigating between screens be it named route or dynamic screens from asset or network with loader widget.
class MoveToScreenActorHandler extends ActionHandler {

  ///handles the navigation action to navigate between screens..
  @override
  void handleAction(BuildContext? context, Uri action,
      Map<String, dynamic>? extras, OnHandledAction? onHandledAction) async {
    if (extras != null && context != null && context.mounted) {
      if (extras[Strings.urlType] == Strings.local) {
        DynamicNavigator.navigate(
          context: context,
          navigationStyle: extras[Strings.navigationStyle],
          navigationType: extras[Strings.navigationType],
          insetPadding: WidgetUtil.getEdgeInsets(extras[Strings.insetPadding]),
          widget: ServeDynamicUI.fromAssets(extras[Strings.url]),
        );
      } else if (extras[Strings.urlType] == Strings.network) {
        Map<String, dynamic>? loaderJson =
            await _getLoaderWidgetJson(extras[Strings.loaderWidgetAssetPath]);
        if(context.mounted){
          DynamicNavigator.navigate(
            context: context,
            navigationStyle: extras[Strings.navigationStyle],
            navigationType: extras[Strings.navigationType],
            insetPadding: WidgetUtil.getEdgeInsets(extras[Strings.insetPadding]),
            widget: ServeDynamicUI.fromNetwork(
              DynamicRequest(
                url: extras[Strings.url],
                requestType: extras[Strings.requestType]
                    .toString()
                    .requestTypeFromString(),
              ),
              showLoaderWidgetBuilder: (loaderJson == null)
                  ? null
                  : (context) {
                return DynamicWidget.fromJson(loaderJson);
              },
            ),
          );
        }
      }
    } else {
      if (action.queryParameters[Strings.screenName] != null) {
        if(context != null && context.mounted){
          DynamicNavigator.navigateToNamedRoute(context,
              routeName: action.queryParameters[Strings.screenName]!);
        }
      }
    }
  }

  Future<Map<String, dynamic>?> _getLoaderWidgetJson(String? assetPath) async {
    if (assetPath != null) {
      return await WidgetUtil.loadJson(assetPath);
    }
    return null;
  }
}
