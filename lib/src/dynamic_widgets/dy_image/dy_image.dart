import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'dy_image.g.dart';

///[DynamicImage] : A dynamic widget that helps to render an image from **network**, **asset** and **file**.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicImage extends DynamicWidget {
  String src;
  String? placeholderImagePath;
  @JsonKey(fromJson: WidgetUtil.getPositionalAlignment)
  Alignment? alignment;
  @JsonKey(fromJson: WidgetUtil.getImageType)
  ImageType? imageType;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? color;
  @JsonKey(fromJson: WidgetUtil.getHeightValueOrInf)
  double? height;
  @JsonKey(fromJson: WidgetUtil.getWidthValueOrInf)
  double? width;
  @JsonKey(fromJson: WidgetUtil.getBoxFit)
  BoxFit? fit;
  double? clipBorderRadius;
  @JsonKey(fromJson: WidgetUtil.getDuration)
  Duration? transitionDuration;

  DynamicImage(
      {String? key,
      required this.src,
      this.alignment,
      this.color,
      this.width,
      this.height,
      this.fit,
      this.imageType,
      this.clipBorderRadius,
      this.placeholderImagePath,
      this.transitionDuration,
      })
      : super(
          key: key ?? "",
        );

  factory DynamicImage.fromJson(Map<String, dynamic> json) =>
      _$DynamicImageFromJson(json);

  @override
  Widget build(BuildContext context) {
    if (imageType == null) {
      return const SizedBox.shrink();
    } else {
      switch (imageType) {
        case ImageType.asset:
          return ClipRRect(
            borderRadius: BorderRadius.circular(clipBorderRadius ?? 0),
            child: _assetImage(),
          );
        case ImageType.network:
          return ClipRRect(
            borderRadius: BorderRadius.circular(clipBorderRadius ?? 0),
            child: _networkImage(),
          );
        case ImageType.file:
          return ClipRRect(
            borderRadius: BorderRadius.circular(clipBorderRadius ?? 0),
            child: _fileImage(),
          );
        default:
          return const SizedBox.shrink();
      }
    }
  }

  Widget _networkImage() => CachedNetworkImage(
        imageUrl: src,
        alignment: alignment ?? Alignment.center,
        color: color,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url){
          return _placeholderWidget();
        },
        fadeInDuration: transitionDuration ?? const Duration(seconds: 1),
        fadeOutDuration: transitionDuration ?? const Duration(seconds: 1),
        errorWidget: (context, url, error) {
          return _placeholderWidget();
        },
      );

  Widget _fileImage() => Image.file(
        File(src),
        alignment: alignment ?? Alignment.center,
        color: color,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return _placeholderWidget();
        },
      );

  Widget _assetImage() => Image.asset(
        src,
        alignment: alignment ?? Alignment.center,
        color: color,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return _placeholderWidget();
        },
      );

  Widget _placeholderWidget() {
    if (placeholderImagePath == null) {
      return const SizedBox.shrink();
    }
    return Image.asset(
      placeholderImagePath!,
      alignment: alignment ?? Alignment.center,
      color: color,
      width: width,
      height: height,
      fit: fit,
    );
  }

  @override
  List<DynamicWidget>? get childWidgets => [];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  void postBuild() {}

  @override
  void preBuild() {}

  @override
  void onDispose() {}

  @override
  double? get dyHeight => height;

  @override
  double? get dyWidth => width;
}
