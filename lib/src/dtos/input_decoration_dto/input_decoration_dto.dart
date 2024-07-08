import 'dart:core';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/src/dtos/index.dart';
import 'package:serve_dynamic_ui/src/utils/index.dart';
import '../../dynamic_widgets/index.dart';

part 'input_decoration_dto.g.dart';

///[InputDecorationDTO] : dto which holds properties required in an Input Decoration Widget.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class InputDecorationDTO {
  String? labelText;
  TextStyleDTO? labelStyle;
  String? helperText;
  TextStyleDTO? helperStyle;
  String? hintText;
  TextStyleDTO? hintStyle;
  String? errorText;
  TextStyleDTO? errorStyle;
  String? prefixText;
  TextStyleDTO? prefixStyle;
  String? suffixText;
  TextStyleDTO? suffixStyle;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? fillColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? focusColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? hoverColor;
  DynamicWidget? icon;
  DynamicWidget? suffixIcon;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? iconColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? enableBorderColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? focusBorderColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? borderColor;
  double borderWidth;
  bool? filled;
  double borderRadius;

  InputDecorationDTO({
    this.labelText,
    this.labelStyle,
    this.helperText,
    this.helperStyle,
    this.hintText,
    this.hintStyle,
    this.errorText,
    this.errorStyle,
    this.prefixText,
    this.prefixStyle,
    this.suffixText,
    this.suffixStyle,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.icon,
    this.suffixIcon,
    this.iconColor,
    this.enableBorderColor,
    this.focusBorderColor,
    this.borderColor,
    this.borderWidth = 1,
    this.filled,
    this.borderRadius = 4,
  });

  factory InputDecorationDTO.fromJson(Map<String, dynamic> json) =>
      _$InputDecorationDTOFromJson(json);

  ///Returns [InputDecoration] widget instance from [InputDecorationDTO] instance.
  InputDecoration? getInputDecorationFromDTO(BuildContext context) {
    return InputDecoration(
      label: Text(
        labelText ?? '',
        style: labelStyle?.textStyle,
      ),
      suffix: Text(
        suffixText ?? '',
        style: suffixStyle?.textStyle,
      ),
      prefix: Text(
        prefixText ?? '',
        style: prefixStyle?.textStyle,
      ),
      helperText: helperText,
      helperStyle: helperStyle?.textStyle,
      icon: (icon == null) ? null : icon!.build(context),
      suffixIcon: (suffixIcon == null) ? null : suffixIcon!.build(context),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide:
            BorderSide(color: enableBorderColor ?? const Color(0xFF000000), width: borderWidth),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide:
            BorderSide(color: focusBorderColor ?? const Color(0xFF000000), width: borderWidth),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor ?? const Color(0xFF000000), width: borderWidth),
      ),
      iconColor: iconColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      fillColor: fillColor,
      hintText: hintText,
      hintStyle: hintStyle?.textStyle,
      filled: true,
    );
  }

  @override
  String toString() {
    return 'InputDecorationDTO{labelText: $labelText, labelStyle: $labelStyle, helperText: $helperText, helperStyle: $helperStyle, hintText: $hintText, hintStyle: $hintStyle, errorText: $errorText, errorStyle: $errorStyle, prefixText: $prefixText, prefixStyle: $prefixStyle, suffixText: $suffixText, suffixStyle: $suffixStyle, fillColor: $fillColor, focusColor: $focusColor, hoverColor: $hoverColor, icon: $icon, suffixIcon: $suffixIcon, iconColor: $iconColor, enableBorderColor: $enableBorderColor, focusBorderColor: $focusBorderColor, borderColor: $borderColor}';
  }
}
