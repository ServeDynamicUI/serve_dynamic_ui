import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/src/auth/session_manager_state.dart';
typedef WidgetCreator = Widget Function();
typedef WidgetContainer = Widget Function(Widget widget);

class SessionManagerWidget extends StatefulWidget {
  final WidgetCreator onUndetermined;
  final WidgetCreator onAuthenticated;
  final WidgetCreator deAuthenticated;
  final WidgetCreator? onAuthenticationInProgress;
  final WidgetCreator? onAuthenticationExpired;
  final WidgetCreator notAuthenticated;
  final WidgetCreator? deAuthenticationInProgress;
  final WidgetContainer? widgetContainer;

  const SessionManagerWidget({
    super.key,
    required this.onUndetermined,
    required this.onAuthenticated,
    required this.deAuthenticated,
    required this.onAuthenticationInProgress,
    required this.onAuthenticationExpired,
    required this.notAuthenticated,
    this.deAuthenticationInProgress,
    this.widgetContainer,
  });

  @override
  State<SessionManagerWidget> createState() => _SessionManagerWidgetState();
}

class _SessionManagerWidgetState extends State<SessionManagerWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: SessionManagerState.instance.sessionStream,
      builder: (context, snapshot) {
        Widget child;
        if (!snapshot.hasData) {
          child = widget.onUndetermined.call();
        } else {
          if (snapshot.data is SessionNotAuthenticatedEvent) {
            child = widget.notAuthenticated.call();
          } else if (snapshot.data is SessionOnAuthenticatedEvent) {
            child = widget.onAuthenticated.call();
          } else if (snapshot.data is SessionDeAuthenticatedEvent) {
            child = widget.deAuthenticated.call();
          } else if (snapshot.data is SessionOnAuthenticationInProgressEvent && widget.onAuthenticationInProgress != null) {
            child = widget.onAuthenticationInProgress!.call();
          } else if (snapshot.data is SessionAuthenticationExpiredEvent && widget.onAuthenticationExpired != null) {
            child = widget.onAuthenticationExpired!.call();
          } else if (snapshot.data is SessionDeAuthenticationInProgressEvent && widget.deAuthenticationInProgress != null) {
            child = widget.deAuthenticationInProgress!.call();
          } else {
            child = widget.onUndetermined.call();
          }
        }

        if(widget.widgetContainer != null){
          return widget.widgetContainer!(child);
        }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: Tween<double>(begin: 0.8, end: 1.0).animate(animation), child: child);
          },
          child: child,
        );
      },
    );
  }
}
