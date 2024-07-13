// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_percentage_indicator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicPercentageIndicator _$DynamicPercentageIndicatorFromJson(Map<String, dynamic> json) {
  return DynamicPercentageIndicator(
    key: (json['key'] as String?) ?? Util.generateRandomString(15),
      height: WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
      width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
      type: WidgetUtil.getPercentageIndicatorType(json['type'] as String?) ?? PercentageIndicatorType.linear,
      linearPercentIndicator: json['linearPercentIndicator'] == null ? LinearPercentIndicatorDTO() : LinearPercentIndicatorDTO.fromJson(json['linearPercentIndicator']),
      circularPercentIndicator: json['circularPercentIndicator'] == null ? CircularPercentIndicatorDTO() : CircularPercentIndicatorDTO.fromJson(json['circularPercentIndicator']),
  );
}
