import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_station/models/order/order_list_entity.dart';
import 'package:gas_station/pages/order/detail/order_detail_page.dart';

class OrderListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new OrderListPageState();
  }
}

class OrderListPageState extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        leading: new IconButton(icon: new Icon(Icons.keyboard_backspace), onPressed: _back),
        title: new Text('订单列表'),
      ),
      body: _buildOrder(),);
  }

  Widget _buildOrder(){
    final _items = _createData();
    return new ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context,position){
          if(position.isOdd){
            return new Divider();
          }
          return _buildOrderItem(_items[position]);
        });
  }

  Widget _buildOrderItem(OrderListBean item) {
    return new ListTile(
      leading: new Container(
        padding: const EdgeInsets.all(15.0) ,
        child: new Text('${item.gasType}',
        style: new TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),),
      decoration: new BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),),
      title: new Text(
        item.payType,
        style: new TextStyle(
            color: Colors.black87,
            fontSize: 18.0),),
      subtitle: new Container(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        child: new Text(
          item==null?'':item.createTime,
          style: new TextStyle(
              color: Colors.grey[400],
              fontSize: 16.0),),
      ),
      trailing: new Container(
        child: new Column(children: <Widget>[
        new Text(
            '￥${item.amount}',
              style: new TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w700
              ),),
        new Container(
          padding: const EdgeInsets.all(2.0),
          child: new Text(
            item.status,
            style:new TextStyle(
              color: Colors.orange,
              fontSize: 16.0,

            )),),
      ],),),
      onTap: _jump,
      
    );
  }

  List<OrderListBean> _createData() {
    final _items=new List<OrderListBean>();
    for(int i=0;i<100;i++){
      final index = i%3;
      final orderListBean=new OrderListBean();
      if(index==0){
        orderListBean.gasType='92#';
        orderListBean.amount=200;
        orderListBean.createTime='2019-12-11 18:04:00';
        orderListBean.payType='柴油卡支付';
        orderListBean.status='支付成功';
      }else if(index==1){
        orderListBean.gasType='92#';
        orderListBean.amount=100;
        orderListBean.createTime='2019-12-11 18:04:00';
        orderListBean.payType='刷卡支付';
        orderListBean.status='退款成功';
      }else{
        orderListBean.gasType='96#';
        orderListBean.amount=300;
        orderListBean.createTime='2019-12-11 18:04:00';
        orderListBean.payType='汽油卡支付';
        orderListBean.status='部分退款';
      }
      _items.add(orderListBean);
    }

    return _items;
  }

  //跳转到详情
  _jump() {
    print('点击条目');
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return new OrderDetailPage();
    }));
  }


  void _back() {
    Navigator.pop(context);
  }
}

