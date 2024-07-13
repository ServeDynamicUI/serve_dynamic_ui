import 'package:serve_dynamic_ui/src/listeners/data_event_listener/data_event_listener.dart';
import 'package:serve_dynamic_ui/src/listeners/index.dart';

///an abstract class which helps to add generic listener
abstract class DynamicListener {}

///[DynamicListeners] is a class to perform operations on listener
class DynamicListeners {
  ///listener to add a dynamicListener.
  static void addListener(String key, DynamicListener dynamicListener) {
    if (dynamicListener is ScrollListener) {
      ScrollListeners.addScrollListener(key, dynamicListener);
    } else if (dynamicListener is TextChangeListener) {
      TextChangeListeners.addTextChangeListener(key, dynamicListener);
    } else if (dynamicListener is DataEventListener) {
      DataEventListeners.addDataEventListener(key, dynamicListener);
    } else if (dynamicListener is CarouselChangeListener) {
      CarouselChangeListeners.addScrollChangeListener(key, dynamicListener);
    }
  }

  ///listener to add all dynamicListeners in a list.
  static void addAllScrollListener(
      Map<String, DynamicListener> dynamicListeners) {
    for (var dynamicListener in dynamicListeners.entries) {
      addListener(dynamicListener.key, dynamicListener.value);
    }
  }

  ///listener to remove a dynamicListener.
  static void removeScrollListener(
      String key, DynamicListener dynamicListener) {
    if (dynamicListener is ScrollListener) {
      ScrollListeners.removeScrollListener(key);
    } else if (dynamicListener is TextChangeListener) {
      TextChangeListeners.removeScrollListener(key);
    } else if (dynamicListener is DataEventListener) {
      DataEventListeners.removeDataEventListener(key, dynamicListener);
    } else if (dynamicListener is CarouselChangeListener) {
      CarouselChangeListeners.removeScrollListener(key);
    }
  }
}
