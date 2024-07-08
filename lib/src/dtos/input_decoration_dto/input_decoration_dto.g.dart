// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_decoration_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputDecorationDTO _$InputDecorationDTOFromJson(Map<String, dynamic> json) =>
    InputDecorationDTO(
      labelText: json['labelText'] as String?,
      labelStyle: json['labelStyle'] == null
          ? null
          : TextStyleDTO.fromJson(json['labelStyle'] as Map<String, dynamic>),
      helperText: json['helperText'] as String?,
      helperStyle: json['helperStyle'] == null
          ? null
          : TextStyleDTO.fromJson(json['helperStyle'] as Map<String, dynamic>),
      hintText: json['hintText'] as String?,
      hintStyle: json['hintStyle'] == null
          ? null
          : TextStyleDTO.fromJson(json['hintStyle'] as Map<String, dynamic>),
      errorText: json['errorText'] as String?,
      errorStyle: json['errorStyle'] == null
          ? null
          : TextStyleDTO.fromJson(json['errorStyle'] as Map<String, dynamic>),
      prefixText: json['prefixText'] as String?,
      prefixStyle: json['prefixStyle'] == null
          ? null
          : TextStyleDTO.fromJson(json['prefixStyle'] as Map<String, dynamic>),
      suffixText: json['suffixText'] as String?,
      suffixStyle: json['suffixStyle'] == null
          ? null
          : TextStyleDTO.fromJson(json['suffixStyle'] as Map<String, dynamic>),
      fillColor: WidgetUtil.getColor(json['fillColor'] as String?),
      focusColor: WidgetUtil.getColor(json['focusColor'] as String?),
      hoverColor: WidgetUtil.getColor(json['hoverColor'] as String?),
      icon: json['icon'] == null
          ? null
          : DynamicWidget.fromJson(json['icon'] as Map<String, dynamic>),
      suffixIcon: json['suffixIcon'] == null
          ? null
          : DynamicWidget.fromJson(json['suffixIcon'] as Map<String, dynamic>),
      iconColor: WidgetUtil.getColor(json['iconColor'] as String?),
      enableBorderColor:
          WidgetUtil.getColor(json['enableBorderColor'] as String?),
      focusBorderColor:
          WidgetUtil.getColor(json['focusBorderColor'] as String?),
      borderColor: WidgetUtil.getColor(json['borderColor'] as String?),
      borderWidth: (json['borderWidth'] as num?)?.toDouble() ?? 1,
      filled: json['filled'] as bool?,
      borderRadius: (json['borderRadius'] as num?)?.toDouble() ?? 4,
    );
