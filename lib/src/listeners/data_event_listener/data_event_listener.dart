
import 'package:serve_dynamic_ui/src/listeners/index.dart';

abstract class DataEventListener {
  void onDataEvent(Map<String, dynamic> data);
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
  static void removeDataEventListener(String dataEventKey) {
    _dataEventListeners.remove(dataEventKey);
  }

  ///to call onDataEvent callback in all listeners.
  static void callOnDataEvent(String? dataEventKey, Map<String, dynamic> data) {
    _dataEventListeners[dataEventKey]?.forEach((dataEventListener) {
      dataEventListener.onDataEvent(data);
    });
  }
}