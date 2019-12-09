import 'package:flutter/material.dart';
import 'package:gas_station/pages/member/list/member_list.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final _bottomNavigationBarTitles = List.of(['收款', '会员', '订单', '我的']);
  final _bottomNavigationBarSelectedIcons = List.of([
    'assets/images/home_pay_selected.png',
    'assets/images/home_member_selected.png',
    'assets/images/home_order_selected.png',
    'assets/images/home_mine_selected.png'
  ]);

  final _bottomNavigationBarUnselectedIcons = List.of([
    'assets/images/home_pay_unselected.png',
    'assets/images/home_member_unselected.png',
    'assets/images/home_order_unselected.png',
    'assets/images/home_mine_unselected.png'
  ]);
  final _pageList = List.of([Text('收款'), MemberList(), Text('订单'), Text('我的')]);

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
        getBottomNavigationBar()
      ],
    );
  }

  ///底部导航栏
  Widget getBottomNavigationBar() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: BottomNavigationBar(
        selectedFontSize: 11,
        iconSize: 20,
        unselectedFontSize: 11,
        backgroundColor: Colors.white,
        fixedColor: Color.fromARGB(255, 24, 144, 255),
        unselectedItemColor: Color.fromARGB(255, 204, 204, 204),
        type: BottomNavigationBarType.fixed,
        items: List.generate(_pageList.length, (position) {
          return BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(_index == position
                  ? _bottomNavigationBarSelectedIcons[position]
                  : _bottomNavigationBarUnselectedIcons[position]),
              size: 20,
            ),
            title: Text(_bottomNavigationBarTitles[position]),
          );
        }),
        currentIndex: _index,
        onTap: _onTap,
      ),
    );
  }
}
