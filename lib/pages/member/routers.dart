import 'package:gas_station/architecture/base_page.dart';
import 'package:gas_station/router/route_item.dart';

import 'detail/member_detail_model.dart';
import 'detail/member_detail_page.dart' as detail;

List<RouteItem> routers = [
  RouteItem('/member/detail',
      (args) => BasePage(detail.builder, MemberDetailModel(args['id'])))
];
