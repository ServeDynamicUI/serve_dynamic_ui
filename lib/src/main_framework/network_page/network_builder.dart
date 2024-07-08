import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:serve_dynamic_ui/src/main_framework/network_page/network_builder_state.dart';

class NetworkBuilder extends StatefulWidget {
  final DynamicRequest request;
  final String? templateJsonPath;
  final ShowLoaderWidgetBuilder? showLoaderWidgetBuilder;
  final ShowErrorWidgetBuilder? showErrorWidgetBuilder;
  final bool isPageCacheEnabled;

  const NetworkBuilder(
      {super.key,
      required this.request,
      this.templateJsonPath,
      this.showLoaderWidgetBuilder,
      this.showErrorWidgetBuilder,
      this.isPageCacheEnabled = false});

  @override
  State<NetworkBuilder> createState() => _NetworkBuilderState();
}

class _NetworkBuilderState extends State<NetworkBuilder> {
  late NetworkBuilderState _networkBuilderState;

  @override
  void initState() {
    _networkBuilderState = NetworkBuilderState(widget.request);
    _networkBuilderState.fetchPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _networkBuilderState.networkPageStatusNotifier,
      builder: (ctx, networkStatus, _) {
        if (networkStatus is NetworkPagePendingStatusEvent) {
          if (Util.isValid(networkStatus.pageResponse)) {
            return WidgetUtil.fromJson(networkStatus.pageResponse, context,
                    networkState: _networkBuilderState) ??
                const SizedBox.shrink();
          }
          if (widget.showLoaderWidgetBuilder != null) {
            DynamicWidget? dyWidget = widget.showLoaderWidgetBuilder!(context);
            return dyWidget?.build(context) ?? const SizedBox.shrink();
          }
          if (StringUtil.isNotEmptyNorNull(widget.templateJsonPath)) {
            return ServeDynamicUI.fromAssets(widget.templateJsonPath!);
          }
        } else if (networkStatus is NetworkPageSuccessStatusEvent) {
          return WidgetUtil.fromJson(networkStatus.pageResponse, context,
                  networkState: _networkBuilderState) ??
              const SizedBox.shrink();
        } else if (networkStatus is NetworkPageFailureStatusEvent) {
          if(widget.showErrorWidgetBuilder == null){
            return const SizedBox.shrink();
          }
          final dyWidget =
              widget.showErrorWidgetBuilder!(context, networkStatus.error);
          return dyWidget?.build(context) ?? const SizedBox.shrink();
        }
        return Container(color: Colors.white);
      },
    );
  }

  @override
  void dispose() {
    _networkBuilderState.onDispose();
    super.dispose();
  }
}
