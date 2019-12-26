import 'dart:async';

import 'package:flutter/material.dart';

class DownCount extends StatefulWidget {
  String text;

  int countDownNum = 6;

  String endText;

  VoidCallback onPressed;

  DownCount({Key key, this.text = "获取验证码", this.countDownNum = 60, this.endText, this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return _DownCountState();
  }
}

class _DownCountState extends State<DownCount> {
  String _showText;

  int _countDownNum;

  Timer _downTimer;

  Color _bkColor = Colors.blue;

  Color _textColor = Colors.white;

  @override
  void initState() {
    _showText = widget.text;
    _countDownNum = widget.countDownNum;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Container(
        height: 28,
        width: 86,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: _bkColor, borderRadius: BorderRadius.circular(2.0)),
        child: Text(
          _showText,
          style: TextStyle(fontSize: 14, color: _textColor),
        ),
      ),
    );
  }

  void _onPressed() {

    if (_downTimer != null) {
      return;
    }
    print('点击了');
    widget.onPressed();
    _downCount();
  }

  void _downCount() {

    _downTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      print('倒计时$_countDownNum');
      if (_countDownNum > 0) {
        _countDownNum--;
        setState(() {
          _showText = '${_countDownNum}s';
          _textColor = Colors.blue;
          _bkColor = null;
        });
      } else {
        _downTimer.cancel();
        _downTimer = null;
        setState(() {
          _showText = widget.endText == null ? widget.text : widget.endText;
          _textColor = Colors.white;
          _bkColor = Colors.blue;
        });
        _countDownNum = widget.countDownNum;

        print('倒计时结束');
      }
    });
  }

  @override
  void dispose() {
    _downTimer?.cancel();
    _downTimer = null;
    super.dispose();
  }
}
