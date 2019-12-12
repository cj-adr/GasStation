import 'package:flutter/material.dart';

class PsdLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PsdLoginState();
  }
}

class _PsdLoginState extends State<PsdLogin> {

  static var _isChecked = false;

  //logo区域
  Widget topLogo = new Container(
      alignment: Alignment.topCenter,
      child: Image.asset(
        'images/ic_login_logo.png',
        width: 77,
        height: 99,
      ));

  //输入文本框区域
  Widget inputText = new Container(
      margin: EdgeInsets.fromLTRB(40, 50, 40, 35),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new TextFormField(
            //设置键盘类型
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: '请输入手机号',
                prefixIcon: Icon(Icons.person),
//            suffixIcon: IconButton(icon: Icon(Icons.clear) , onPressed: null)
                hintStyle: TextStyle(color: Colors.black26)),
          ),
          new SizedBox(
            height: 10,
          ),
          new TextFormField(
            style: TextStyle(fontSize: 16, color: Colors.black),
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                hintText: '请输入密码',
                prefixIcon: Icon(Icons.lock),
                //            suffixIcon: IconButton(icon: Icon(Icons.clear) , onPressed: null)
                hintStyle: TextStyle(color: Colors.black26)),
          )
        ],
      ));

  //确认按钮
  Widget sureButton = new Container(
    margin: EdgeInsets.only(left: 40, right: 40),
    height: 40,
    child: RaisedButton(
      autofocus: true,
      color: Colors.blue[400],
      textColor: Colors.white,
      child: Text('确认登录', style: TextStyle(fontSize: 14)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
      onPressed: () {},
    ),
  );

  //记住密码，短信快捷登录
  Widget bottomItem = new Container(
    margin: EdgeInsets.only(left: 28, right: 40),
    child: new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        new Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Checkbox(
                value: _isChecked,
                activeColor: Colors.blue[400],
                onChanged: (bool checked) {
                  _isChecked = checked;
                  print('checkBox:' + checked.toString());
                }),
            new Text('记住密码', style: TextStyle(fontSize: 12, color: Colors.black))
          ],
        ),

         new Row(
           mainAxisSize: MainAxisSize.min,
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
             new Text(
               '短信快捷登录',
               style: TextStyle(fontSize: 12,color: Colors.black),
             ),
             new SizedBox(width: 4,),
             new Image.asset('images/ic_enter_next.png',width: 6,height: 12,),
           ],
         )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: (new GestureDetector(
        onTap: () {
          print('点击了空白区域');
        },
        child: new ListView(
          children: <Widget>[
            new SizedBox(height: 50),
            topLogo,
            inputText,
            sureButton,
            new SizedBox(height: 10,),
            bottomItem
          ],
        ),
      )),
    );
  }
}
