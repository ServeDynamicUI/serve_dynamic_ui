// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_column.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicColumn _$DynamicColumnFromJson(Map<String, dynamic> json) {
  return DynamicColumn(
    key: (json['key'] as String?) ?? Util.generateRandomString(15),
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
        .toList(),
    mainAxisAlignment:
        WidgetUtil.getMainAxisAlignment(json['mainAxisAlignment'] as String?),
    crossAxisAlignment:
        WidgetUtil.getCrossAxisAlignment(json['crossAxisAlignment'] as String?),
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height: WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
    interItemSpacing: (json['interItemSpacing'] as num?)?.toDouble() ?? 0.0,
  );
}
