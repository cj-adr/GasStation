import 'package:flutter/material.dart';
import 'package:gas_station/components/switch_image.dart';
import 'package:gas_station/pages/member/list/member_list_page.dart';
import 'package:gas_station/pages/mine/mine_page.dart';
import 'package:gas_station/pages/order/list/order_list_page.dart';
import 'package:gas_station/pages/payment/pay_amount_page.dart';
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
    ImageUtils.assetImage('home_pay_selected'),
    ImageUtils.assetImage('home_member_selected'),
    ImageUtils.assetImage('home_order_selected'),
    ImageUtils.assetImage('home_mine_selected'),
  ]);

  final _bottomNavigationBarUnselectedIcons = List.of([
    ImageUtils.assetImage('home_pay_unselected'),
    ImageUtils.assetImage('home_member_unselected'),
    ImageUtils.assetImage('home_order_unselected'),
    ImageUtils.assetImage('home_mine_unselected'),
  ]);

  final _pageList =
      List.of([PayAmountPage(), MemberListPage(), OrderListPage(), MinePage()]);

  var _index = 0;

  void _onTap(int index) {
    if (_index != index) {
      setState(() {
        _index = index;
      });
    }
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
            icon: SwitchImage(
                _index == position,
                _bottomNavigationBarSelectedIcons[position],
                _bottomNavigationBarUnselectedIcons[position]),
            title: Text(_bottomNavigationBarTitles[position]),
          );
        }),
        currentIndex: _index,
        onTap: _onTap,
      ),
    );
  }
}
