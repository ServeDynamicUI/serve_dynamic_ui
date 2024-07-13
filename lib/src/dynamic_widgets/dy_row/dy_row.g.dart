// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicRow _$DynamicRowFromJson(Map<String, dynamic> json) {
  String key = Util.generateRandomString(15);
  return DynamicRow(
    key: key,
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
        .toList(),
    mainAxisAlignment:
        WidgetUtil.getMainAxisAlignment(json['mainAxisAlignment'] as String?),
    crossAxisAlignment:
        WidgetUtil.getCrossAxisAlignment(json['crossAxisAlignment'] as String?),
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height: WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
  );
}
