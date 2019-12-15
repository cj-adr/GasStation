import 'package:flutter/material.dart';

class RouteConfig {
  final String path;
  final WidgetBuilder widgetBuilder;

  RouteConfig(this.path, this.widgetBuilder);
}

typedef Widget WidgetBuilder(Map<String, Object> parameters);
