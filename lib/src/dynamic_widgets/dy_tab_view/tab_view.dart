import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/dy_tab_view/tab_index_state.dart';
import '../../constants/app_colors.dart';

class TabView extends StatefulWidget {
  final TabIndexState indexState;
  final int? defaultSelectedTab;
  final Color indicatorColor;
  final Color unselectedLabelColor;
  final Color labelColor;
  final List<String> tabTitles;
  final List<Widget> tabChildren;
  final Color? tabsBackgroundColor;
  final Decoration? customIndicatorDecoration;
  final double tabBarRadius;

  TabView({
    Key? key,
    required this.indexState,
    required this.tabTitles,
    required this.tabChildren,
    this.defaultSelectedTab = 0,
    this.indicatorColor = AppColors.limeade,
    this.labelColor = AppColors.limeade,
    this.unselectedLabelColor = AppColors.black,
    this.tabsBackgroundColor,
    this.customIndicatorDecoration,
    this.tabBarRadius = 0,
  })  : assert(tabTitles.length == tabChildren.length),
        super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int get _selectedTab => widget.indexState.index;

  final AutoScrollController _scrollController = AutoScrollController(
    axis: Axis.horizontal,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isScrollable()) {
        _refreshTabView();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _refreshTabView() {
    if (mounted) {
      setState(() {});
      if (_scrollController.hasClients) {
        _scrollController.scrollToIndex(_selectedTab,
            preferPosition: AutoScrollPosition.middle);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _tabsView(),
        Flexible(
          child: widget.tabChildren[_selectedTab],
        ),
      ],
    );
  }

  Widget _tabsView() {
    List<Widget> tabs = [];
    for (int i = 0; i < widget.tabTitles.length; i++) {
      String title = widget.tabTitles[i];
      if (_isScrollable()) {
        tabs.add(
          AutoScrollTag(
            key: ValueKey(i),
            controller: _scrollController,
            index: i,
            child: _getTab(title, i, true),
          ),
        );
      } else {
        tabs.add(_getTab(title, i, false));
      }
    }
    if (_isScrollable()) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: tabs,
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: tabs.map((Widget e) => Expanded(child: e)).toList(),
      );
    }
  }

  bool _isScrollable() => widget.tabTitles.length > 2;

  Widget _getTab(
    String title,
    int index,
    bool isInsideScrollView,
  ) {
    bool isSelected = (index == _selectedTab);
    Color indicatorColor =
        isSelected ? widget.indicatorColor : Colors.transparent;
    Color textColor =
        isSelected ? widget.labelColor : widget.unselectedLabelColor;
    Widget child = Container(
      color: widget.tabsBackgroundColor,
      child: IntrinsicWidth(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center,
              //Center Row contents vertically,
              children: [
                Container(
                  padding: _textDefaultPadding(index),
                  child: _tabText(title, textColor, isInsideScrollView),
                ),
              ],
            ),
            Container(
              height: 3,
              color: indicatorColor,
            )
          ],
        ),
      ),
    );
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        widget.indexState.index = index;
        _refreshTabView();
      },
      child: child,
    );
  }

  Widget _tabText(
    String title,
    Color textColor,
    bool isInsideScrollView,
  ) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }

  EdgeInsets _textDefaultPadding(int index) =>
      const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
}
