import 'package:flutter/material.dart';
import 'package:gas_station/pages/login/code_login.dart';
import 'package:gas_station/pages/login/psd_login.dart';

class LoginPage extends StatelessWidget {
  //登录类型：0，验证码登录；1，密码登录
  int type;

  LoginPage({this.type = 1});

  @override
  Widget build(BuildContext context) {
    return (type == 0 || type == null) ? CodeLoginPage() : PsdLoginPage();
  }
}
