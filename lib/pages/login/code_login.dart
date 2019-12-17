import 'package:flutter/material.dart';

class CodeLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CodeLoginPageState();
  }
}

class _CodeLoginPageState extends State<CodeLoginPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('验证码登录')),
    );
  }
}
