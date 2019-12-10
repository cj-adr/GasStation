import 'package:flutter/material.dart';
import 'package:gas_station/models/index.dart';
import 'package:gas_station/utils/DateUtil.dart';

/// 交班记录详情页
class RecordDetailPage extends StatelessWidget {
  final num recordId;

  RecordDetailPage(this.recordId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildTitleView(context), body: RecordDetailWidget(recordId));
  }

  /// 构建标题栏
  Widget buildTitleView(BuildContext context) {
    return AppBar(
      leading: BackButton(color: Color(0xFF808080)),
      title: Text("交班详情", style: TextStyle(fontSize: 18, color: Color(0xFF333333))),
      centerTitle: true,
      actions: <Widget>[
        MaterialButton(
          child: Text("交班记录", style: TextStyle(fontSize: 16, color: Color(0xFF1890FF))),
          onPressed: () => Navigator.maybePop(context),
        )
      ],
      backgroundColor: Color(0xFFFAFAFA),
    );
  }
}

class RecordDetailWidget extends StatefulWidget {
  final num recordId;

  RecordDetailWidget(this.recordId);

  @override
  _RecordDetailWidgetState createState() => _RecordDetailWidgetState();
}

class _RecordDetailWidgetState extends State<RecordDetailWidget> {
  RecordDetail detail;

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    var content = detail == null ? Center(child: CircularProgressIndicator()) : buildContent();

    return content;
  }

  Widget buildContent() {
    var headView = Container(
      constraints: BoxConstraints.expand(height: 52),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              left: 0,
              top: 0,
              child: Text("上次交班时间", style: TextStyle(color: Color(0xFF808080), fontSize: 13))),
          Positioned(
              right: 0,
              top: 0,
              child: Text(getYmdHms(detail.startDate),
                  style: TextStyle(color: Color(0xFF333333), fontSize: 13))),
          Positioned(
              left: 0,
              bottom: 0,
              child: Text("本次交班时间", style: TextStyle(color: Color(0xFF808080), fontSize: 13))),
          Positioned(
              right: 0,
              bottom: 0,
              child: Text(getYmdHms(detail.endDate),
                  style: TextStyle(color: Color(0xFF333333), fontSize: 13)))
        ],
      ),
    );

    var priceView = Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        buildPriceView("订单金额", detail.orderAmount),
        buildPriceView("优惠金额", detail.discountAmount),
        buildPriceView("实收金额", detail.realPayAmount)
      ],
    );

    var scrollContent = Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        child: Column(
          children: <Widget>[
            headView,
            Container(
                color: Color(0xFFF4F4F4), height: 1, margin: EdgeInsets.only(top: 15, bottom: 15)),
            priceView,
            Container(color: Color(0xFFF4F4F4), height: 1, margin: EdgeInsets.only(top: 15)),
            buildPriceListView("收银总额", detail.orderList),
            buildPriceListView("会员卡消费总额", detail.mbrCardSpec),
            buildPriceListView("油品消费统计", detail.proSkuCount)
          ],
        ),
      ),
    );

    var button = SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
        child: MaterialButton(
          onPressed: () => Navigator.maybePop(context),
          color: Color(0xFF178BFB),
          hoverColor: Color(0x88178BFB),
          child: Text("交班并退出", style: TextStyle(fontSize: 14)),
          textColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
      ),
    );

    var content = Container(
      color: Colors.white,
      child: Flex(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: scrollContent,
          ),
          button
        ],
        direction: Axis.vertical,
      ),
    );

    return content;
  }

  Widget buildPriceView(String name, num amount) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Column(
          children: <Widget>[
            Text(name, style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 13)),
            Container(height: 6),
            Text("￥$amount", style: TextStyle(color: Color(0xFF333333), fontSize: 16))
          ],
        ),
      ),
    );
  }

  Widget buildPriceListView(String name, List<RecordItem> list) {
    var label = Center(
      child: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Color(0x1C1890FF)),
            child: Padding(
              padding: EdgeInsets.only(left: 8, top: 2, right: 8, bottom: 2),
              child: Text(name, style: TextStyle(fontSize: 13, color: Color(0xFF1890FF))),
            ),
          )),
    );

    var content = list.map((item) => get3Txt(item));

    List<Widget> ll = [];
    ll.add(label);
    var s1 = "";
    switch (name) {
      case "收银总额":
        s1 = "支付方式";
        break;

      case "会员卡消费总额":
        s1 = "卡种名称";
        break;

      default:
        s1 = "油品/升";
    }

    ll.add(get3Txt2(s1, "笔数", "金额", true));
    ll.addAll(content);

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 22),
      child: Column(children: ll),
    );
  }

  Widget get3Txt(RecordItem item) {
    return get3Txt2(item.name, "${item.totalCount}", "￥${item.totalAmount}", false);
  }

  Widget get3Txt2(String s1, String s2, String s3, bool title) {
    var color = title ? Color(0xFF808080) : Color(0xFF333333);
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(s1, style: TextStyle(color: color, fontSize: 13)),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(s2, style: TextStyle(color: color, fontSize: 13)),
            ),
          ),
          Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(s3, style: TextStyle(color: color, fontSize: 13)),
              ))
        ],
      ),
    );
  }

  /// 获取交班详情
  getData() {
    // TODO

    List<RecordItem> list = [];
    for (var i = 0; i < 5; i++) {
      var item = RecordItem();
      item.name = "ABC" + i.toString();
      item.quantity = 10;
      item.totalAmount = 10;
      item.totalCount = 3;

      list.add(item);
    }

    var info = RecordDetail();
    info.discountAmount = 8.0;
    info.endDate = 1543459658000;
    info.mbrCardSpec = list;
    info.orderAmount = 100.0;
    info.orderList = list;
    info.proSkuCount = list;
    info.realPayAmount = 92.0;
    info.startDate = 1543459658000;
    info.userName = "张三";

    setState(() {
      detail = info;
    });
  }
}
