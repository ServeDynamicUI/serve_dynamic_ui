// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicImage _$DynamicImageFromJson(Map<String, dynamic> json) {
  return DynamicImage(
      key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
      src: json['src'] as String,
      alignment:
          WidgetUtil.getPositionalAlignment(json['alignment'] as String?),
      color: WidgetUtil.getColor(json['color'] as String?),
      width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
      height:
          WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
      fit: WidgetUtil.getBoxFit(json['fit'] as String?),
      imageType: WidgetUtil.getImageType(json['imageType'] as String?),
      clipBorderRadius: (json['clipBorderRadius'] as num?)?.toDouble(),
      placeholderImagePath: json['placeholderImagePath'] as String?,
      transitionDuration:
          WidgetUtil.getDuration(json['transitionDuration'] as String?));
}
