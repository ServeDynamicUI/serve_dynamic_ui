///[ScrollListener] : a listener to listen changes in a scrollable widget.
abstract class ScrollListener {
  ///passes the [widgetKey] which is being scrolled.
  void onScrolled(String? widgetKey);

  ///passes the [widgetKey] which is has been scrolled top end.
  void onScrolledToEnd(String? widgetKey);

  ///passes the [widgetKey] which has been scrolled to top.
  void onScrolledToStart(String? widgetKey);
}

///[ScrollListeners] : class that adds all the scroll listeners and calls the methods in [ScrollListener].
class ScrollListeners {
  static final List<ScrollListener> _scrollListeners = [];

  static void addScrollListener(ScrollListener scrollListener) {
    _scrollListeners.add(scrollListener);
  }

  static void addAllScrollListener(List<ScrollListener> scrollListeners) {
    _scrollListeners.addAll(scrollListeners);
  }

  static void removeScrollListener(ScrollListener scrollListener) {
    _scrollListeners.remove(scrollListener);
  }

  static void callOnScrolled(String? widgetKey) {
    for (var scroll in _scrollListeners) {
      scroll.onScrolled(widgetKey);
    }
  }

  static void callOnScrolledToEnd(String? widgetKey) {
    for (var scroll in _scrollListeners) {
      scroll.onScrolledToEnd(widgetKey);
    }
  }

  static void callOnScrolledToStart(String? widgetKey) {
    for (var scroll in _scrollListeners) {
      scroll.onScrolledToStart(widgetKey);
    }
  }
}
