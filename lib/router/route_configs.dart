import 'package:gas_station/pages/member/routers.dart' as member;
import 'package:gas_station/router/route_item.dart';

class RouteConfigs {
  List<RouteItem> routeConfigs = List();

  RouteConfigs() {
    routeConfigs.addAll(member.routers);
    routeConfigs.addAll(member.routers);
    routeConfigs.addAll(member.routers);
  }
}

RouteConfigs routeConfigs = RouteConfigs();
