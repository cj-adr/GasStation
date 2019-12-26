import 'package:gas_station/pages/home/home_page.dart';
import 'package:gas_station/pages/member/routers.dart' as member;
import 'package:gas_station/pages/record/detail/record_detail_page.dart';
import 'package:gas_station/pages/record/list/record_list_page.dart';
import 'package:gas_station/router/route_item.dart';

class RouteConfigs {
  List<RouteItem> routeConfigs = List();

  RouteConfigs() {
//    routeConfigs.add(RouteItem('/home', (args) => HomePage()));
//    routeConfigs.add(RouteItem('/record/list', (args) => RecordListPage()));
//    routeConfigs.add(
//        RouteItem('/record/detail', (args) => RecordDetailPage(args['id'])));

    routeConfigs.addAll(member.routers);
    routeConfigs.addAll(member.routers);
    routeConfigs.addAll(member.routers);
  }
}

RouteConfigs routeConfigs = RouteConfigs();
