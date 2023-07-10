///[TextChangeListener] : a listener that keeps track of the text changes in a dynamic widget.
abstract class TextChangeListener {
  void onTextChanged(String? widgetKey, String newValue);
}

///[TextChangeListeners] : class that adds all the text change listeners and calls the methods in [TextChangeListener].
class TextChangeListeners {
  static final List<TextChangeListener> _textListeners = [];

  static void addTextChangeListener(TextChangeListener textChangeListener) {
    _textListeners.add(textChangeListener);
  }

  static void addAllScrollListener(List<TextChangeListener> textChangeListeners) {
    _textListeners.addAll(textChangeListeners);
  }

  static void removeScrollListener(TextChangeListener textChangeListener) {
    _textListeners.remove(textChangeListener);
  }

  static void callOnTextChanged(String? widgetKey, String newValue) {
    for (var textListener in _textListeners) {
      textListener.onTextChanged(widgetKey, newValue);
    }
  }
}
