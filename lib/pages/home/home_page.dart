import 'package:flutter/material.dart';
import 'package:gas_station/pages/member/list/member_list_page.dart';
import 'package:gas_station/pages/order/list/order_list_page.dart';
import 'package:gas_station/res/clrs.dart';
import 'package:gas_station/res/dimens.dart';
import 'package:gas_station/utils/image_utils.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _bottomNavigationBarTitles = List.of(['收款', '会员', '订单', '我的']);
  final _bottomNavigationBarSelectedIcons = List.of([
    'home_pay_selected',
    'home_member_selected',
    'home_order_selected',
    'home_mine_selected',
  ]);

  final _bottomNavigationBarUnselectedIcons = List.of([
    'home_pay_unselected',
    'home_member_unselected',
    'home_order_unselected',
    'home_mine_unselected',
  ]);
  final _pageList =
      List.of([Text('收款'), MemberListPage(), OrderListPage(), Text('我的')]);

  var _index = 0;

  void _onTap(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: IndexedStack(
          index: _index,
          children: _pageList,
        )),
        _getBottomNavigationBar()
      ],
    );
  }

  ///底部导航栏
  Widget _getBottomNavigationBar() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: BottomNavigationBar(
        selectedFontSize: Dimens.font_11,
        iconSize: 20,
        unselectedFontSize: Dimens.font_11,
        backgroundColor: Colors.white,
        fixedColor: Clrs.colorPrimary,
        unselectedItemColor: Clrs.textBlackLight,
        type: BottomNavigationBarType.fixed,
        items: List.generate(_pageList.length, (position) {
          return BottomNavigationBarItem(
            icon: ImageUtils.assetImage(_index == position
                ? _bottomNavigationBarSelectedIcons[position]
                : _bottomNavigationBarUnselectedIcons[position]),
            title: Text(_bottomNavigationBarTitles[position]),
          );
        }),
        currentIndex: _index,
        onTap: _onTap,
      ),
    );
  }
}
