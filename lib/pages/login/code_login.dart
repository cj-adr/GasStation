import 'package:flutter/material.dart';

class CodeLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CodeLoginState();
  }
}

class _CodeLoginState extends State<CodeLogin> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('短信快捷登录'),
        ),
        body: new SafeArea(
            child: new Container(
//            设置屏幕的宽高
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new SizedBox(
                height: 50,
              ),
              new Image.asset(
                "images/ic_login_logo.png",
                height: 99,
                width: 77,
              ),
              new Padding(
                padding: new EdgeInsets.fromLTRB(42, 55, 42, 18),
                child: new TextField(
                  style: TextStyle(
                    fontSize: 16,
                  ),

                  decoration: new InputDecoration(
                      hintText: '请输入手机号', alignLabelWithHint: true,
//                    icon: Image.asset('images/ic_phone.png',width: 16,height: 20,),
                  prefixIcon: Image.asset('images/ic_phone.png',width: 16,height: 20,),
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        )));
  }
}
