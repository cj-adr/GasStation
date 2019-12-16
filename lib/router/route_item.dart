import 'package:flutter/material.dart';

class RouteItem {
  final String path;
  final WidgetBuilder widgetBuilder;

  RouteItem(this.path, this.widgetBuilder);
}

typedef Widget WidgetBuilder(Map<String, Object> parameters);
