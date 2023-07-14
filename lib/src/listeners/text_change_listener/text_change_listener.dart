import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

///[TextChangeListener] : a listener that keeps track of the text changes in a dynamic widget.
abstract class TextChangeListener extends DynamicListener{
  void onTextChanged(String? widgetKey, String newValue);
}

///[TextChangeListeners] : class that adds all the text change listeners and calls the methods in [TextChangeListener].
class TextChangeListeners {
  static final List<TextChangeListener> _textListeners = [];

  ///to add a text change listener
  static void addTextChangeListener(TextChangeListener textChangeListener) {
    _textListeners.add(textChangeListener);
  }

  ///to add text change listeners in a list.
  static void addAllScrollListener(List<TextChangeListener> textChangeListeners) {
    _textListeners.addAll(textChangeListeners);
  }

  ///to remove a text change listener
  static void removeScrollListener(TextChangeListener textChangeListener) {
    _textListeners.remove(textChangeListener);
  }

  ///to call onTextChanged callback in all listeners.
  static void callOnTextChanged(String? widgetKey, String newValue) {
    for (var textListener in _textListeners) {
      textListener.onTextChanged(widgetKey, newValue);
    }
  }
}
