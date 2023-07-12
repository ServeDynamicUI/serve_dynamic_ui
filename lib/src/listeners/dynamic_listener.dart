import 'package:serve_dynamic_ui/src/listeners/index.dart';

abstract class DynamicListener {}

class DynamicListeners {
  static void addListener(DynamicListener dynamicListener) {
    if (dynamicListener is ScrollListener) {
      ScrollListeners.addScrollListener(dynamicListener);
    } else if (dynamicListener is TextChangeListener) {
      TextChangeListeners.addTextChangeListener(dynamicListener);
    }
  }

  static void addAllScrollListener(List<DynamicListener> dynamicListeners) {
    for (var dynamicListener in dynamicListeners) {
      addListener(dynamicListener);
    }
  }

  static void removeScrollListener(DynamicListener dynamicListener) {
    if (dynamicListener is ScrollListener) {
      ScrollListeners.removeScrollListener(dynamicListener);
    } else if (dynamicListener is TextChangeListener) {
      TextChangeListeners.removeScrollListener(dynamicListener);
    }
  }
}
