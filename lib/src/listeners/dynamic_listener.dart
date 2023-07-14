import 'package:serve_dynamic_ui/src/listeners/index.dart';

///an abstract class which helps to add generic listener
abstract class DynamicListener {}

///[DynamicListeners] is a class to perform operations on listener
class DynamicListeners {
  ///listener to add a dynamicListener.
  static void addListener(DynamicListener dynamicListener) {
    if (dynamicListener is ScrollListener) {
      ScrollListeners.addScrollListener(dynamicListener);
    } else if (dynamicListener is TextChangeListener) {
      TextChangeListeners.addTextChangeListener(dynamicListener);
    }
  }

  ///listener to add all dynamicListeners in a list.
  static void addAllScrollListener(List<DynamicListener> dynamicListeners) {
    for (var dynamicListener in dynamicListeners) {
      addListener(dynamicListener);
    }
  }

  ///listener to remove a dynamicListener.
  static void removeScrollListener(DynamicListener dynamicListener) {
    if (dynamicListener is ScrollListener) {
      ScrollListeners.removeScrollListener(dynamicListener);
    } else if (dynamicListener is TextChangeListener) {
      TextChangeListeners.removeScrollListener(dynamicListener);
    }
  }
}
