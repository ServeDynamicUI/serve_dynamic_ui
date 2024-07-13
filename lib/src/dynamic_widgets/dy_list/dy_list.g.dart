// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicList _$DynamicListFromJson(Map<String, dynamic> json) {
  return DynamicList(
    key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
    isVertical: json['isVertical'] as bool? ?? true,
    listItems: (json['listItems'] as List<dynamic>?)
        ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
        .toList(),
    separator: json['separator'] == null
        ? null
        : DynamicWidget.fromJson(json['separator'] as Map<String, dynamic>),
    shrinkWrap: json['shrinkWrap'] as bool? ?? false,
    isScrollable: json['isScrollable'] as bool? ?? true,
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height:
        WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
  );
}
