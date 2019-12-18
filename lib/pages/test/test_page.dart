import 'package:flutter/material.dart';
import 'package:gas_station/utils/image_utils.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestState();
  }
}

class _TestState extends State<TestPage> {
  int _index;

  final _bottomNavigationBarSelectedIcons = List.of([
    ImageUtils.assetImage('home_pay_selected', width: 20, height: 20),
    ImageUtils.assetImage('home_member_selected', width: 20, height: 20),
    ImageUtils.assetImage('home_order_selected', width: 20, height: 20),
    ImageUtils.assetImage('home_mine_selected', width: 20, height: 20),
  ]);

  final _bottomNavigationBarUnselectedIcons = List.of([
    ImageUtils.assetImage('home_pay_unselected', width: 20, height: 20),
    ImageUtils.assetImage('home_member_unselected', width: 20, height: 20),
    ImageUtils.assetImage('home_order_unselected', width: 20, height: 20),
    ImageUtils.assetImage('home_mine_unselected', width: 20, height: 20),
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (position) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _index = position;
              });
            },
            child: getTest(position),
          );
        }),
      ),
    );
  }

  Widget getTest(int position) {
    return SwitchImage(
        position == _index,
        _bottomNavigationBarSelectedIcons[position],
        _bottomNavigationBarUnselectedIcons[position]);
  }
}

class SwitchImage extends StatelessWidget {
  final bool _focused;
  final Widget _focuedIcon;
  final Widget _unFocuedIcon;

  SwitchImage(this._focused, this._focuedIcon, this._unFocuedIcon);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _focused ? 0 : 1,
      children: [_focuedIcon, _unFocuedIcon],
    );
  }
}
