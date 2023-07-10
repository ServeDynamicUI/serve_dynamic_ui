// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TabDTO _$TabDTOFromJson(Map<String, dynamic> json) => TabDTO(
      json['title'] as String?,
      json['scrollKey'] as String?,
      json['child'] == null
          ? null
          : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
      json['pageUrl'] as String?,
    );
