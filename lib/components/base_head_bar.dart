import 'package:flutter/material.dart';
import 'package:gas_station/res/clrs.dart';
import 'package:gas_station/utils/image_utils.dart';

class BaseHeadBar extends StatelessWidget {
  String title = '';
  String leftText = '';
  String leftIconName = '';
  String rightText = '';
  String rightIconName = '';
  final VoidCallback rightCallback;
  BuildContext context;
  Color colorBg = Colors.white;
  Color leftTextColor = Clrs.textBlackSub;
  Color rightTextColor = Clrs.textBlackSub;

  BaseHeadBar(this.context, this.title,
      {this.leftText,
      this.leftIconName,
      this.leftTextColor,
      this.colorBg,
      this.rightText,
      this.rightTextColor,
      this.rightIconName,
      this.rightCallback});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new AppBar(
      titleSpacing: 0,
      brightness: Brightness.light,
      backgroundColor: colorBg,
      elevation: 0,
      centerTitle: true,
      leading: _buildLeftView(),
      title: Text(
        title == null ? '' : title,
        style: TextStyle(fontSize: 18, color: Clrs.textBlack),
      ),
      actions: <Widget>[
        _buildAction(),
      ],
    );
  }

  Widget _buildLeftView() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Offstage(
              offstage: leftIconName == null ? true : false,
              child: ImageUtils.assetImage(leftIconName),
            ),
            Text(
              leftText == null ? '' : leftText,
              style: TextStyle(fontSize: 15, color: leftTextColor==null?Clrs.textBlackSub:leftTextColor),
            )
          ],
        ),
        onTap: _back,
      ),
    );
  }

  Widget _buildAction() {
    return Container(
      margin: const EdgeInsets.only(right: 21),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Offstage(
              offstage: rightIconName == null ? true : false,
              child: ImageUtils.assetImage(rightIconName),
            ),
            Text(
              rightText == null ? '' : rightText,
              style: TextStyle(fontSize: 16, color: rightTextColor==null?Clrs.textBlackSub:rightTextColor),
            )
          ],
        ),
        onTap: rightCallback,
      ),
    );
  }

  void _back() {
    if (context != null) {
      Navigator.pop(context);
    }
  }
}
