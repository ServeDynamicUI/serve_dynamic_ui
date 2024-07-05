import 'package:example/custom_actions/snackbar_action_handler.dart';
import 'package:example/listeners_impl/widget_scroll_listener.dart';
import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'custom_widgets/dy_widget_card.dart';
import 'custom_widgets/shimmer/dy_shimmer_widget_card.dart';
import 'listeners_impl/text_update_listener.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, DynamicWidgetHandler> widgetHandlerMap = {
    "dy_widget_card": (json) => DynamicWidgetCard.fromJson(json),
    "dy_shimmer_widget_card": (json) => DynamicShimmerWidgetCard.fromJson(json),
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
    DynamicListeners.addListener("1212133344", WidgetScrollListener());
    DynamicListeners.addListener("334343434", TextUpdateListener());
  }

  @override
  Widget build(BuildContext context) {
    return ServeDynamicUIMaterialApp(
      home: (context) {
        return SessionManagerWidget(
          onUndetermined: () {
            return const SizedBox();
          },
          onAuthenticated: () {
            return ServeDynamicUI.fromNetwork(
              DynamicRequest(
                url:
                'https://raw.githubusercontent.com/ServeDynamicUI/serve_dynamic_ui/page-caching-support/example/assets/json/list_view.json?isPageCacheEnabled=true',
                requestType: RequestType.get,
              ),
              templateJsonPath:
              'assets/json/shimmer_pages/default_page_shimmer.json',
            );
          },
          unAuthenticated: () {
            return ServeDynamicUI.fromNetwork(
              DynamicRequest(
                url:
                'https://raw.githubusercontent.com/ServeDynamicUI/serve_dynamic_ui/page-caching-support/example/assets/json/sample.json?isPageCacheEnabled=true',
                requestType: RequestType.get,
              ),
              templateJsonPath:
              'assets/json/shimmer_pages/default_page_shimmer.json',
            );
          },
          onAuthenticationInProgress: () {
            return SizedBox();
          },
          onAuthenticationExpired: () {
            return SizedBox();
          },
          notAuthenticated: () {
            return ServeDynamicUI.fromNetwork(
              DynamicRequest(
                url:
                'https://raw.githubusercontent.com/ServeDynamicUI/serve_dynamic_ui/page-caching-support/example/assets/json/sample.json?isPageCacheEnabled=true',
                requestType: RequestType.get,
              ),
              templateJsonPath:
              'assets/json/shimmer_pages/default_page_shimmer.json',
            );
          },
        );
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
