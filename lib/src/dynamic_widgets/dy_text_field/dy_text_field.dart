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
  @JsonKey(fromJson: WidgetUtil.getHeightValueOrInf)
  double? height;
  @JsonKey(fromJson: WidgetUtil.getWidthValueOrInf)
  double? width;
  final String? regexValidator;

  DynamicTextField(
      {required super.key,
      required this.initialText,
      this.textFieldDecoration,
      this.height,
      this.width,
      this.regexValidator,
  });

  @override
  List<DynamicWidget>? get childWidgets => [];

  factory DynamicTextField.fromJson(Map<String, dynamic> json) =>
      _$DynamicTextFieldFromJson(json);

  ///controller that acts as singleton controller.
  TextEditingController? get _controller {
    DynamicProvider rootDataProvider =
        WidgetResolver.getTopAncestorOfType<DynamicProvider>(this)!;
    String controllerKey = '${Strings.textController}$key';
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

  late ValueNotifier<bool> isValid;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
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
          cursorColor: textFieldDecoration?.cursorColor,
        ),
        ValueListenableBuilder(valueListenable: isValid, builder: (context, isValid, _){
          return Column(
            children: [
              if (!isValid)
               const SizedBox(height: 5),
              if (!isValid)
                Text(
                  textFieldDecoration?.errorText ?? 'Invalid input',
                  style: textFieldDecoration?.errorTextStyle?.textStyle ?? const TextStyle(color: Colors.red, fontSize: 14),
                  overflow: TextOverflow.visible,
                ),
            ],
          );
        })
      ],
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
      bool isValid = true;
      if(StringUtil.isNotEmptyNorNull(regexValidator)){
        RegExp regExp = RegExp(regexValidator!);
        isValid = regExp.hasMatch(controller!.text);
      }
      print('controller?.text ${controller?.text} $isValid');
      this.isValid.value = isValid;
      return isValid;
    }
    this.isValid.value = false;
    return false;
  }

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  void postBuild() {}

  @override
  void preBuild() {
    isValid = ValueNotifier(true);
  }

  @override
  void onDispose() {}

  @override
  double? get dyHeight => height;

  @override
  double? get dyWidth => width;
}
