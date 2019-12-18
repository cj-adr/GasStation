import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_station/components/base_head_bar.dart';
import 'package:gas_station/components/head_bar.dart';
import 'package:gas_station/models/order/order_refund_list_entity.dart';
import 'package:gas_station/res/clrs.dart';
import 'package:gas_station/res/dimens.dart';
import 'package:gas_station/utils/image_utils.dart';

class OrderDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new OrderDetailPageState();
  }
}

class OrderDetailPageState extends State {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: HeadBar(
        child: BaseHeadBar(
          context,
            '订单详情',
        leftIconName: 'common_back',
          leftText: '返回',
          rightText: '确定',
          rightTextColor: Clrs.textBlue,
          colorBg: Clrs.appBarLightBg,
          rightCallback: (){
            print('点击右边');
          },
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: _createList(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _createList() {
    return Column(
      children: <Widget>[
        new Container(
          height: 540,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _createBaseUi(),
              _createMemberInfo(),
              _createRefundList(),
            ],
          ),
        ),
        Expanded(
          child: _createBottom(),
        ),
      ],
    );
  }

  Widget _createBaseUi() {
    return new Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 5, 0, 20),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Text(
                '基本信息',
                style: new TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
              )
            ],
          ),
          new Container(
            width: double.infinity,
            height: 1,
            color: Clrs.divide,
            margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
          ),
          _createItem('订单金额', '￥2000'),
          _createItem('优惠金额', '￥2000'),
          _createItem('扣款金额', '￥2000'),
          _createItem('油品', '#92'),
          _createItem('订单状态', '交易成功'),
          _createItem('加油员', '我是名字'),
          _createItem('支付方式', '汽油卡支付'),
          _createItem('支付时间', '2019-12-122 19:49:00'),
        ],
      ),
    );
  }

  Widget _createMemberInfo() {
    return new Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 5, 0, 20),
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Text(
                '会员信息',
                style: new TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              )
            ],
          ),
          new Container(
            width: double.infinity,
            height: 2,
            color: Clrs.divide,
            margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
          ),
          _createItem('会员手机号', '15657163118'),
          _createItem('本次积分', '100'),
          _createItem('汽油卡余额', '￥2000'),
          _createItem('优惠券', '5元代金券'),
        ],
      ),
    );
  }

  Widget _createRefundList() {
    final refundList = _createRefundListData();
    return new Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 5, 0, 20),
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Text(
                '退款信息',
                style: new TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              )
            ],
          ),
          new Container(
            width: double.infinity,
            height: 2,
            color: Clrs.divide,
            margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
          ),
          new ListView.builder(
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              itemCount: refundList.length,
              itemBuilder: (context, position) {
                if (position.isOdd) {
                  return new Divider();
                }
                return _createRefundInfo(refundList[position]);
              }),
        ],
      ),
    );
  }

  Widget _createRefundInfo(OrderRefundListBean refundListBean) {
    return new Column(
      children: <Widget>[
        _createItem('退款金额', '￥${refundListBean.refundAmount}'),
        _createItem('退款状态', refundListBean.refundStatus),
        _createItem('退款时间', refundListBean.refundTime),
      ],
    );
  }

  Widget _createItem(String title, String content) {
    return new Row(
      children: <Widget>[
        Container(
          width:80,
          child: new Text(
            title,
            style: new TextStyle(fontSize: 10, color: Colors.grey[400]),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 7, 7, 0),
          child: new Text(
            content,
            style: new TextStyle(fontSize: 10, color: Colors.black),
          ),
        ),
      ],
    );
  }

  List<OrderRefundListBean> _createRefundListData() {
    final refundList = new List<OrderRefundListBean>();
    for (int i = 0; i < 10; i++) {
      OrderRefundListBean orderRefundListBean = new OrderRefundListBean();
      orderRefundListBean.refundAmount = 100;
      orderRefundListBean.refundStatus = '退款成功';
      orderRefundListBean.refundTime = '2019-12-12 14:31:00';
      refundList.add(orderRefundListBean);
    }
    return refundList;
  }

  void _back() {
    Navigator.pop(context);
  }

  Widget _createBottom() {
    return new Container(
      margin: const EdgeInsets.fromLTRB(0, 7, 0, 0),
      color: Colors.white,
      height: 44,
      child: Row(
        children: <Widget>[
          Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageUtils.assetImage("order_print"),
                Text('补打小票',
                    style: new TextStyle(
                        color: Clrs.colorPrimary, fontSize: Dimens.font_16))
              ],
            ),
          ),
          new Container(
            width: 1,
            height: 17,
            color: Clrs.divide,
          ),
          Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageUtils.assetImage("order_refund"),
                Text('退款',
                    style: new TextStyle(
                        color: Clrs.textOrange, fontSize: Dimens.font_16))
              ],
            ),
          ),
          new Container(
            width: 1,
            height: 17,
            color: Clrs.divide,
          ),
          Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageUtils.assetImage("order_refresh"),
                Text('刷新',
                    style: new TextStyle(
                        color: Clrs.colorPrimary, fontSize: Dimens.font_16))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
