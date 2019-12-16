import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_station/component/base_head_bar.dart';
import 'package:gas_station/component/head_bar.dart';
import 'package:gas_station/models/order/order_list_entity.dart';
import 'package:gas_station/pages/order/detail/order_detail_page.dart';
import 'package:gas_station/res/clrs.dart';
import 'package:gas_station/utils/image_utils.dart';

class OrderListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new OrderListPageState();
  }
}

class OrderListPageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: HeadBar(
        child: BaseHeadBar(
          context,
          '订单列表',
          leftIconName: 'back',
          colorBg: Clrs.appBarLightBg,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: _buildOrder(),
    );
  }

  Widget _buildOrder() {
    final _items = _createData();
    return Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          _createSearchTitle(),
          Container(
            width: double.infinity,
            height: 1,
            color: Clrs.divide,
          ),
          Expanded(
            child: new ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, position) {
                  if (position.isOdd) {
                    return new Divider();
                  }
                  return _buildOrderItem(_items[position]);
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(OrderListBean item) {
    return new ListTile(
      leading: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new Text(
          '${item.gasType}',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
        decoration: new BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
      title: new Text(
        item.payType,
        style: new TextStyle(color: Colors.black87, fontSize: 13),
      ),
      subtitle: new Container(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        child: new Text(
          item == null ? '' : item.createTime,
          style: new TextStyle(color: Colors.grey[400], fontSize: 13),
        ),
      ),
      trailing: new Container(
        child: new Column(
          children: <Widget>[
            new Text(
              '￥${item.amount}',
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
            ),
            new Container(
              padding: const EdgeInsets.all(2.0),
              child: new Text(item.status,
                  style: new TextStyle(
                    color: Colors.orange,
                    fontSize: 13,
                  )),
            ),
          ],
        ),
      ),
      onTap: _jump,
    );
  }

  List<OrderListBean> _createData() {
    final _items = new List<OrderListBean>();
    for (int i = 0; i < 100; i++) {
      final index = i % 3;
      final orderListBean = new OrderListBean();
      if (index == 0) {
        orderListBean.gasType = '92#';
        orderListBean.amount = 200;
        orderListBean.createTime = '2019-12-11 18:04:00';
        orderListBean.payType = '柴油卡支付';
        orderListBean.status = '支付成功';
      } else if (index == 1) {
        orderListBean.gasType = '92#';
        orderListBean.amount = 100;
        orderListBean.createTime = '2019-12-11 18:04:00';
        orderListBean.payType = '刷卡支付';
        orderListBean.status = '退款成功';
      } else {
        orderListBean.gasType = '96#';
        orderListBean.amount = 300;
        orderListBean.createTime = '2019-12-11 18:04:00';
        orderListBean.payType = '汽油卡支付';
        orderListBean.status = '部分退款';
      }
      _items.add(orderListBean);
    }

    return _items;
  }

  //跳转到详情
  _jump() {
    print('点击条目');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return new OrderDetailPage();
    }));
  }

  void _back() {
    Navigator.pop(context);
  }

  Widget _createSearchTitle() {
    return Container(
      height: 44,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageUtils.assetImage("order_print"),
                Text(
                  '加油员',
                  style: new TextStyle(fontSize: 13),
                ),
                ImageUtils.assetImage("order_print"),
              ],
            ),
          ),
          Container(
            height: 17,
            width: 2,
            color: Clrs.divide,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageUtils.assetImage("order_print"),
                Text(
                  '支付方式',
                  style: new TextStyle(fontSize: 13),
                ),
                ImageUtils.assetImage("order_print"),
              ],
            ),
          ),
          Container(
            height: 17,
            width: 2,
            color: Clrs.divide,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageUtils.assetImage("order_print"),
                Text(
                  '日期筛选',
                  style: new TextStyle(fontSize: 13),
                ),
                ImageUtils.assetImage("order_print"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
