
import 'package:serve_dynamic_ui/src/listeners/index.dart';

abstract class DataEventListener {
  void onDataEvent(String dataEventKey, Map<String, dynamic> data);
}

class DataEventListeners extends DynamicListeners {

  static final Map<String, List<DataEventListener>> _dataEventListeners = {};

  ///to add a data event change listener
  static void addDataEventListener(String dataEventKey, DataEventListener dataEventListener) {
    _dataEventListeners.putIfAbsent(dataEventKey, () => []);
    _dataEventListeners[dataEventKey]?.add(dataEventListener);
  }

  ///to add data event change listeners in a list.
  static void addAllDataEventListener(Map<String, List<DataEventListener>> dataEventListeners) {
    _dataEventListeners.addAll(dataEventListeners);
  }

  ///to remove a data event change listener based on its key
  static bool removeDataEventListener(String dataEventKey, DataEventListener dataEventListener) {
    return _dataEventListeners[dataEventKey]?.remove(dataEventListener) ?? false;
  }

  ///to call onDataEvent callback in all listeners.
  static void callOnDataEvent(String dataEventKey, Map<String, dynamic> data) {
    _dataEventListeners[dataEventKey]?.forEach((dataEventListener) {
      dataEventListener.onDataEvent(dataEventKey, data);
    });
  }
}