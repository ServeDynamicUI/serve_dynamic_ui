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
    key: json['key'] as String?,
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
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
    primary: json['primary'] as bool? ?? true,
    extendBody: json['extendBody'] as bool? ?? false,
    drawerEnableOpenDragGesture:
        json['drawerEnableOpenDragGesture'] as bool? ?? true,
    extendBodyBehindAppBar: json['extendBodyBehindAppBar'] as bool? ?? false,
    endDrawerEnableOpenDragGesture:
        json['endDrawerEnableOpenDragGesture'] as bool? ?? true,
  );
}
