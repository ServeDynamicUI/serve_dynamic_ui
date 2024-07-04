import 'package:flutter/cupertino.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

class TextUpdateListener extends TextChangeListener {
  @override
  void onTextChanged(String? widgetKey, String newValue) {
    debugPrint('onTextChanged $widgetKey $newValue');
  }
}
