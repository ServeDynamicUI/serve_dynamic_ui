import 'package:flutter/material.dart';

class SingleTabView extends StatelessWidget {
  final Color? tabsBackgroundColor;
  final String? title;
  final Color? indicatorColor;
  final Widget? child;
  final Color? labelColor;

  const SingleTabView({
    Key? key,
    this.tabsBackgroundColor,
    this.title,
    this.indicatorColor,
    this.child,
    this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getSingleTabView(context);
  }

  Widget _getSingleTabView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: _isStyleDefault ? 40 : null,
          alignment: Alignment.topLeft,
          padding: _isStyleDefault
              ? const EdgeInsets.only(left: 8)
              : const EdgeInsets.only(left: 8, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: tabsBackgroundColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(25, 25, 25, 0.10),
                offset: Offset(0.0, 3.0),
                blurRadius: 2,
                spreadRadius: 0.0,
              )
            ],
          ),
          child: _getTab(context),
        ),
        child!,
      ],
    );
  }

  Widget _getTab(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: indicatorColor!,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.4),
            child: _getText(),
          ),
        ],
      ),
    );
  }

  Widget _getText() {
    return Text(
      title!,
      textAlign: TextAlign.center,
      style: TextStyle(color: labelColor, fontWeight: FontWeight.w500),
    );
  }

  bool get _isStyleDefault => true;
}
