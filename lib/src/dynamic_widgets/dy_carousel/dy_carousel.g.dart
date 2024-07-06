// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_carousel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicCarousel _$DynamicCarouselFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicCarousel(
    key: json['key'] as String?,
    width: (json['width'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    children: WidgetUtil.childrenFilter(
        (json['children'] as List<dynamic>?)
            ?.map((e) => e == null
            ? null
            : DynamicWidget.fromJson(e as Map<String, dynamic>))
            .toList()),
    reusable: json['reusable'] as bool? ?? false,
    carouselOptions: json['carouselOptions'] == null ? const CarouselDto() : CarouselDto.fromJson(json['carouselOptions'] as Map<String, dynamic>)
  );
}
