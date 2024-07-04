import 'package:flutter/material.dart';

///[ServeDynamicUIMaterialApp] : A top-level widget for building apps that follow material design.
class ServeDynamicUIMaterialApp extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: home(context),
      routes: routes ?? {},
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers ?? [],
      builder: builder,
      title: title,
      onGenerateTitle: onGenerateTitle,
      theme: theme,
      darkTheme: darkTheme,
      color: color,
      shortcuts: shortcuts,
      actions: actions,
      scrollBehavior: scrollBehavior,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      debugShowMaterialGrid: debugShowMaterialGrid,
    );
  }
}
