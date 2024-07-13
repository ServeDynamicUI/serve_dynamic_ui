import 'package:carousel_slider/carousel_options.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

class CarouselSliderChangeListener extends CarouselChangeListener {
  @override
  void onPageChanged(
      String? widgetKey, int index, CarouselPageChangedReason changeReason) {
    print('widgetKey: $widgetKey, index: $index, changeReason: $changeReason');
  }

  @override
  void onScrolled(String? widgetKey, double? value) {
    print('widgetKey: $widgetKey, value: $value');
  }
}
