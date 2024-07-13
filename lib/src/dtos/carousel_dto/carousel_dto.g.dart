// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarouselDto _$CarouselDtoFromJson(Map<String, dynamic> json) {
  return CarouselDto(
    height: (json['height'] as num?)?.toDouble() ?? 200.0,
    aspectRatio: (json['aspectRatio'] as num?)?.toDouble() ?? 16 / 9,
    viewportFraction: (json['viewportFraction'] as num?)?.toDouble() ?? 0.8,
    initialPage: json['initialPage'] as int? ?? 0,
    enableInfiniteScroll: json['enableInfiniteScroll'] as bool? ?? true,
    animateToClosest: json['animateToClosest'] as bool? ?? true,
    reverse: json['reverse'] as bool? ?? false,
    autoPlay: json['autoPlay'] as bool? ?? false,
    autoPlayInterval: json['autoPlayInterval'] == null
        ? const Duration(seconds: 4)
        : WidgetUtil.getDuration(json['autoPlayInterval'] as String?) ??
            const Duration(seconds: 4),
    autoPlayAnimationDuration: json['autoPlayAnimationDuration'] == null
        ? const Duration(milliseconds: 800)
        : WidgetUtil.getDuration(
                json['autoPlayAnimationDuration'] as String?) ??
            const Duration(milliseconds: 800),
    autoPlayCurve: json['autoPlayCurve'] == null
        ? Curves.fastOutSlowIn
        : WidgetUtil.getCurve(json['autoPlayCurve'] as String?) ??
            Curves.fastOutSlowIn,
    enlargeCenterPage: json['enlargeCenterPage'] as bool? ?? false,
    scrollPhysics:
        WidgetUtil.getScrollPhysics(json['scrollPhysics'] as String?),
    pageSnapping: json['pageSnapping'] as bool? ?? true,
    scrollDirection: WidgetUtil.getAxis(json['scrollDirection'] as String?) ??
        Axis.horizontal,
    pauseAutoPlayOnTouch: json['pauseAutoPlayOnTouch'] as bool? ?? true,
    pauseAutoPlayOnManualNavigate:
        json['pauseAutoPlayOnManualNavigate'] as bool? ?? true,
    pauseAutoPlayInFiniteScroll:
        json['pauseAutoPlayInFiniteScroll'] as bool? ?? false,
    pageViewKey: json['pageViewKey'] == null
        ? null
        : PageStorageKey(json['pageViewKey']),
    enlargeStrategy: WidgetUtil.getCenterPageEnlargeStrategy(
            json['enlargeStrategy'] as String?) ??
        CenterPageEnlargeStrategy.scale,
    enlargeFactor: (json['enlargeFactor'] as num?)?.toDouble() ?? 0.3,
    disableCenter: json['disableCenter'] as bool? ?? false,
    padEnds: json['padEnds'] as bool? ?? true,
    clipBehavior: WidgetUtil.getClipBehavior(json['clipBehavior'] as String?) ??
        Clip.hardEdge,
  );
}
