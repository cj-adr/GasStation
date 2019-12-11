import 'package:flutter/material.dart';
import 'package:gas_station/models/index.dart';
import 'package:gas_station/pages/record/detail/record_detail_page.dart';
import 'package:gas_station/res/clrs.dart';
import 'package:gas_station/res/dimens.dart';
import 'package:gas_station/utils/DateUtil.dart';
import 'package:gas_station/utils/image_utils.dart';

/// 交班记录列表页
class RecordListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildTitleView(context),
      body: _RecordListWidget(),
    );
  }

  /// 构建标题栏
  Widget _buildTitleView(BuildContext context) {
    return AppBar(
      leading: BackButton(color: Clrs.subTextBlack2),
      title: Text("交班记录",
          style: TextStyle(
            fontSize: Dimens.font_title,
            color: Clrs.textBlack,
          )),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: ImageUtils.assetImage('record_calendar'),
          onPressed: () {},
        )
      ],
      backgroundColor: Clrs.appBarLightBg,
      brightness: Brightness.light,
    );
  }
}

class _RecordListWidget extends StatefulWidget {
  @override
  _RecordListWidgetState createState() => _RecordListWidgetState();
}

class _RecordListWidgetState extends State<_RecordListWidget> {
  final List<RecordList> _recordList = [];

  @override
  void initState() {
    super.initState();

    _getDataList();
  }

  @override
  Widget build(BuildContext context) {
    var content = _recordList.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _recordList.length,
            itemBuilder: _buildItem,
          );

    return Container(decoration: BoxDecoration(color: Clrs.backgroundColor), child: content);
  }

  Widget _buildItem(BuildContext context, int index) {
    final RecordList record = _recordList[index];

    var itemView = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              color: Clrs.textBlue,
              width: 4,
              height: 16,
              margin: EdgeInsets.only(right: 10),
            ),
            Text(
              "交班时间：${getYmdHms(record.endDate)}",
              style: TextStyle(fontSize: Dimens.font_normal, color: Clrs.textBlack),
            )
          ],
        ),
        Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "订单金额：￥${record.orderAmount}",
                  style: TextStyle(fontSize: Dimens.font_small, color: Clrs.subTextBlack2),
                ),
                Row(
                  children: <Widget>[
                    _buildTxt("查看详情", record, 1),
                    Container(
                      color: Clrs.divide2,
                      width: 1,
                      height: 10,
                      margin: EdgeInsets.only(left: 15, right: 15),
                    ),
                    _buildTxt("补打小票", record, 2)
                  ],
                )
              ],
            ))
      ],
    );

    var item = GestureDetector(
        onTap: () => _gotoRecordDetailPage(record),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          margin: EdgeInsets.only(left: 8, top: 8, right: 8),
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
            child: itemView,
          ),
        ));

    return item;
  }

  Widget _buildTxt(String content, RecordList record, int type) {
    return GestureDetector(
      onTap: () => _handleClick(record, type),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Clrs.alphaColorPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 8, top: 2, right: 8, bottom: 2),
          child: Text(
            content,
            style: TextStyle(
              fontSize: Dimens.font_smallest,
              color: Clrs.textBlue,
            ),
          ),
        ),
      ),
    );
  }

  /// 跳转到详情页
  _gotoRecordDetailPage(RecordList record) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RecordDetailPage(record.workRecordId)));
  }

  /// 处理点击
  _handleClick(RecordList record, int type) {
    if (1 == type) {
      _gotoRecordDetailPage(record);
      return;
    }

    // TODO 补打小票
  }

  /// 获取数据
  _getDataList() {
    List<RecordList> list = [];
    for (var i = 0; i < 3; i++) {
      RecordList value = RecordList();
      value.endDate = 1543459658000;
      value.workRecordId = i + 1;
      value.orderAmount = 10.0 + i;
      list.add(value);
    }

    setState(() {
      _recordList.clear();
      _recordList.addAll(list);
    });
  }
}
