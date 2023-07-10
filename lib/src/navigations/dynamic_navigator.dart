import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/src/constants/index.dart';

abstract class DynamicNavigator {
  static Future<dynamic>? navigate<T extends Object?>({
    required BuildContext context,
    required String navigationStyle,
    required String navigationType,
    required Widget widget,
    EdgeInsets? insetPadding,
    T? result,
    String? routeName,
  }) {
    switch (navigationType) {
      case Strings.screen:
        return _navigateToScreen(
            context, navigationStyle, widget, result, routeName);
      case Strings.dialog:
        return _showDialog(context, widget, insetPadding);
      case Strings.bottomSheet:
        return _showBottomSheet(context, widget);
    }
    return null;
  }

  static void navigateToNamedRoute(
    BuildContext context, {
    required String routeName,
  }) {
    Navigator.pushNamed(context, routeName);
  }

  static Future<dynamic>? _navigateToScreen<T extends Object?>(
      BuildContext context,
      String navigationStyle,
      Widget widget,
      T? result,
      String? routeName) {
    switch (navigationStyle) {
      case Strings.push:
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => widget),
        );
      case Strings.pushAndRemoveAll:
        return Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => widget),
          ModalRoute.withName('/'),
        );
      case Strings.popAll:
        Navigator.popUntil(context, ModalRoute.withName('/'));
      case Strings.pop:
        Navigator.pop(context, result);
        break;
      case Strings.pushReplacement:
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => widget),
        );
      case Strings.pushNamed:
        return Navigator.pushNamed(context, routeName!);
    }
    return null;
  }

  static Future<dynamic> _showDialog(
      BuildContext context, Widget widget, EdgeInsets? insetPadding) {
    return showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: insetPadding,
        child: widget,
      ),
    );
  }

  static Future<dynamic> _showBottomSheet(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => widget,
    );
  }
}
