import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'text_style_dto.g.dart';

///[TextStyleDTO] :  dto that holds value related to style a [Text] widget.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class TextStyleDTO {
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? color;
  double? fontSize;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? backgroundColor;
  @JsonKey(fromJson: WidgetUtil.getFontWeight)
  FontWeight? fontWeight;
  @JsonKey(fromJson: WidgetUtil.getTextOverflow)
  TextOverflow? textOverflow;
  @JsonKey(fromJson: WidgetUtil.getFontStyle)
  FontStyle? fontStyle;

  TextStyleDTO({
    this.color,
    this.fontSize,
    this.backgroundColor,
    this.fontWeight,
    this.textOverflow,
    this.fontStyle,
  });

  factory TextStyleDTO.fromJson(Map<String, dynamic> json) =>
      _$TextStyleDTOFromJson(json);

  TextStyle? get textStyle {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      backgroundColor: backgroundColor,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      overflow: textOverflow,
    );
  }
}
