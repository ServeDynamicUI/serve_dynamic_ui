import 'package:flutter/material.dart';

class SessionManagerWidget extends StatefulWidget {
  final Widget? onUndetermined;
  final Widget? onLoggedIn;
  final Widget? onLoggedOut;
  final Widget? onLoginInProgress;

  const SessionManagerWidget({
    super.key,
    this.onUndetermined,
    this.onLoginInProgress,
    this.onLoggedIn,
    this.onLoggedOut,
  });

  @override
  State<SessionManagerWidget> createState() => _SessionManagerWidgetState();
}

class _SessionManagerWidgetState extends State<SessionManagerWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
