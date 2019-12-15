import 'package:flutter/material.dart';
import 'package:gas_station/pages/home/home_page.dart';
import 'package:gas_station/pages/member/detail/member_detail_page.dart';
import 'package:gas_station/pages/record/detail/record_detail_page.dart';
import 'package:gas_station/pages/record/list/record_list_page.dart';
import 'package:gas_station/router/route_config.dart';

//  1.无参 Navigator.pushNamed(context, '/record/list')
//  2.有参 Navigator.pushNamed(context, '/member/detail', arguments: {'test': entity});
//  3.返回 Navigator.pop(context,T data)
class RouteManager {
  static RouteFactory buildRouteFactory() {
    List<RouteConfig> routeConfigs = List();
    routeConfigs.add(RouteConfig('/home', (args) => HomePage()));
    routeConfigs.add(RouteConfig(
        '/member/detail', (args) => MemberDetailPage(args['id'])));
    routeConfigs.add(RouteConfig('/record/list', (args) => RecordListPage()));
    routeConfigs.add(
        RouteConfig('/record/detail', (args) => RecordDetailPage(args['id'])));

    return _buildRouteFactory(routeConfigs);
  }

  static RouteFactory _buildRouteFactory(List<RouteConfig> routeConfigs) {
    return (RouteSettings routeSettings) {
      String name = routeSettings.name;
      for (int i = 0; i < routeConfigs.length; i++) {
        if (name == routeConfigs[i].path) {
          return MaterialPageRoute(builder: (context) {
            return routeConfigs[i].widgetBuilder(routeSettings.arguments);
          });
        }
      }
      return null;
    };
  }
}
