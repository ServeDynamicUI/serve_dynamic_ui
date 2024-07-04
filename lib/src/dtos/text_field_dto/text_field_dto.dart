import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'text_field_dto.g.dart';

///[TextFieldDTO] : dto that holds properties required in [DynamicTextField].
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class TextFieldDTO {
  InputDecorationDTO? decoration;
  @JsonKey(fromJson: WidgetUtil.getTextInputType)
  TextInputType? keyboardType;
  @JsonKey(fromJson: WidgetUtil.getTextInputAction)
  TextInputAction? textInputAction;
  @JsonKey(fromJson: WidgetUtil.getTextCapitalization)
  TextCapitalization? textCapitalization;
  TextStyleDTO? style;
  @JsonKey(fromJson: WidgetUtil.getTextAlign)
  TextAlign? textAlign;
  @JsonKey(fromJson: WidgetUtil.getTextAlignVertical)
  TextAlignVertical? textAlignVertical;
  @JsonKey(fromJson: WidgetUtil.getTextDirection)
  TextDirection? textDirection;
  bool? readOnly;
  bool? showCursor;
  String? obscuringCharacter;
  int? maxLines;
  int? minLines;
  int? maxLength;
  bool? obscureText;
  bool? enabled;

  TextFieldDTO({
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.style,
    this.textAlign,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly,
    this.showCursor,
    this.obscuringCharacter,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.obscureText,
    this.enabled,
  });

  @override
  String toString() {
    return 'TextFieldDTO{decoration: $decoration, keyboardType: $keyboardType, textInputAction: $textInputAction, textCapitalization: $textCapitalization, style: $style, textAlign: $textAlign, textAlignVertical: $textAlignVertical, textDirection: $textDirection, readOnly: $readOnly, showCursor: $showCursor, obscuringCharacter: $obscuringCharacter, maxLines: $maxLines, minLines: $minLines, maxLength: $maxLength, obscureText: $obscureText, enabled: $enabled}';
  }

  factory TextFieldDTO.fromJson(Map<String, dynamic> json) {
    return _$TextFieldDTOFromJson(json);
  }
}
