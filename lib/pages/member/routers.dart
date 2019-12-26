import 'package:gas_station/router/route_item.dart';

import 'detail/member_detail_page.dart';

List<RouteItem> routers = [
  RouteItem('/member/detail', (args) => MemberDetailPage(args['id']))
];
