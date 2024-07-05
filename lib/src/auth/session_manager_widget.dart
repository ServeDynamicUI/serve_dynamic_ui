import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/src/auth/session_manager_state.dart';

typedef WidgetCreator = Widget Function();

class SessionManagerWidget extends StatefulWidget {
  final WidgetCreator onUndetermined;
  final WidgetCreator onAuthenticated;
  final WidgetCreator unAuthenticated;
  final WidgetCreator onAuthenticationInProgress;
  final WidgetCreator onAuthenticationExpired;
  final WidgetCreator notAuthenticated;

  const SessionManagerWidget({
    super.key,
    required this.onUndetermined,
    required this.onAuthenticated,
    required this.unAuthenticated,
    required this.onAuthenticationInProgress,
    required this.onAuthenticationExpired,
    required this.notAuthenticated,
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
        print('SessionManagerWidget ${snapshot.data}');
        if(!snapshot.hasData){
          return widget.onUndetermined.call();
        }
        else {
          if (snapshot.data == SessionEvent.notAuthenticated) {
            return widget.notAuthenticated.call();
          } else if (snapshot.data == SessionEvent.onAuthenticated) {
            return widget.onAuthenticated.call();
          } else if (snapshot.data == SessionEvent.unAuthenticated) {
            return widget.unAuthenticated.call();
          } else if (snapshot.data == SessionEvent.onAuthenticationInProgress) {
            return widget.onAuthenticationInProgress.call();
          } else if (snapshot.data == SessionEvent.onAuthenticationExpired) {
            return widget.onAuthenticationExpired.call();
          } else{
            return widget.onUndetermined.call();
          }
        }
      },
    );
  }
}
