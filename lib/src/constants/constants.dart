import 'package:flutter/material.dart';

import '../dynamic_widgets/index.dart';

typedef DynamicWidgetHandler = DynamicWidget Function(
    Map<String, dynamic> json);

typedef ShowErrorWidgetBuilder = DynamicWidget? Function(
  BuildContext context,
  dynamic error,
);

typedef ShowLoaderWidgetBuilder = DynamicWidget? Function(BuildContext context);
