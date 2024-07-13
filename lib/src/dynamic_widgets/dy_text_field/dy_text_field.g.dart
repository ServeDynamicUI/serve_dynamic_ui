// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_text_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicTextField _$DynamicTextFieldFromJson(Map<String, dynamic> json) {
  return DynamicTextField(
    key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
    initialText: json['initialText'] as String,
    textFieldDecoration: json['textFieldDecoration'] == null
        ? null
        : TextFieldDTO.fromJson(
            json['textFieldDecoration'] as Map<String, dynamic>),
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height:
        WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
    regexValidator: json['regexValidator'] as String?,
  );
}
