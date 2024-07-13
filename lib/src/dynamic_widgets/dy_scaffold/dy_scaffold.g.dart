// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_scaffold.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicScaffold _$DynamicScaffoldFromJson(Map<String, dynamic> json) {
  return DynamicScaffold(
    key: (json['key'] as String?) ?? Util.generateRandomString(length: 15),
    children: json['children'] == null
        ? null
        : (json['children'] as List<dynamic>?)
            ?.map((e) => DynamicWidget.fromJson(e as Map<String, dynamic>))
            .toList(),
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
    width: WidgetUtil.getWidthValueOrInf((json['width'] as num?)?.toDouble()),
    height: WidgetUtil.getHeightValueOrInf((json['height'] as num?)?.toDouble()),
    backgroundColor: WidgetUtil.getColor(json['backgroundColor'] as String?),
    appBar: json['appBar'] == null ? AppBarDto() : AppBarDto.fromJson(json['appBar'] as Map<String, dynamic>)
  );
}
