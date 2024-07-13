import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:serve_dynamic_ui/src/dtos/carousel_dto/carousel_dto.dart';

part 'dy_carousel.g.dart';

///[DynamicCarousel] : A dynamic widgets that that renders items in carousel.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicCarousel extends DynamicWidget {
  String key;
  List<DynamicWidget>? children;
  @JsonKey(defaultValue: false)
  bool reusable;
  @JsonKey(defaultValue: CarouselDto())
  CarouselDto carouselOptions;
  @JsonKey(fromJson: WidgetUtil.getHeightValueOrInf)
  double? height;
  @JsonKey(fromJson: WidgetUtil.getWidthValueOrInf)
  double? width;

  DynamicCarousel(
      {required this.key,
      this.height,
      this.width,
      this.children,
      this.reusable = false,
      this.carouselOptions = const CarouselDto(),
      })
      : super(
          key: key,
        );

  factory DynamicCarousel.fromJson(Map<String, dynamic> json) =>
      _$DynamicCarouselFromJson(json);


  CarouselController get _carouselController {
    DynamicProvider dynamicProvider =
    WidgetResolver.getTopAncestorOfType<DynamicProvider>(this)!;
    String controllerKey = key;
    if (dynamicProvider.controllerCache[controllerKey] != null) {
      return dynamicProvider.controllerCache[controllerKey];
    }
    CarouselController carouselController = CarouselController();
    dynamicProvider.controllerCache[controllerKey] = carouselController;
    return dynamicProvider.controllerCache[controllerKey];
  }

  final carousel = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Builder(builder: (context){
        if(reusable){
          return _reusableCarousel();
        }
        return _nonReusableCarousel();
      }),
    );
  }

  Widget _reusableCarousel() {
    return CarouselSlider.builder(
      carouselController: _carouselController,
      itemCount: children!.length,
      itemBuilder: (context, index, _) {
        return children![index].build(context);
      },
      options: _carouselOptions(),
    );
  }

  Widget _nonReusableCarousel() {
    return CarouselSlider(
      carouselController: _carouselController,
      options: _carouselOptions(),
      items: children!.map((child) {
        return Builder(
          builder: (BuildContext context) {
            return child.build(context);
          },
        );
      }).toList(),
    );
  }

  CarouselOptions _carouselOptions() {
    return CarouselOptions(
      height: carouselOptions.height,
      aspectRatio: carouselOptions.aspectRatio,
      viewportFraction: carouselOptions.viewportFraction,
      initialPage: carouselOptions.initialPage,
      enableInfiniteScroll: carouselOptions.enableInfiniteScroll,
      animateToClosest: carouselOptions.animateToClosest,
      reverse: carouselOptions.reverse,
      autoPlay: carouselOptions.autoPlay,
      autoPlayInterval: carouselOptions.autoPlayInterval,
      autoPlayAnimationDuration: carouselOptions.autoPlayAnimationDuration,
      autoPlayCurve: carouselOptions.autoPlayCurve,
      enlargeCenterPage: carouselOptions.enlargeCenterPage ?? false,
      scrollPhysics: carouselOptions.scrollPhysics,
      pageSnapping: carouselOptions.pageSnapping,
      scrollDirection: carouselOptions.scrollDirection,
      pauseAutoPlayOnTouch: carouselOptions.pauseAutoPlayOnTouch,
      pauseAutoPlayOnManualNavigate: carouselOptions.pauseAutoPlayOnManualNavigate,
      pauseAutoPlayInFiniteScroll: carouselOptions.pauseAutoPlayInFiniteScroll,
      pageViewKey: carouselOptions.pageViewKey,
      enlargeStrategy: carouselOptions.enlargeStrategy,
      enlargeFactor: carouselOptions.enlargeFactor,
      disableCenter: carouselOptions.disableCenter,
      padEnds: carouselOptions.padEnds,
      clipBehavior: carouselOptions.clipBehavior,
      onPageChanged: (index, changeReason){
        CarouselChangeListeners.callOnPageChanged(key, index, changeReason);
      },
      onScrolled: (value){
        CarouselChangeListeners.callOnScrolled(key, value);
      }
    );
  }

  @override
  List<DynamicWidget>? get childWidgets => children ?? [];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  void postBuild() {
  }

  @override
  void preBuild() {}

  @override
  void onDispose() {
    WidgetUtil.callOnDisposeOnWidgets(children);
  }

  @override
  double? get dyHeight => height;

  @override
  double? get dyWidth => width;
}
