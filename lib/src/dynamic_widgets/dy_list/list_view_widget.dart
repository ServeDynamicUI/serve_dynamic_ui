import 'package:flutter/material.dart';
import '../../../serve_dynamic_ui.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ListViewWidget extends StatefulWidget {
  final bool isVertical;
  final bool shrinkWrap;
  final bool isScrollable;
  final List<DynamicWidget>? listItems;
  final DynamicWidget? separator;

  const ListViewWidget(
      {super.key,
      this.isVertical = true,
      this.listItems,
      this.separator,
      this.shrinkWrap = false,
      this.isScrollable = true});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  ScrollController get scrollController {
    DynamicProvider dynamicProvider =
        WidgetResolver.getTopAncestorOfType(widget.listItems![0])!;
    String scrollKey =
        '${Strings.scrollController}${((widget.key) as ValueKey).value}';
    if (!dynamicProvider.controllerCache.containsKey(scrollKey)) {
      ScrollController scrollController = ScrollController();
      scrollController.addListener(_scrollListener);
      dynamicProvider.controllerCache[scrollKey] = scrollController;
    }
    return dynamicProvider.controllerCache[scrollKey];
  }

  AutoScrollController get autoScrollController {
    DynamicProvider dynamicProvider =
        WidgetResolver.getTopAncestorOfType(widget.listItems![0])!;
    String autoScrollKey =
        '${Strings.autoScrollController}${((widget.key) as ValueKey).value}';
    if (!dynamicProvider.controllerCache.containsKey(autoScrollKey)) {
      AutoScrollController autoScrollController = AutoScrollController(
          viewportBoundaryGetter: () =>
              Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
          axis: widget.isVertical ? Axis.vertical : Axis.horizontal);
      dynamicProvider.controllerCache[autoScrollKey] = autoScrollController;
    }
    return dynamicProvider.controllerCache[autoScrollKey];
  }

  void _scrollListener() {
    if (scrollController.position.pixels !=
        scrollController.position.minScrollExtent) {
      ScrollListeners.callOnScrolled(((widget.key) as ValueKey).value);
    }
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      ScrollListeners.callOnScrolledToEnd(((widget.key) as ValueKey).value);
    }
    if (scrollController.position.pixels ==
        scrollController.position.minScrollExtent) {
      ScrollListeners.callOnScrolledToStart(((widget.key) as ValueKey).value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      physics:
          widget.isScrollable ? null : const NeverScrollableScrollPhysics(),
      shrinkWrap: widget.shrinkWrap,
      itemBuilder: (ctx, index) {
        return AutoScrollTag(
          key: ValueKey(index),
          controller: autoScrollController,
          index: index,
          highlightColor: Colors.black.withOpacity(0.1),
          child: widget.listItems![index].build(context),
        );
      },
      separatorBuilder: (ctx, index) {
        if (widget.separator == null) {
          return const SizedBox.shrink();
        }
        return widget.separator!.build(context);
      },
      itemCount: widget.listItems?.length ?? 0,
      scrollDirection: widget.isVertical ? Axis.vertical : Axis.horizontal,
    );
  }
}
