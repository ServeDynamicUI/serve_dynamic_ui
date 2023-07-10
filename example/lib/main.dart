import 'package:example/custom_actions/snackbar_action_handler.dart';
import 'package:example/listeners_impl/widget_scroll_listener.dart';
import 'package:example/custom_widgets/dy_widget_card.dart';
import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'listeners_impl/text_update_listener.dart';

void main() {
  Map<String, DynamicWidgetHandler> widgetHandlerMap = {
    "dy_widget_card": (json) => DynamicWidgetCard.fromJson(json)
  };

  Map<RegExp, ActionHandler> actionHandlerMap = {
    RegExp(r'(^/?showSnackbar/?$)'): SnackBarActionHandler()
  };

  ServeDynamicUI.init(
    widgetHandlers: widgetHandlerMap,
    actionHandlers: actionHandlerMap,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: 'Flutter Demo Home Page');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    ScrollListeners.addScrollListener(WidgetScrollListener());
    TextChangeListeners.addTextChangeListener(TextUpdateListener());
  }

  @override
  Widget build(BuildContext context) {
    return ServeDynamicUIMaterialApp(
      home: (context) {
        return ServeDynamicUI.fromAssets('assets/json/sample.json', context);
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
      ),
    );
  }
}
