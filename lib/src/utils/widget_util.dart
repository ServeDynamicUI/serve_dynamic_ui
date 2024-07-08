import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../serve_dynamic_ui.dart';
import '../main_framework/network_page/network_builder_state.dart';

///util class helping as convertors
class WidgetUtil {
  ///Returns the [Alignment] from string.
  static Alignment? getPositionalAlignment(String? alignment) {
    if (alignment != null && alignment.isNotEmpty) {
      switch (alignment) {
        case Strings.center:
          return Alignment.center;
        case Strings.centerLeft:
          return Alignment.centerLeft;
        case Strings.centerRight:
          return Alignment.centerRight;
        case Strings.topCenter:
          return Alignment.topCenter;
        case Strings.bottomCenter:
          return Alignment.bottomCenter;
      }
    }
    return null;
  }

  ///Returns the [MainAxisAlignment] from string.
  static MainAxisAlignment? getMainAxisAlignment(String? mainAxisAlignment) {
    if (mainAxisAlignment != null && mainAxisAlignment.isNotEmpty) {
      switch (mainAxisAlignment) {
        case Strings.center:
          return MainAxisAlignment.center;
        case Strings.start:
          return MainAxisAlignment.start;
        case Strings.end:
          return MainAxisAlignment.end;
        case Strings.spaceBetween:
          return MainAxisAlignment.spaceBetween;
        case Strings.spaceAround:
          return MainAxisAlignment.spaceAround;
        case Strings.spaceEvenly:
          return MainAxisAlignment.spaceEvenly;
      }
    }
    return null;
  }

  ///Returns the [CrossAxisAlignment] from string.
  static CrossAxisAlignment? getCrossAxisAlignment(String? crossAxisAlignment) {
    if (crossAxisAlignment != null && crossAxisAlignment.isNotEmpty) {
      switch (crossAxisAlignment) {
        case Strings.center:
          return CrossAxisAlignment.center;
        case Strings.start:
          return CrossAxisAlignment.start;
        case Strings.end:
          return CrossAxisAlignment.end;
        case Strings.stretch:
          return CrossAxisAlignment.stretch;
      }
    }
    return null;
  }

  ///Returns the [FontWeight] from string.
  static FontWeight? getFontWeight(String? weight) {
    if (weight == null || weight.isEmpty) {
      return null;
    }
    switch (weight.toLowerCase()) {
      case Strings.light:
        return FontWeight.w300;
      case Strings.regular:
        return FontWeight.w400;
      case Strings.medium:
        return FontWeight.w500;
      case Strings.semibold:
        return FontWeight.w600;
      case Strings.bold:
        return FontWeight.w700;
      default:
        return null;
    }
  }

  ///Returns the [TextOverflow] from string.
  static TextOverflow getTextOverflow(String? overflow) {
    if (overflow == null || overflow.isEmpty) {
      return TextOverflow.ellipsis;
    }
    switch (overflow.toLowerCase()) {
      case Strings.clip:
        return TextOverflow.clip;
      case Strings.fade:
        return TextOverflow.fade;
      case Strings.visible:
        return TextOverflow.visible;
      case Strings.ellipsis:
        return TextOverflow.ellipsis;
      default:
        return TextOverflow.ellipsis;
    }
  }

  ///Returns the [FontStyle] from string.
  static FontStyle? getFontStyle(String? style) {
    if (style == null || style.isEmpty) {
      return null;
    }
    switch (style.toLowerCase()) {
      case Strings.normal:
        return FontStyle.normal;
      case Strings.italic:
        return FontStyle.italic;
      default:
        return null;
    }
  }

  ///Returns the [Color] from string.
  static Color? getColor(String? color) {
    if (color != null) {
      return Color(int.parse(color));
    }
    return null;
  }

  ///Returns the [TextDirection] from string.
  static TextDirection? getTextDirection(String? textDirection) {
    if (textDirection == null || textDirection.isEmpty) {
      return null;
    }
    switch (textDirection.toLowerCase()) {
      case Strings.rtl:
        return TextDirection.rtl;
      case Strings.ltr:
        return TextDirection.ltr;
      default:
        return null;
    }
  }

  ///Returns the [TextAlign] from string.
  static TextAlign? getTextAlign(String? textAlign) {
    if (textAlign == null || textAlign.isEmpty) {
      return null;
    }
    switch (textAlign.toLowerCase()) {
      case Strings.start:
        return TextAlign.start;
      case Strings.end:
        return TextAlign.end;
      case Strings.left:
        return TextAlign.left;
      case Strings.right:
        return TextAlign.right;
      case Strings.center:
        return TextAlign.center;
      case Strings.justify:
        return TextAlign.justify;
      default:
        return null;
    }
  }

  ///Returns the [TextAlignVertical] from string.
  static TextAlignVertical? getTextAlignVertical(String? textAlignVertical) {
    if (textAlignVertical == null || textAlignVertical.isEmpty) {
      return null;
    }
    switch (textAlignVertical.toLowerCase()) {
      case Strings.top:
        return TextAlignVertical.top;
      case Strings.center:
        return TextAlignVertical.center;
      case Strings.bottom:
        return TextAlignVertical.bottom;
      default:
        return null;
    }
  }

  ///Returns the [TextCapitalization] from string.
  static TextCapitalization? getTextCapitalization(String? textCapitalization) {
    if (textCapitalization == null || textCapitalization.isEmpty) {
      return null;
    }
    switch (textCapitalization.toLowerCase()) {
      case Strings.none:
        return TextCapitalization.none;
      case Strings.characters:
        return TextCapitalization.characters;
      case Strings.words:
        return TextCapitalization.words;
      case Strings.sentences:
        return TextCapitalization.sentences;
      default:
        return null;
    }
  }

  ///Returns the [TextInputAction] from string.
  static TextInputAction? getTextInputAction(String? textInputAction) {
    if (textInputAction == null || textInputAction.isEmpty) {
      return null;
    }
    switch (textInputAction.toLowerCase()) {
      case Strings.none:
        return TextInputAction.none;
      case Strings.done:
        return TextInputAction.done;
      case Strings.go:
        return TextInputAction.go;
      case Strings.search:
        return TextInputAction.search;
      case Strings.next:
        return TextInputAction.next;
      case Strings.previous:
        return TextInputAction.previous;
      default:
        return null;
    }
  }

  ///Returns the [TextInputType] from string.
  static TextInputType? getTextInputType(String? textInputType) {
    if (textInputType == null || textInputType.isEmpty) {
      return null;
    }
    switch (textInputType.toLowerCase()) {
      case Strings.text:
        return TextInputType.text;
      case Strings.emailAddress:
        return TextInputType.emailAddress;
      case Strings.multiline:
        return TextInputType.multiline;
      case Strings.phone:
        return TextInputType.phone;
      case Strings.url:
        return TextInputType.url;
      case Strings.number:
        return TextInputType.number;
      default:
        return null;
    }
  }

  ///Returns the [TextStyle] from string.
  static TextStyle? getTextStyleFromDTO(TextStyleDTO? textStyleDTO) {
    if (textStyleDTO == null) {
      return null;
    }
    return TextStyle(
        color: textStyleDTO.color,
        backgroundColor: textStyleDTO.backgroundColor,
        fontSize: textStyleDTO.fontSize,
        fontWeight: textStyleDTO.fontWeight,
        overflow: textStyleDTO.textOverflow,
        fontStyle: textStyleDTO.fontStyle);
  }

  ///Returns the [StackFit] from string.
  static StackFit? getStackFit(String? fit) {
    if (fit == null || fit.isEmpty) {
      return null;
    } else {
      switch (fit) {
        case Strings.loose:
          return StackFit.loose;
        case Strings.expand:
          return StackFit.expand;
        case Strings.passthrough:
          return StackFit.passthrough;
        default:
          return null;
      }
    }
  }

  ///Returns the [Clip] from string.
  static Clip? getClipBehavior(String? behavior) {
    if (behavior == null || behavior.isEmpty) {
      return null;
    } else {
      switch (behavior) {
        case Strings.none:
          return Clip.none;
        case Strings.antiAlias:
          return Clip.antiAlias;
        case Strings.antiAliasWithSaveLayer:
          return Clip.antiAliasWithSaveLayer;
        case Strings.hardEdge:
          return Clip.hardEdge;
        default:
          return null;
      }
    }
  }

  ///Returns the [BoxFit] from string.
  static BoxFit? getBoxFit(String? boxFit) {
    if (boxFit == null || boxFit.isEmpty) {
      return null;
    } else {
      switch (boxFit) {
        case Strings.contain:
          return BoxFit.contain;
        case Strings.cover:
          return BoxFit.cover;
        case Strings.fill:
          return BoxFit.fill;
        case Strings.fitHeight:
          return BoxFit.fitHeight;
        case Strings.fitWidth:
          return BoxFit.fitWidth;
        case Strings.scaleDown:
          return BoxFit.scaleDown;
        case Strings.none:
          return BoxFit.none;
        default:
          return null;
      }
    }
  }

  ///Returns the [ImageType] from string.
  static ImageType? getImageType(String? type) {
    if (type == null || type.isEmpty) {
      return null;
    } else {
      switch (type) {
        case Strings.network:
          return ImageType.network;
        case Strings.asset:
          return ImageType.asset;
        case Strings.file:
          return ImageType.file;
        default:
          return null;
      }
    }
  }

  ///Returns the [EdgeInsets] from string.
  static EdgeInsets? getEdgeInsets(String? data) {
    if (data == null || data.isEmpty) {
      return null;
    }
    try {
      List<double> padding =
          data.split(',').map((String e) => double.parse(e)).toList();
      if (padding.length == 1) {
        return EdgeInsets.all(padding.first);
      } else if (padding.length == 2) {
        return EdgeInsets.symmetric(
          horizontal: padding[0],
          vertical: padding[1],
        );
      } else {
        return EdgeInsets.only(
          left: padding[0],
          top: padding[1],
          right: padding[2],
          bottom: padding[3],
        );
      }
    } catch (e) {
      return null;
    }
  }

  ///Returns the [LinearGradient] from string.
  static LinearGradient? getLinearGradient(String? gradient) {
    if (gradient == null || gradient.isEmpty) {
      return null;
    }
    try {
      List<String> gradientParts = gradient.split(';').toList();
      if (gradientParts.length == 3) {
        List<String> gradientColors = gradientParts[2].split(',').toList();
        return LinearGradient(
          begin: getAlignment(gradientParts.first) ?? Alignment.topLeft,
          end: getAlignment(gradientParts.last) ?? Alignment.bottomRight,
          colors: gradientColors
              .map((String e) => (getColor(e) ?? Colors.transparent))
              .toList(),
        );
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  ///Returns the [Alignment] from string.
  static Alignment? getAlignment(String? alignment) {
    if (alignment == null || alignment.isEmpty) {
      return null;
    }
    try {
      List<double> xyAlignment =
          alignment.split(',').map((String e) => double.parse(e)).toList();
      if (xyAlignment.isNotEmpty) {
        return Alignment(xyAlignment[0], xyAlignment[1]);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  ///Returns height [Double] from double or inf.
  static double? getHeightValueOrInf(double? value) {
    if (Util.isValid(value)) {
      MediaQueryData? mediaData = ServeDynamicUI.mediaQueryData;
      if(Util.isValid(mediaData)){
        return value! < 0 ? mediaData!.size.height - kToolbarHeight - mediaData.padding.top: value;
      }
    }
    return null;
  }

  ///Returns width [Double] from double or inf.
  static double? getWidthValueOrInf(double? value) {
    if (Util.isValid(value)) {
      MediaQueryData? mediaData = ServeDynamicUI.mediaQueryData;
      if(Util.isValid(mediaData)){
        return value! < 0 ? mediaData!.size.width : value;
      }
      return value! < 0 ? double.infinity : value;
    }
    return null;
  }

  ///Returns the [Duration] from string in format.
  /// 1:1:1:1:1 => 1d:1h:1m:1s:1ms or :10::10:10 => 0d:10h:0m:10s:10ms
  static Duration? getDuration(String? value) {
    if (StringUtil.isNotEmptyNorNull(value)) {
      return null;
    }
    List<String> time = value!.split(":");
    if(time.length != 5){
      return null;
    }
    return Duration(
      days: int.tryParse(time[0]) ?? 0,
      hours: int.tryParse(time[1]) ?? 0,
      minutes: int.tryParse(time[2]) ?? 0,
      seconds: int.tryParse(time[3]) ?? 0,
      milliseconds: int.tryParse(time[4]) ?? 0,
    );
  }

  ///Returns the [Curve] from string.
  static Curve? getCurve(String? value) {
    if (!StringUtil.isNotEmptyNorNull(value)) {
      return null;
    }

    switch (value!) {
      case 'linear':
        return Curves.linear;
      case 'decelerate':
        return Curves.decelerate;
      case 'ease':
        return Curves.ease;
      case 'easeIn':
        return Curves.easeIn;
      case 'easeOut':
        return Curves.easeOut;
      case 'easeInOut':
        return Curves.easeInOut;
      case 'fastOutSlowIn':
        return Curves.fastOutSlowIn;
      case 'bounceIn':
        return Curves.bounceIn;
      case 'bounceOut':
        return Curves.bounceOut;
      case 'bounceInOut':
        return Curves.bounceInOut;
      case 'elasticIn':
        return Curves.elasticIn;
      case 'elasticOut':
        return Curves.elasticOut;
      case 'elasticInOut':
        return Curves.elasticInOut;
      case 'easeInCubic':
        return Curves.easeInCubic;
      case 'easeOutCubic':
        return Curves.easeOutCubic;
      case 'easeInOutCubic':
        return Curves.easeInOutCubic;
      case 'easeInQuart':
        return Curves.easeInQuart;
      case 'easeOutQuart':
        return Curves.easeOutQuart;
      case 'easeInOutQuart':
        return Curves.easeInOutQuart;
      case 'easeInQuint':
        return Curves.easeInQuint;
      case 'easeOutQuint':
        return Curves.easeOutQuint;
      case 'easeInOutQuint':
        return Curves.easeInOutQuint;
      default:
        return null;
    }
  }

  ///Returns the [ScrollPhysics] from string.
  static ScrollPhysics? getScrollPhysics(String? value) {
    if (!StringUtil.isNotEmptyNorNull(value)) {
      return null;
    }

    switch (value!) {
      case 'bouncing':
        return const BouncingScrollPhysics();
      case 'clamping':
        return const ClampingScrollPhysics();
      case 'fixedExtent':
        return const FixedExtentScrollPhysics();
      case 'neverScrollable':
        return const NeverScrollableScrollPhysics();
      case 'page':
        return const PageScrollPhysics();
      case 'alwaysScrollable':
        return const AlwaysScrollableScrollPhysics();
      default:
        return null;
    }
  }

  ///Returns the [Axis] from string.
  static Axis? getAxis(String? value) {
    if (!StringUtil.isNotEmptyNorNull(value)) {
      return null;
    }

    switch (value!) {
      case 'horizontal':
        return Axis.horizontal;
      case 'vertical':
        return Axis.vertical;
      default:
        return null;
    }
  }

  ///Returns the enlargement strategy from string path.
  static CenterPageEnlargeStrategy? getCenterPageEnlargeStrategy(String? value) {
    if (!StringUtil.isNotEmptyNorNull(value)) {
      return null;
    }

    switch (value!) {
      case 'scale':
        return CenterPageEnlargeStrategy.scale;
      case 'height':
        return CenterPageEnlargeStrategy.height;
      case 'zoom':
        return CenterPageEnlargeStrategy.zoom;
      default:
        return null;
    }
  }

  ///Returns the [PercentageIndicatorType] from string.
  static PercentageIndicatorType? getPercentageIndicatorType(String? indicatorType) {
    if (StringUtil.isNotEmptyNorNull(indicatorType)) {
      switch (indicatorType!) {
        case Strings.circular:
          return PercentageIndicatorType.circular;
        case Strings.linear:
          return PercentageIndicatorType.linear;
      }
    }
    return null;
  }

  ///Returns the [CircularStrokeCap] from string.
  static CircularStrokeCap? getCircularStrokeCap(String? stroke){
    if (StringUtil.isNotEmptyNorNull(stroke)) {
      switch (stroke!) {
        case Strings.butt:
          return CircularStrokeCap.butt;
        case Strings.round:
          return CircularStrokeCap.round;
        case Strings.square:
          return CircularStrokeCap.square;
      }
    }
    return null;
  }

  ///Returns the [ArcType] from string.
  static ArcType? getArcType(String? arc){
    if (StringUtil.isNotEmptyNorNull(arc)) {
      switch (arc!) {
        case Strings.butt:
          return ArcType.FULL;
        case Strings.round:
          return ArcType.FULL_REVERSED;
        case Strings.square:
          return ArcType.HALF;
      }
    }
    return null;
  }

  ///Returns the map from string path.
  static Future<Map<String, dynamic>> loadJson(String path,
      {Map<String, String>? assetJsonValueReplacer}) async {
    final String data = await rootBundle.loadString(path);
    String jsonWithReplacedValues =
        StringUtil.replaceAllUsingReplacers(data, assetJsonValueReplacer) ?? '';
    final Map<String, dynamic> json = jsonDecode(jsonWithReplacedValues);
    return json;
  }

  static List<DynamicWidget> childrenFilter(List<DynamicWidget?>? widgets) {
    if (widgets == null) return [];
    return List.from(widgets.where(_validWidget).toList());
  }

  static bool _validWidget(DynamicWidget? widget) => widget != null;

  static List<Widget> dynamicWidgetsSpacing(
      BuildContext context, List<DynamicWidget>? widgets, double spacing,
      {isHorizontal = true}) {
    List<Widget> filteredWidgets = childrenFilter(widgets)
        .map((dyWidget) => dyWidget.build(context))
        .toList();

    List<Widget> spacedWidgets = [];

    for (int index = 0; index < filteredWidgets.length; index++) {
      Widget widget = filteredWidgets[index];
      if (index == 0) {
        if (isHorizontal) {
          spacedWidgets.add(
            SizedBox(
              width: spacing,
            ),
          );
        } else {
          spacedWidgets.add(
            SizedBox(
              height: spacing,
            ),
          );
        }
      }
      spacedWidgets.add(widget);
      if (isHorizontal) {
        spacedWidgets.add(
          SizedBox(
            width: spacing,
          ),
        );
      } else {
        spacedWidgets.add(
          SizedBox(
            height: spacing,
          ),
        );
      }
    }

    return spacedWidgets;
  }

  static List<Widget> widgetsSpacing(List<Widget>? widgets, double spacing,
      {isHorizontal = true}) {
    if (widgets == null) return [];

    List<Widget> spacedWidgets = [];

    for (int index = 0; index < widgets.length; index++) {
      Widget widget = widgets[index];
      if (index == 0) {
        if (isHorizontal) {
          spacedWidgets.add(
            SizedBox(
              width: spacing,
            ),
          );
        } else {
          spacedWidgets.add(
            SizedBox(
              height: spacing,
            ),
          );
        }
      }
      spacedWidgets.add(widget);
      if (isHorizontal) {
        spacedWidgets.add(
          SizedBox(
            width: spacing,
          ),
        );
      } else {
        spacedWidgets.add(
          SizedBox(
            height: spacing,
          ),
        );
      }
    }

    return spacedWidgets;
  }

  ///this is a method helps to create [DynamicWidget] from passed json.
  static Widget? fromJson(Map<String, dynamic>? json, BuildContext context,
      {NetworkBuilderState? networkState}) {
    try {
      if (json != null) {
        DynamicWidget dynamicWidget = DynamicWidget.fromJson(json);
        DynamicProvider dynamicProvider =
            DynamicProvider(dynamicWidget as DynamicScaffold);
        networkState?.assignNetworkStateChild(dynamicProvider);
        return dynamicProvider.build(context);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static void callOnDisposeOnWidget(DynamicWidget? widget) {
    widget?.onDispose();
  }

  static void callOnDisposeOnWidgets(List<DynamicWidget>? widgets) {
    widgets?.forEach((widget) {
      callOnDisposeOnWidget(widget);
    });
  }
}
