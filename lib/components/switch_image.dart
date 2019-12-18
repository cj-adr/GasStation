import 'package:flutter/material.dart';

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
