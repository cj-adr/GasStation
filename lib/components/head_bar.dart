import 'package:flutter/material.dart';

class HeadBar extends PreferredSize{

  Widget child;
  @override
  final Size preferredSize;

  HeadBar({this.preferredSize,this.child});

  @override
  Widget build(BuildContext context) {
    Widget widget=child;
    if(widget==null){
      widget=LimitedBox(
        maxHeight: 0,
        maxWidth: 0,
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );
    }
    return widget;
  }
}