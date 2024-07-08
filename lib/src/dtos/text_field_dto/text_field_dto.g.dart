// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_field_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextFieldDTO _$TextFieldDTOFromJson(Map<String, dynamic> json) => TextFieldDTO(
      decoration: json['decoration'] == null
          ? null
          : InputDecorationDTO.fromJson(
              json['decoration'] as Map<String, dynamic>),
      keyboardType:
          WidgetUtil.getTextInputType(json['keyboardType'] as String?),
      textInputAction:
          WidgetUtil.getTextInputAction(json['textInputAction'] as String?),
      textCapitalization: WidgetUtil.getTextCapitalization(
          json['textCapitalization'] as String?),
      style: json['style'] == null
          ? null
          : TextStyleDTO.fromJson(json['style'] as Map<String, dynamic>),
      textAlign: WidgetUtil.getTextAlign(json['textAlign'] as String?),
      textAlignVertical:
          WidgetUtil.getTextAlignVertical(json['textAlignVertical'] as String?),
      textDirection:
          WidgetUtil.getTextDirection(json['textDirection'] as String?),
      readOnly: json['readOnly'] as bool?,
      showCursor: json['showCursor'] as bool?,
      obscuringCharacter: json['obscuringCharacter'] as String?,
      maxLines: json['maxLines'] as int?,
      minLines: json['minLines'] as int?,
      maxLength: json['maxLength'] as int?,
      obscureText: json['obscureText'] as bool?,
      enabled: json['enabled'] as bool?,
      errorTextStyle: json['errorTextStyle'] == null
        ? null
        : TextStyleDTO.fromJson(json['errorTextStyle'] as Map<String, dynamic>),
      errorText: json['errorText'] as String?,
      cursorColor: WidgetUtil.getColor(json['cursorColor'] as String?),
    );
