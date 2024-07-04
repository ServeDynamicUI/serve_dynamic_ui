import '../constants/constants.dart';

///[DynamicWidgetHandlerRepo] : helps to register a DynamicWidgetHandler.
class DynamicWidgetHandlerRepo {
  static final Map<String, DynamicWidgetHandler> _dynamicWidgetHandler =
      <String, DynamicWidgetHandler>{};

  ///add a DynamicWidgetHandler for a specific type.
  static void addDynamicWidgetHandler(
      String type, DynamicWidgetHandler widgetResolver) {
    _dynamicWidgetHandler[type] = widgetResolver;
  }

  ///add all DynamicWidgetHandlers for specific types.
  static void addAllDynamicWidgetHandler(
      Map<String, DynamicWidgetHandler> handlers) {
    _dynamicWidgetHandler.addAll(handlers);
  }

  ///removes a DynamicWidgetHandler.
  static void removeDynamicWidgetHandler(String type) {
    _dynamicWidgetHandler.remove(type);
  }

  ///Returns a DynamicWidgetHandler which can handle a type of widget.
  static DynamicWidgetHandler? getDynamicWidgetHandlerForType(String type) {
    return _dynamicWidgetHandler[type];
  }
}
