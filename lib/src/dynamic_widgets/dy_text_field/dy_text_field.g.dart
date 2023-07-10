// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_text_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicTextField _$DynamicTextFieldFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicTextField(
    key: json['key'] as String,
    initialText: json['initialText'] as String,
    textFieldDecoration: json['textFieldDecoration'] == null
        ? null
        : TextFieldDTO.fromJson(
            json['textFieldDecoration'] as Map<String, dynamic>),
  );
}
