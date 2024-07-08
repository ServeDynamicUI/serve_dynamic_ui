import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:serve_dynamic_ui/src/auth/auth_info.dart';
import 'package:serve_dynamic_ui/src/auth/index.dart';
import 'package:serve_dynamic_ui/src/storage/index.dart';
import 'package:serve_dynamic_ui/src/utils/index.dart';
import 'package:flutter/material.dart';

abstract class SessionEvent {}

class SessionUndeterminedEvent extends SessionEvent {}

class SessionOnAuthenticatedEvent<T extends AuthInfo> extends SessionEvent {
  final T? authInfo;

  SessionOnAuthenticatedEvent({this.authInfo}){
    SessionManagerState.storeAuthDetails(authDetails: authInfo);
  }
}

class SessionDeAuthenticatedEvent extends SessionEvent {
  SessionDeAuthenticatedEvent(){
    SessionManagerState.clearAuthDetails();
  }
}

class SessionDeAuthenticationInProgressEvent extends SessionEvent {}

class SessionAuthenticationExpiredEvent extends SessionEvent {
  SessionAuthenticationExpiredEvent(){
    SessionManagerState.clearAuthDetails();
  }
}

class SessionOnAuthenticationInProgressEvent extends SessionEvent {}

class SessionNotAuthenticatedEvent extends SessionEvent {}

class SessionManagerState {
  static final SessionManagerState _instance = SessionManagerState._privateConstructor();

  static const String _authKey = 'AUTH_DETAILS';
  static const String _authSessionKey = 'AUTH_SESSION_KEY';
  static final SecureStorage _secureStorage = SecureStorage.instance;

  SessionManagerState._privateConstructor(){
    _sessionStreamController.sink.add(SessionUndeterminedEvent());
    _sendAuthenticatedStreamIfAuthenticated();
  }

  static SessionManagerState get instance {
    return _instance;
  }

  final StreamController<SessionEvent> _sessionStreamController = StreamController<SessionEvent>.broadcast();

  Stream<SessionEvent> get sessionStream => _sessionStreamController.stream;

  StreamController<SessionEvent> get sessionStreamController => _sessionStreamController;

  static String generateRandomSessionString(int length) {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return List.generate(length, (index) => characters[random.nextInt(characters.length)]).join();
  }

  static Future<void> clearAuthDetails() async{
    await _secureStorage.delete(key: _authKey);
    await _secureStorage.delete(key: _authSessionKey);
  }

  static Future<void> storeAuthDetails({dynamic authDetails}) async{
    if(authDetails is AuthInfo){
      await _secureStorage.put(key: _authKey, value: jsonEncode(authDetails.toJson()));
    }
    await _secureStorage.put(key: _authSessionKey, value: generateRandomSessionString(10));
  }

  _sendAuthenticatedStreamIfAuthenticated() async {
    Future.delayed(Duration(milliseconds: 1000), () async{
      bool isValid = StringUtil.isNotEmptyNorNull(await _secureStorage.get(key: _authSessionKey));
      if(isValid){
      _sessionStreamController.sink.add(SessionOnAuthenticatedEvent());
      }
      else {
      _sessionStreamController.sink.add(SessionNotAuthenticatedEvent());
      }
    });
  }

  void dispose() async{
    await _sessionStreamController.close();
  }
}
