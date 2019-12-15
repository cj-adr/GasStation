import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:gas_station/models/entity_factory.dart';
import 'package:gas_station/models/test_entity.dart';
import 'package:gas_station/pages/home/home_page.dart';
import 'package:gas_station/pages/member/detail/member_detail_page.dart';
import 'package:gas_station/pages/record/detail/record_detail_page.dart';
import 'package:gas_station/pages/record/list/record_list_page.dart';
import 'package:gas_station/router/router_handler.dart';
import 'package:gas_station/router/router_params.dart';

class RouterManager {
  static Router _router;

  static void initRouter() {
    _router = new Router();
    _router.define("/home", handler: RouterHandler((_, __) => HomePage()));

    _router.define("/member/detail/:params",
        handler: RouterHandler((_, params) => MemberDetailPage(EntityFactory.generateOBJ(params['id']))));

//    _router.define("/member/detail",
//        handler: Handler(handlerFunc: (_, __) => MemberDetailPage()));

    _router.define("/record/list",
        handler: Handler(handlerFunc: (_, __) => RecordListPage()));
    _router.define("/record/detail",
        handler: Handler(
            handlerFunc: (_, params) =>
                RecordDetailPage(int.parse(params["params"][0]))));
  }

  static void push(BuildContext context, RouterParams routerParams) {
    _router.navigateTo(context, routerParams.toPath(),
        transition: TransitionType.inFromRight);
  }

//  static void push(BuildContext context, String path) {
//    _router.navigateTo(context, path, transition: TransitionType.inFromRight);
//  }

  static void pop(BuildContext context) {
//    _router.pop(context);
    Navigator.pop(context);
  }
}
