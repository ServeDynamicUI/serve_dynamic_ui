// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_scaffold.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicScaffold _$DynamicScaffoldFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );

  return DynamicScaffold(
    key: json['key'] as String,
    children: json['children'] == null
        ? null
        : (json['children'] as List<dynamic>?)
            ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
            .toList(),
    leftActions: json['leftActions'] == null
        ? null
        : (json['leftActions'] as List<dynamic>?)
            ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
            .toList(),
    leftActionsWidth: (json['leftActionsWidth'] as num?)?.toDouble(),
    rightActions: json['rightActions'] == null
        ? null
        : (json['rightActions'] as List<dynamic>?)
            ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
            .toList(),
    pageTitle: json['pageTitle'] as String?,
    floatingActionWidget: json['floatingActionWidget'] == null
        ? null
        : DynamicWidget.fromJson(
            json['floatingActionWidget'] as Map<String, dynamic>),
    bottomNavigationBar: json['bottomNavigationBar'] == null
        ? null
        : DynamicWidget.fromJson(
            json['bottomNavigationBar'] as Map<String, dynamic>),
    resizeToAvoidBottomInset: json['resizeToAvoidBottomInset'] as bool?,
    scrollable: json['scrollable'] as bool? ?? true,
    centerPageTitle: json['centerPageTitle'] as bool? ?? true,
    paginated: json['paginated'] as bool? ?? false,
    showPaginatedLoaderOnTop:
        json['showPaginatedLoaderOnTop'] as bool? ?? false,
    primary: json['primary'] as bool? ?? true,
    extendBody: json['extendBody'] as bool? ?? false,
    drawerEnableOpenDragGesture:
        json['drawerEnableOpenDragGesture'] as bool? ?? true,
    extendBodyBehindAppBar: json['extendBodyBehindAppBar'] as bool? ?? false,
    endDrawerEnableOpenDragGesture:
        json['endDrawerEnableOpenDragGesture'] as bool? ?? true,
    nextUrl: json['nextUrl'] as String?,
    itemsSpacing: (json['itemsSpacing'] as num?)?.toDouble(),
    paginatedLoaderWidget: json['paginatedLoaderWidget'] == null
        ? null
        : DynamicWidget.fromJson(
            json['paginatedLoaderWidget'] as Map<String, dynamic>),
    crossAxisAlignment: WidgetUtil.getCrossAxisAlignment(
            json['crossAxisAlignment'] as String?) ??
        CrossAxisAlignment.center,
    padding: WidgetUtil.getEdgeInsets(json['padding'] as String?),
    margin: WidgetUtil.getEdgeInsets(json['margin'] as String?),
    mainAxisAlignment: WidgetUtil.getMainAxisAlignment(
        json['mainAxisAlignment'] as String?) ??
        MainAxisAlignment.start,
  );
}
