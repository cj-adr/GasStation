import 'package:flutter/material.dart';
import 'package:gas_station/res/text_styles.dart';

class CommonButton extends StatefulWidget {
  CommonButton(
      {Key key, this.content = '确定', @required this.onPressed, this.margin})
      : super(key: key);

  String content;

  VoidCallback onPressed;

  EdgeInsetsGeometry margin;

  @override
  State<StatefulWidget> createState() {
    return _CommonButtonState();
  }
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: widget.margin == null
            ? EdgeInsets.fromLTRB(40, 0, 40, 0)
            : widget.margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3), color: Colors.lightBlue),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: FlatButton(
            onPressed: _onPressed,
            child: Text(
              widget.content,
              style: TextStyles.white_14,
            ),
          ),
        ));
  }

  void _onPressed() {
    widget.onPressed();
  }
}
