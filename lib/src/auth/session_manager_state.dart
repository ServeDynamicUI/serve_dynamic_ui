import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:serve_dynamic_ui/src/storage/index.dart';
import 'package:serve_dynamic_ui/src/utils/index.dart';

///[SessionEvent] this event is the base for all session events.
abstract class SessionEvent {}

///[SessionUndeterminedEvent] this event means session state is not yet determined to make any decision.
class SessionUndeterminedEvent extends SessionEvent {}

///[SessionOnAuthenticatedEvent] this event means user is authenticated.
class SessionOnAuthenticatedEvent extends SessionEvent {
  final Map<String, dynamic>? authInfo;

  SessionOnAuthenticatedEvent({this.authInfo}) {
    SessionManagerState.storeAuthDetails(authDetails: authInfo);
  }
}

///[SessionDeAuthenticatedEvent] this event means user chose to log out.
class SessionDeAuthenticatedEvent extends SessionEvent {
  SessionDeAuthenticatedEvent() {
    SessionManagerState.clearAuthDetails();
  }
}

///[SessionDeAuthenticationInProgressEvent] this event means user chose to log out and it is in progress.
class SessionDeAuthenticationInProgressEvent extends SessionEvent {}

///[SessionAuthenticationExpiredEvent] this event means authentication state expired.
class SessionAuthenticationExpiredEvent extends SessionEvent {
  SessionAuthenticationExpiredEvent() {
    SessionManagerState.clearAuthDetails();
  }
}

///[SessionOnAuthenticationInProgressEvent] this event means user authentication in progress.
class SessionOnAuthenticationInProgressEvent extends SessionEvent {}

///[SessionNotAuthenticatedEvent] this event means user is not authenticated.
class SessionNotAuthenticatedEvent extends SessionEvent {}

///[SessionAuthenticationFailedEvent] this event means user authentication failed.
class SessionAuthenticationFailedEvent extends SessionEvent {
  String? error;

  SessionAuthenticationFailedEvent(this.error);
}

///[SessionManagerState] singleton class which handles all the session related tasks.
class SessionManagerState {
  static final SessionManagerState _instance =
      SessionManagerState._privateConstructor();

  static const String _authKey = 'AUTH_DETAILS';
  static const String _authSessionKey = 'AUTH_SESSION_KEY';
  static final SecureStorage _secureStorage = SecureStorage.instance;

  SessionManagerState._privateConstructor() {
    _sessionStreamController.sink.add(SessionUndeterminedEvent());
    _sendAuthenticatedStreamIfAuthenticated();
  }

  ///singleton instance of [SessionManagerState]
  static SessionManagerState get instance {
    return _instance;
  }

  final StreamController<SessionEvent> _sessionStreamController =
      StreamController<SessionEvent>.broadcast();

  ///stream thorugh which events are received
  Stream<SessionEvent> get sessionStream => _sessionStreamController.stream;

  ///controller to pass the events
  StreamController<SessionEvent> get sessionStreamController =>
      _sessionStreamController;

  static String generateRandomSessionString(int length) {
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return List.generate(
            length, (index) => characters[random.nextInt(characters.length)])
        .join();
  }

  static Future<void> clearAuthDetails() async {
    await _secureStorage.delete(key: _authKey);
    await _secureStorage.delete(key: _authSessionKey);
  }

  static Future<void> storeAuthDetails({dynamic authDetails}) async {
    if (authDetails is Map) {
      await _secureStorage.put(key: _authKey, value: jsonEncode(authDetails));
    }
    await _secureStorage.put(
        key: _authSessionKey, value: generateRandomSessionString(10));
  }

  _sendAuthenticatedStreamIfAuthenticated() async {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      bool isValid = StringUtil.isNotEmptyNorNull(
          await _secureStorage.get(key: _authSessionKey));
      if (isValid) {
        _sessionStreamController.sink.add(SessionOnAuthenticatedEvent());
      } else {
        _sessionStreamController.sink.add(SessionNotAuthenticatedEvent());
      }
    });
  }

  ///dispose the stream
  void dispose() async {
    await _sessionStreamController.close();
  }
}
