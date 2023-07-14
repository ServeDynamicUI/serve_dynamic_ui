import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_loader/index.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_sized_box/dy_sized_box.dart';

///[DynamicWidgetHandlers] helps to register all the handlers
class DynamicWidgetHandlers {

  ///initialize all the default and custom DynamicWidgetHandlers.
  static init({Map<String, DynamicWidgetHandler>? handlers}) {
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyScaffold, (json) => DynamicScaffold.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyContainer, (json) => DynamicContainer.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyText, (json) => DynamicText.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyColumn, (json) => DynamicColumn.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyRow, (json) => DynamicRow.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyButton, (json) => DynamicButton.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyTextField, (json) => DynamicTextField.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyList, (json) => DynamicList.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyTabView, (json) => DynamicTabView.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyAlign, (json) => DynamicAlign.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyPositioned, (json) => DynamicPositioned.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyStack, (json) => DynamicStack.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyImage, (json) => DynamicImage.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyCard, (json) => DynamicCard.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyGestureDetector,
        (json) => DynamicGestureDetector.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dySizedBox, (json) => DynamicSizedBox.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        Strings.dyLoader, (json) => DynamicLoader.fromJson(json));

    if (handlers != null) {
      DynamicWidgetHandlerRepo.addAllDynamicWidgetHandler(handlers);
    }
  }
}
