import 'package:serve_dynamic_ui/src/listeners/index.dart';

///[ScrollListener] : a listener to listen changes in a scrollable widget.
abstract class ScrollListener extends DynamicListener {
  ///passes the [widgetKey] which is being scrolled.
  void onScrolled(String? widgetKey);

  ///passes the [widgetKey] which is has been scrolled top end.
  void onScrolledToEnd(String? widgetKey);

  ///passes the [widgetKey] which has been scrolled to top.
  void onScrolledToStart(String? widgetKey);
}

///[ScrollListeners] : class that adds all the scroll listeners and calls the methods in [ScrollListener].
class ScrollListeners {
  static final Map<String, ScrollListener> _scrollListeners = {};

  ///to a scroll listener in list.
  static void addScrollListener(
      String scrollKey, ScrollListener scrollListener) {
    _scrollListeners[scrollKey] = (scrollListener);
  }

  ///to add list of scroll listeners.
  static void addAllScrollListener(
      Map<String, ScrollListener> scrollListeners) {
    _scrollListeners.addAll(scrollListeners);
  }

  ///to remove a scroll listener.
  static void removeScrollListener(String scrollKey) {
    _scrollListeners.remove(scrollKey);
  }

  ///to call onScrolled callback of every listener.
  static void callOnScrolled(String widgetKey) {
    _scrollListeners[widgetKey]?.onScrolled(widgetKey);
  }

  ///to call onScrolledToEnd callback of every listener.
  static void callOnScrolledToEnd(String? widgetKey) {
    _scrollListeners[widgetKey]?.onScrolledToEnd(widgetKey);
  }

  ///to call onScrolledToStart callback of every listener.
  static void callOnScrolledToStart(String? widgetKey) {
    _scrollListeners[widgetKey]?.onScrolledToStart(widgetKey);
  }
}
