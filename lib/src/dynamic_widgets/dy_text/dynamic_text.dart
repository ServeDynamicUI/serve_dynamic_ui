import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'dynamic_text_state.dart';

part 'dynamic_text.g.dart';

const String updateText = Strings.updateText;

///[DynamicText] : A dynamic widget that helps to show text.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicText extends DynamicWidget {
  String? text;
  TextStyleDTO? style;
  bool isHtmlText;
  int? maxLines;
  @JsonKey(fromJson: WidgetUtil.getTextDirection)
  TextDirection? textDirection;
  @JsonKey(fromJson: WidgetUtil.getTextAlign)
  TextAlign? textAlign;
  @JsonKey(fromJson: WidgetUtil.getTextOverflow)
  TextOverflow? overflow;
  double? height;
  double? width;
  @JsonKey(fromJson: WidgetUtil.getPositionalAlignment)
  Alignment? alignment;

  DynamicText({
    String? key,
    this.text,
    this.style,
    this.textDirection,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.isHtmlText = false,
    this.height,
    this.width,
    this.alignment,
  }) : super(
          key: key ?? "",
        );

  factory DynamicText.fromJson(Map<String, dynamic> json) =>
      _$DynamicTextFromJson(json);

  DynamicTextState? __dynamicTextState;

  DynamicTextState get _dynamicTextState {
    DynamicProvider? dynamicProvider =
        WidgetResolver.getTopAncestorOfType<DynamicProvider>(this);
    if (dynamicProvider == null) {
      return DynamicTextState(text);
    }
    if (__dynamicTextState != null) {
      return __dynamicTextState!;
    } else {
      __dynamicTextState = dynamicProvider.stateCache.putIfAbsent(
        key,
            () => DynamicTextState(text),
      ) as DynamicTextState?;
    }
    return __dynamicTextState!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ValueListenableBuilder(
        valueListenable: _dynamicTextState.textNotifier,
        builder: (BuildContext context, String? text, Widget? child) {
          if (isHtmlText) {
            return RichText(
              text: HTML.toTextSpan(
                context,
                text ?? '',
                defaultTextStyle: style?.textStyle,
                linksCallback: (link) {
                  if (link is String) {
                    _htmlLinkCallback(link, context);
                  }
                },
              ),
              textAlign: textAlign ?? TextAlign.start,
              textDirection: textDirection,
              overflow: overflow ?? TextOverflow.clip,
            );
          }
          return Align(
            alignment: alignment ?? Alignment.center,
            child: Text(
              text ?? '',
              style: style?.textStyle,
              maxLines: maxLines,
              textDirection: textDirection,
              textAlign: textAlign,
              overflow: overflow,
            ),
          );
        },
      ),
    );
  }

  @override
  List<DynamicWidget?>? get childWidgets => [];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {
    switch (methodName) {
      case updateText:
        String newText = params?[Strings.newText];
        _dynamicTextState.updateTitle(newText);
    }
  }

  ///handles html links as of now only action strings are supported.
  void _htmlLinkCallback(String link, BuildContext context) {
    Uri uri = Uri.parse(link);
    ActionHandlersRepo.handle(
        ActionDTO(uri.path, uri.queryParameters), this, context, (value) {
      debugPrint(value);
    });
  }
}
