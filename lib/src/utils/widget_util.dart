import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serve_dynamic_ui/src/constants/index.dart';
import 'package:serve_dynamic_ui/src/dtos/index.dart';

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
          end: getAlignment(gradientParts.last) ??
              Alignment.bottomRight,
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
      List<double> xyAlignment = alignment.split(',').map((String e) => double.parse(e)).toList();
      if (xyAlignment.isNotEmpty) {
        return Alignment(xyAlignment[0], xyAlignment[1]);
      }
    } catch (e) {
      return null;
    }
    return null;
  }


  ///Returns the map from string path.
  static Future<Map<String, dynamic>> loadJson(String path) async {
    final String data = await rootBundle.loadString(path);
    final Map<String, dynamic> json = jsonDecode(data);
    return json;
  }
}
