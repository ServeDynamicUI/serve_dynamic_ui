import 'package:flutter/cupertino.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

class WidgetScrollListener extends ScrollListener {
  @override
  void onScrolled(String? widgetKey) {
    debugPrint('onScrolled $widgetKey');
  }

  @override
  void onScrolledToEnd(String? widgetKey) {
    debugPrint('onScrolledToEnd $widgetKey');
  }

  @override
  void onScrolledToStart(String? widgetKey) {
    debugPrint('onScrolledToStart $widgetKey');
  }
}
