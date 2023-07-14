import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_text_field.g.dart';

///[DynamicTextField] : A dynamic widget that helps to take input from users.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicTextField extends DynamicWidget implements FormWidget {
  final String initialText;
  TextFieldDTO? textFieldDecoration;

  DynamicTextField(
      {required String key,
      required this.initialText,
      this.textFieldDecoration})
      : super(key: key);

  @override
  List<DynamicWidget?>? get childWidgets => [];

  factory DynamicTextField.fromJson(Map<String, dynamic> json) =>
      _$DynamicTextFieldFromJson(json);

  ///controller that acts as singleton controller.
  TextEditingController? get _controller {
    DynamicProvider rootDataProvider =
        WidgetResolver.getTopAncestorOfType<DynamicProvider>(this)!;
    String controllerKey = '${Strings.textController}${key}';
    TextEditingController controller = TextEditingController(text: initialText);
    rootDataProvider.controllerCache
        .putIfAbsent(controllerKey, () => controller);
    controller.addListener(_addTextListener);
    return rootDataProvider.controllerCache[controllerKey];
  }

  void _addTextListener() {
    String newText = _controller!.text;
    TextChangeListeners.callOnTextChanged(key, newText);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: textFieldDecoration?.keyboardType,
      textAlign: textFieldDecoration?.textAlign ?? TextAlign.center,
      textAlignVertical: textFieldDecoration?.textAlignVertical,
      decoration:
          textFieldDecoration?.decoration?.getInputDecorationFromDTO(context),
      obscureText: textFieldDecoration?.obscureText ?? false,
      enabled: textFieldDecoration?.enabled,
      maxLines: textFieldDecoration?.maxLines,
      minLines: textFieldDecoration?.minLines,
      readOnly: textFieldDecoration?.readOnly ?? false,
      showCursor: textFieldDecoration?.showCursor,
      obscuringCharacter: textFieldDecoration?.obscuringCharacter ?? '•',
      style: textFieldDecoration?.style?.textStyle,
      textCapitalization:
          textFieldDecoration?.textCapitalization ?? TextCapitalization.none,
    );
  }

  ///returns this widget value in map.
  @override
  Map<String, dynamic> getValues() {
    return {Strings.textFieldData: _controller?.text ?? ''};
  }

  ///validates the data in this widget.
  @override
  bool validate() {
    TextEditingController? controller = _controller;
    if (controller?.text != null && (controller?.text.isNotEmpty ?? false)) {
      return true;
    }
    return false;
  }

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}
}
