import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_column/dy_column.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_loader/index.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_row/dy_row.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_sized_box/dy_sized_box.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_text/dynamic_text.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_container/dy_container.dart';

///[DynamicWidgetHandlers] helps to register all the handlers
class DynamicWidgetHandlers {
  static init({Map<String, DynamicWidgetHandler>? handlers}) {
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_scaffold, (json) => DynamicScaffold.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_container, (json) => DynamicContainer.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_text, (json) => DynamicText.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_column, (json) => DynamicColumn.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_row, (json) => DynamicRow.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_button, (json) => DynamicButton.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_text_field, (json) => DynamicTextField.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_list, (json) => DynamicList.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_tab_view, (json) => DynamicTabView.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_align, (json) => DynamicAlign.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_positioned, (json) => DynamicPositioned.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_stack, (json) => DynamicStack.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_image, (json) => DynamicImage.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_card, (json) => DynamicCard.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_gesture_detector,
        (json) => DynamicGestureDetector.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_sized_box, (json) => DynamicSizedBox.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dy_loader, (json) => DynamicLoader.fromJson(json));

    if (handlers != null) {
      DynamicWidgetHandlerRepo.addAllDynamicWidgetHandler(handlers);
    }
  }
}
