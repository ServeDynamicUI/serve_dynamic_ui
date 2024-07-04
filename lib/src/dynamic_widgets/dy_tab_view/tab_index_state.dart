import 'package:flutter/foundation.dart';

class TabIndexState {
  final ValueNotifier<int> _index;

  ValueNotifier<int> get indexListener => _index;

  TabIndexState(int index) : _index = ValueNotifier(index);

  int get index => _index.value;

  set index(int value) {
    _index.value = value;
  }
}
