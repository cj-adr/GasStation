import 'package:gas_station/architecture/base_page.dart';
import 'package:gas_station/router/route_item.dart';

import 'detail/model.dart' as detail;
import 'detail/view.dart' as detail;

List<RouteItem> routers = [
  RouteItem('/member/detail',
      (args) => BasePage(detail.view, detail.Model(args['id'])))
];
