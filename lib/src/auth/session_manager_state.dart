import 'dart:async';
import 'dart:convert';
import 'package:serve_dynamic_ui/src/auth/auth_info.dart';
import 'package:serve_dynamic_ui/src/storage/index.dart';
import 'package:serve_dynamic_ui/src/utils/index.dart';

enum SessionEvent {
  undetermined,
  onAuthenticated,
  unAuthenticated,
  onAuthenticationInProgress,
  onAuthenticationExpired,
  notAuthenticated
}

class SessionManagerState {
  static final SessionManagerState _instance = SessionManagerState._privateConstructor();

  final String _authKey = 'AUTH_DETAILS';
  final SecureStorage _secureStorage = SecureStorage.instance;

  SessionManagerState._privateConstructor(){
    callUndetermined();
    _sendAuthenticatedStreamIfAuthenticated();
  }

  _sendAuthenticatedStreamIfAuthenticated() async{
    bool isValid = StringUtil.isNotEmptyNorNull(await _secureStorage.get(key: _authKey));
    if(isValid){
      _streamController.sink.add(SessionEvent.onAuthenticated);
    }
    else {
      callNotAuthenticated();
    }
  }

  static SessionManagerState get instance {
    return _instance;
  }

  final StreamController<SessionEvent> _streamController = StreamController<SessionEvent>.broadcast();

  Stream<SessionEvent> get sessionStream => _streamController.stream;

  void callUndetermined(){
    _streamController.sink.add(SessionEvent.undetermined);
  }

  void callUnAuthenticated() async{
    _streamController.sink.add(SessionEvent.unAuthenticated);
    await _secureStorage.delete(key: _authKey);
  }

  void callOnAuthenticated<T extends AuthInfo>(T authDetails) async{
    _streamController.sink.add(SessionEvent.onAuthenticated);
    await _secureStorage.put(key: _authKey, value: jsonEncode(authDetails.toJson()));
  }

  void callOnAuthenticationInProgress(){
    _streamController.sink.add(SessionEvent.onAuthenticationInProgress);
  }

  void callOnAuthenticationExpired() async{
    _streamController.sink.add(SessionEvent.onAuthenticationExpired);
    await _secureStorage.delete(key: _authKey);
  }

  void callNotAuthenticated(){
    _streamController.sink.add(SessionEvent.notAuthenticated);
  }
}
