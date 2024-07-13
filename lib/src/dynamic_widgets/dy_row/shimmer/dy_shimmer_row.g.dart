// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_shimmer_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicShimmerRow _$DynamicShimmerRowFromJson(Map<String, dynamic> json) {
  return DynamicShimmerRow(
    key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
    childItems: WidgetUtil.childrenFilter((json['childItems'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : DynamicWidget.fromJson(e as Map<String, dynamic>))
        .toList()),
    mainAxisAlignment:
        WidgetUtil.getMainAxisAlignment(json['mainAxisAlignment'] as String?),
    crossAxisAlignment:
        WidgetUtil.getCrossAxisAlignment(json['crossAxisAlignment'] as String?),
    itemCount: (json['itemCount'] as num?)?.toInt() ?? 5,
    interItemSpacing: (json['interItemSpacing'] as num?)?.toDouble() ?? 5,
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height:
        WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
  );
}
