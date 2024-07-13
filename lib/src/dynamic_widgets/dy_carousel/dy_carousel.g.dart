// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_carousel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicCarousel _$DynamicCarouselFromJson(Map<String, dynamic> json) {
  return DynamicCarousel(
      key: (json['key'] as String?) ?? Util.generateRandomString(15),
      width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
      height:
          WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
      children: WidgetUtil.childrenFilter((json['children'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : DynamicWidget.fromJson(e as Map<String, dynamic>))
          .toList()),
      reusable: json['reusable'] as bool? ?? false,
      carouselOptions: json['carouselOptions'] == null
          ? const CarouselDto()
          : CarouselDto.fromJson(
              json['carouselOptions'] as Map<String, dynamic>));
}
