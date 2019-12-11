import 'package:flutter/material.dart';
import 'package:gas_station/models/index.dart';
import 'package:gas_station/res/clrs.dart';
import 'package:gas_station/res/dimens.dart';
import 'package:gas_station/utils/DateUtil.dart';

/// 交班记录详情页
class RecordDetailPage extends StatelessWidget {
  final num _recordId;

  RecordDetailPage(this._recordId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildTitleView(context),
      body: _RecordDetailWidget(_recordId),
    );
  }

  /// 构建标题栏
  Widget _buildTitleView(BuildContext context) {
    return AppBar(
      leading: BackButton(color: Clrs.subTextBlack2),
      title: Text("交班详情", style: TextStyle(fontSize: Dimens.font_title, color: Clrs.textBlack)),
      centerTitle: true,
      actions: <Widget>[
        MaterialButton(
          child: Text("交班记录", style: TextStyle(fontSize: Dimens.font_large, color: Clrs.textBlue)),
          onPressed: () => Navigator.maybePop(context),
        )
      ],
      backgroundColor: Clrs.appBarLightBg,
      brightness: Brightness.light,
    );
  }
}

class _RecordDetailWidget extends StatefulWidget {
  final num _recordId;

  _RecordDetailWidget(this._recordId);

  @override
  _RecordDetailWidgetState createState() => _RecordDetailWidgetState();
}

class _RecordDetailWidgetState extends State<_RecordDetailWidget> {
  RecordDetail _detail;

  @override
  void initState() {
    super.initState();

    _getData();
  }

  @override
  Widget build(BuildContext context) {
    var content = _detail == null ? Center(child: CircularProgressIndicator()) : _buildContent();

    return content;
  }

  Widget _buildContent() {
    var headView = Container(
      constraints: BoxConstraints.expand(height: 52),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              left: 0,
              top: 0,
              child: Text(
                "上次交班时间",
                style: TextStyle(color: Clrs.subTextBlack2, fontSize: Dimens.font_small_big),
              )),
          Positioned(
              right: 0,
              top: 0,
              child: Text(
                getYmdHms(_detail.startDate),
                style: TextStyle(color: Clrs.textBlack, fontSize: Dimens.font_small_big),
              )),
          Positioned(
              left: 0,
              bottom: 0,
              child: Text(
                "本次交班时间",
                style: TextStyle(color: Clrs.subTextBlack2, fontSize: Dimens.font_small_big),
              )),
          Positioned(
              right: 0,
              bottom: 0,
              child: Text(
                getYmdHms(_detail.endDate),
                style: TextStyle(color: Clrs.textBlack, fontSize: Dimens.font_small_big),
              ))
        ],
      ),
    );

    var priceView = Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        _buildPriceView("订单金额", _detail.orderAmount),
        _buildPriceView("优惠金额", _detail.discountAmount),
        _buildPriceView("实收金额", _detail.realPayAmount)
      ],
    );

    var scrollContent = Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        child: Column(
          children: <Widget>[
            headView,
            Container(
                color: Clrs.backgroundColor,
                height: 1,
                margin: EdgeInsets.only(top: 15, bottom: 15)),
            priceView,
            Container(color: Clrs.backgroundColor, height: 1, margin: EdgeInsets.only(top: 15)),
            _buildPriceListView("收银总额", _detail.orderList),
            _buildPriceListView("会员卡消费总额", _detail.mbrCardSpec),
            _buildPriceListView("油品消费统计", _detail.proSkuCount)
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
          color: Clrs.textBlue,
          hoverColor: Clrs.alphaColorPrimary,
          child: Text("交班并退出", style: TextStyle(fontSize: Dimens.font_normal)),
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

  Widget _buildPriceView(String name, num amount) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Column(
          children: <Widget>[
            Text(name,
                style: TextStyle(color: Clrs.lightTextBlack, fontSize: Dimens.font_small_big)),
            Container(height: 6),
            Text("￥$amount", style: TextStyle(color: Clrs.textBlack, fontSize: Dimens.font_large))
          ],
        ),
      ),
    );
  }

  Widget _buildPriceListView(String name, List<RecordItem> list) {
    var label = Center(
      child: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Clrs.alphaColorPrimary),
            child: Padding(
              padding: EdgeInsets.only(left: 8, top: 2, right: 8, bottom: 2),
              child: Text(
                name,
                style: TextStyle(color: Clrs.textBlue, fontSize: Dimens.font_small_big),
              ),
            ),
          )),
    );

    var content = list.map((item) => _get3Txt(item));

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

    ll.add(_get3Txt2(s1, "笔数", "金额", true));
    ll.addAll(content);

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 22),
      child: Column(children: ll),
    );
  }

  Widget _get3Txt(RecordItem item) {
    return _get3Txt2(item.name, "${item.totalCount}", "￥${item.totalAmount}", false);
  }

  Widget _get3Txt2(String s1, String s2, String s3, bool title) {
    var color = title ? Clrs.subTextBlack2 : Clrs.textBlack;
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(s1, style: TextStyle(color: color, fontSize: Dimens.font_small_big)),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(s2, style: TextStyle(color: color, fontSize: Dimens.font_small_big)),
            ),
          ),
          Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(s3, style: TextStyle(color: color, fontSize: Dimens.font_small_big)),
              ))
        ],
      ),
    );
  }

  /// 获取交班详情
  _getData() {
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
      _detail = info;
    });
  }
}
