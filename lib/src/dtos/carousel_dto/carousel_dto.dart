import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/src/utils/index.dart';

part 'carousel_dto.g.dart';

///[CarouselDto] contains the properties required for carousel options
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class CarouselDto {
  @JsonKey(defaultValue: 200)
  final double height;

  @JsonKey(defaultValue: 16 / 9)
  final double aspectRatio;

  @JsonKey(defaultValue: 0.8)
  final double viewportFraction;

  @JsonKey(defaultValue: 0)
  final int initialPage;

  @JsonKey(defaultValue: true)
  final bool enableInfiniteScroll;

  @JsonKey(defaultValue: true)
  final bool animateToClosest;

  @JsonKey(defaultValue: false)
  final bool reverse;

  @JsonKey(defaultValue: false)
  final bool autoPlay;

  @JsonKey(fromJson: WidgetUtil.getDuration, defaultValue: Duration(seconds: 4))
  final Duration autoPlayInterval;

  @JsonKey(fromJson: WidgetUtil.getDuration, defaultValue: Duration(milliseconds: 800))
  final Duration autoPlayAnimationDuration;

  @JsonKey(fromJson: WidgetUtil.getCurve, defaultValue: Curves.fastOutSlowIn)
  final Curve autoPlayCurve;

  @JsonKey(defaultValue: false)
  final bool? enlargeCenterPage;

  @JsonKey(fromJson: WidgetUtil.getScrollPhysics)
  final ScrollPhysics? scrollPhysics;

  @JsonKey(defaultValue: true)
  final bool pageSnapping;

  @JsonKey(fromJson: WidgetUtil.getAxis, defaultValue: Axis.horizontal)
  final Axis scrollDirection;

  @JsonKey(defaultValue: true)
  final bool pauseAutoPlayOnTouch;

  @JsonKey(defaultValue: true)
  final bool pauseAutoPlayOnManualNavigate;

  @JsonKey(defaultValue: false)
  final bool pauseAutoPlayInFiniteScroll;

  final PageStorageKey<String>? pageViewKey;

  @JsonKey(fromJson: WidgetUtil.getCenterPageEnlargeStrategy, defaultValue: CenterPageEnlargeStrategy.scale)
  final CenterPageEnlargeStrategy enlargeStrategy;

  @JsonKey(defaultValue: 0.3)
  final double enlargeFactor;

  @JsonKey(defaultValue: false)
  final bool disableCenter;

  @JsonKey(defaultValue: true)
  final bool padEnds;

  @JsonKey(fromJson: WidgetUtil.getClip, defaultValue: Clip.hardEdge)
  final Clip clipBehavior;

  const CarouselDto({
    this.height = 200.0,
    this.aspectRatio = 16 / 9,
    this.viewportFraction = 0.8,
    this.initialPage = 0,
    this.enableInfiniteScroll = true,
    this.animateToClosest = true,
    this.reverse = false,
    this.autoPlay = false,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
    this.autoPlayCurve = Curves.fastOutSlowIn,
    this.enlargeCenterPage = false,
    this.scrollPhysics,
    this.pageSnapping = true,
    this.scrollDirection = Axis.horizontal,
    this.pauseAutoPlayOnTouch = true,
    this.pauseAutoPlayOnManualNavigate = true,
    this.pauseAutoPlayInFiniteScroll = false,
    this.pageViewKey,
    this.enlargeStrategy = CenterPageEnlargeStrategy.scale,
    this.enlargeFactor = 0.3,
    this.disableCenter = false,
    this.padEnds = true,
    this.clipBehavior = Clip.hardEdge,
  });

  factory CarouselDto.fromJson(Map<String, dynamic> json) => _$CarouselDtoFromJson(json);

  @override
  String toString() {
    return 'CarouselDto{height: $height, aspectRatio: $aspectRatio, viewportFraction: $viewportFraction, initialPage: $initialPage, enableInfiniteScroll: $enableInfiniteScroll, animateToClosest: $animateToClosest, reverse: $reverse, autoPlay: $autoPlay, autoPlayInterval: $autoPlayInterval, autoPlayAnimationDuration: $autoPlayAnimationDuration, autoPlayCurve: $autoPlayCurve, enlargeCenterPage: $enlargeCenterPage, scrollPhysics: $scrollPhysics, pageSnapping: $pageSnapping, scrollDirection: $scrollDirection, pauseAutoPlayOnTouch: $pauseAutoPlayOnTouch, pauseAutoPlayOnManualNavigate: $pauseAutoPlayOnManualNavigate, pauseAutoPlayInFiniteScroll: $pauseAutoPlayInFiniteScroll, pageViewKey: $pageViewKey, enlargeStrategy: $enlargeStrategy, enlargeFactor: $enlargeFactor, disableCenter: $disableCenter, padEnds: $padEnds, clipBehavior: $clipBehavior}';
  }
}

