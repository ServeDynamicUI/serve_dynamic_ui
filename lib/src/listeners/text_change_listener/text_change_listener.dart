import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

///[TextChangeListener] : a listener that keeps track of the text changes in a dynamic widget.
abstract class TextChangeListener extends DynamicListener{
  void onTextChanged(String? widgetKey, String newValue);
}

///[TextChangeListeners] : class that adds all the text change listeners and calls the methods in [TextChangeListener].
class TextChangeListeners {
  static final Map<String, TextChangeListener> _textListeners = {};

  ///to add a text change listener
  static void addTextChangeListener(String textControllerKey, TextChangeListener textChangeListener) {
    _textListeners[textControllerKey] = (textChangeListener);
  }

  ///to add text change listeners in a list.
  static void addAllScrollListener(Map<String, TextChangeListener> textChangeListeners) {
    _textListeners.addAll(textChangeListeners);
  }

  ///to remove a text change listener
  static void removeScrollListener(String textControllerKey) {
    _textListeners.remove(textControllerKey);
  }

  ///to call onTextChanged callback in all listeners.
  static void callOnTextChanged(String? textControllerKey, String newValue) {
    _textListeners[textControllerKey]?.onTextChanged(textControllerKey, newValue);
  }
}
