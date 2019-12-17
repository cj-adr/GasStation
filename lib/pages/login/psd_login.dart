import 'package:flutter/material.dart';
import 'package:gas_station/network/response_bean.dart';
import 'package:gas_station/network/services.dart';
import 'package:gas_station/res/text_styles.dart';
import 'package:gas_station/utils/image_utils.dart';

class PsdLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PsdLoginPageState();
  }
}

class _PsdLoginPageState extends State<PsdLoginPage> {
  var _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: (GestureDetector(
        onTap: () {},
        child: ListView(
          children: <Widget>[
            SizedBox(height: 50),
            _topLogo(),
            _inputPhoneAndPsd(),
            _sureButton(),
            SizedBox(height: 10),
            _bottomItem(),
          ],
        ),
      )),
    );
  }

  //头部logo
  Widget _topLogo() {
    return new Container(
        alignment: Alignment.topCenter,
        child: ImageUtils.assetImage('login_logo'));
  }

  //输入手机号和密码
  Widget _inputPhoneAndPsd() {
    return new Container(
        margin: EdgeInsets.fromLTRB(40, 50, 40, 35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              //设置键盘类型
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: '请输入手机号',
                  prefixIcon: ImageUtils.assetImage('login_phone'),
                  hintStyle: TextStyles.blackLight_16),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              style: TextStyles.black_16,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  hintText: '请输入密码',
                  prefixIcon: ImageUtils.assetImage('login_password'),
                  hintStyle: TextStyles.blackLight_16),
            )
          ],
        ));
  }

  //确认按钮
  Widget _sureButton() {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      height: 40,
      child: RaisedButton(
        autofocus: true,
        color: Colors.blue[400],
        textColor: Colors.white,
        child: Text('确认登录', style: TextStyle(fontSize: 14)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
        onPressed: _login,
      ),
    );
  }

  Widget _bottomItem() {
    return Container(
      margin: EdgeInsets.only(left: 28, right: 40),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Checkbox(
                  value: _isChecked,
                  activeColor: Colors.blue[400],
                  onChanged: (bool checked) {
                    setState(() {
                      _isChecked = !_isChecked;
                      print(_isChecked);
                    });
                  }),
              Text('记住密码', style: TextStyles.black_13)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('短信快捷登录', style: TextStyles.black_13),
              SizedBox(width: 4),
              ImageUtils.assetImage('login_enter_next'),
            ],
          )
        ],
      ),
    );
  }

  _login() async {
//    Navigator.pushReplacementNamed(context, '/home');
    ResponseBean resp = await Services().login('15158081188', '111111');
    if (resp.success) {
//      debugPrint(resp.data);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      debugPrint('error');
    }
  }
}
