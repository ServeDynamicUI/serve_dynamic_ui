import 'package:carousel_slider/carousel_options.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

///[CarouselChangeListener] : a listener that keeps track of the carousel in a dy_carousel dynamic widget.
abstract class CarouselChangeListener extends DynamicListener {
  void onPageChanged(
      String? widgetKey, int index, CarouselPageChangedReason changeReason);
  void onScrolled(String? widgetKey, double? value);
}

///[CarouselChangeListeners] : class that adds all the carousel change listeners and calls the methods in [CarouselChangeListener].
class CarouselChangeListeners {
  static final Map<String, CarouselChangeListener> _carouselChangeListeners =
      {};

  ///to add a scroll change listener
  static void addScrollChangeListener(
      String scrollControllerKey, CarouselChangeListener scrollChangeListener) {
    _carouselChangeListeners[scrollControllerKey] = scrollChangeListener;
  }

  ///to add scroll change listeners in a list.
  static void addAllScrollListener(
      Map<String, CarouselChangeListener> scrollChangeListeners) {
    _carouselChangeListeners.addAll(scrollChangeListeners);
  }

  ///to remove a scroll change listener
  static void removeScrollListener(String scrollControllerKey) {
    _carouselChangeListeners.remove(scrollControllerKey);
  }

  ///to call OnPageChanged callback in all listeners.
  static void callOnPageChanged(String? scrollControllerKey, int index,
      CarouselPageChangedReason changeReason) {
    _carouselChangeListeners[scrollControllerKey]
        ?.onPageChanged(scrollControllerKey, index, changeReason);
  }

  ///to call OnScrolled callback in all listeners.
  static void callOnScrolled(String? scrollControllerKey, double? value) {
    _carouselChangeListeners[scrollControllerKey]
        ?.onScrolled(scrollControllerKey, value);
  }
}
