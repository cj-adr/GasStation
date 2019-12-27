import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gas_station/components/common_button.dart';
import 'package:gas_station/components/down_count.dart';
import 'package:gas_station/components/text_icon_button.dart';
import 'package:gas_station/components/toast.dart';
import 'package:gas_station/models/login/code_entity.dart';
import 'package:gas_station/network/response_bean.dart';
import 'package:gas_station/network/services.dart';
import 'package:gas_station/res/clrs.dart';
import 'package:gas_station/res/dimens.dart';
import 'package:gas_station/res/text_styles.dart';
import 'package:gas_station/utils/image_utils.dart';
import 'package:gas_station/utils/toast_utils.dart';

class CodeLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CodeLoginPageState();
  }
}

class _CodeLoginPageState extends State<CodeLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _createTopLogo(),
          _createPhoneCode(),
          _createBottomItem(),
        ],
      ),
    );
  }

  //头部logo
  Widget _createTopLogo() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      alignment: Alignment.center,
      child: ImageUtils.assetImage('login_logo', scale: 3),
    );
  }

  //输入手机号和验证码
  Widget _createPhoneCode() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 50, left: 40, right: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                hintText: '请输入手机号',
                hintStyle: TextStyles.blackLight_16,
                prefixIcon: ImageUtils.assetImage('login_phone', scale: 3),
                border: InputBorder.none),
            keyboardType: TextInputType.number,
          ),
          Divider(),
          SizedBox(height: 15),
          Flexible(
            child: _createCodeItem(),
          ),
          Divider(),
          CommonButton(
            margin: EdgeInsets.only(top: 35),
            onPressed: _login,
            content: '确认登录',
          )
        ],
      ),
    );
  }

  Widget _createCodeItem() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: TextField(
            decoration: InputDecoration(
                hintText: '请输入验证码',
                hintStyle: TextStyles.blackLight_16,
                prefixIcon: ImageUtils.assetImage('login_code', scale: 3),
                border: InputBorder.none),
            keyboardType: TextInputType.number,
          ),
        ),
        Flexible(
            child: DownCount(
          onPressed: _getCode,
        ))
      ],
    );
  }

  Widget _createBottomItem() {
    return Container(
      margin: EdgeInsets.only(right: 40, top: 25),
      child: TextIconButton(
          text: '账号密码登录',
          icon: ImageUtils.assetImage('login_enter_next'),
          onPressed: _toPsdLogin),
    );
  }

  void _getCode() async {
    ResponseBean<CodeEntity> codeBean =
        await Services.getCodeForLogin('15158081188');
    if (codeBean.success) {
      ToastUtils.showSuccess(context, '获取验证码成功');
    } else {
      ToastUtils.showError(context, '获取验证码失败');
    }
  }

  void _login() {
    ToastUtils.showSuccess(context, '登录03');
  }

  void _toPsdLogin() {
    ToastUtils.showError(context, '账号密码30');
  }
}
