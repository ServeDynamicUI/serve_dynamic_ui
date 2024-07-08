import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

part 'appbar_dto.g.dart';

@JsonSerializable()
class AppBarDto {
  Key? key;
  DynamicWidget? leading;
  bool automaticallyImplyLeading;
  String? pageTitle;
  DynamicWidget? title;
  List<DynamicWidget>? leftActions;
  List<DynamicWidget>? rightActions;
  DynamicWidget? flexibleSpace;
  DynamicWidget? bottom;
  double? elevation;
  double? scrolledUnderElevation;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? shadowColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? surfaceTintColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? backgroundColor;
  @JsonKey(fromJson: WidgetUtil.getColor)
  Color? foregroundColor;
  bool primary;
  bool? centerTitle;
  bool excludeHeaderSemantics;
  double? titleSpacing;
  double toolbarOpacity;
  double bottomOpacity;
  double? toolbarHeight;
  double? leadingWidth;
  TextStyleDTO? toolbarTextStyle;
  TextStyleDTO? titleTextStyle;
  bool forceMaterialTransparency;
  @JsonKey(fromJson: WidgetUtil.getClipBehavior)
  Clip? clipBehavior;
  double? leftActionsWidth;
  @JsonKey(fromJson: WidgetUtil.getLinearGradient)
  LinearGradient? appBarGradient;

  AppBarDto({
    this.key,
    this.pageTitle,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.leftActions,
    this.rightActions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.backgroundColor,
    this.foregroundColor,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
    this.leftActionsWidth,
    this.appBarGradient,
  });

  factory AppBarDto.fromJson(Map<String, dynamic> json) => _$AppBarDtoFromJson(json);

}
