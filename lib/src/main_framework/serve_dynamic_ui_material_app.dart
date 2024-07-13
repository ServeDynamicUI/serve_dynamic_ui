import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

///[ServeDynamicUIMaterialApp] : A top-level widget for building apps that follow material design.
class ServeDynamicUIMaterialApp extends StatefulWidget {
  const ServeDynamicUIMaterialApp({
    super.key,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    required this.home,
    Map<String, WidgetBuilder> this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    List<NavigatorObserver> this.navigatorObservers =
        const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.debugShowMaterialGrid = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.scrollBehavior,
    this.useInheritedMediaQuery = false,
  });

  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Widget Function(BuildContext) home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final Color? color;
  final bool debugShowCheckedModeBanner;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final ScrollBehavior? scrollBehavior;
  final bool debugShowMaterialGrid;
  final bool useInheritedMediaQuery;

  @override
  State<ServeDynamicUIMaterialApp> createState() =>
      _ServeDynamicUIMaterialAppState();
}

class _ServeDynamicUIMaterialAppState extends State<ServeDynamicUIMaterialApp> {
  @override
  void initState() {
    ServeDynamicUI.applicationCurrentNavigationKey = widget.navigatorKey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: widget.navigatorKey,
      scaffoldMessengerKey: widget.scaffoldMessengerKey,
      home: widget.home(context),
      routes: widget.routes ?? {},
      initialRoute: widget.initialRoute,
      onGenerateRoute: widget.onGenerateRoute,
      onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
      onUnknownRoute: widget.onUnknownRoute,
      navigatorObservers: widget.navigatorObservers ?? [],
      builder: widget.builder,
      title: widget.title,
      onGenerateTitle: widget.onGenerateTitle,
      theme: widget.theme,
      darkTheme: widget.darkTheme,
      color: widget.color,
      shortcuts: widget.shortcuts,
      actions: widget.actions,
      scrollBehavior: widget.scrollBehavior,
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      debugShowMaterialGrid: widget.debugShowMaterialGrid,
    );
  }
}
