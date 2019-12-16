import 'package:flutter/material.dart';
import 'package:gas_station/router/route_configs.dart';

//  1.无参 Navigator.pushNamed(context, '/record/list')
//  2.有参 Navigator.pushNamed(context, '/member/detail', arguments: {'id': 1});
//  3.返回 Navigator.pop(context,T data)
class RouteManager {
  static RouteFactory buildRouteFactory() {
    return (RouteSettings routeSettings) {
      String name = routeSettings.name;
      for (int i = 0; i < routeConfigs.routeConfigs.length; i++) {
        if (name == routeConfigs.routeConfigs[i].path) {
          return MaterialPageRoute(builder: (context) {
            return routeConfigs.routeConfigs[i]
                .widgetBuilder(routeSettings.arguments);
          });
        }
      }
      return null;
    };
  }
}
