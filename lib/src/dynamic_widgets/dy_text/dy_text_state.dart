import 'package:flutter/material.dart';

class DynamicTextState {
  final ValueNotifier<String?> textNotifier;

  DynamicTextState(
    String? title,
  ) : textNotifier = ValueNotifier<String?>(title);

  void updateTitle(String? newTitle) {
    textNotifier.value = newTitle;
  }
}
