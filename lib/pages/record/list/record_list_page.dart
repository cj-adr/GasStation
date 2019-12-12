import 'package:flutter/material.dart';
import 'package:gas_station/models/index.dart';
import 'package:gas_station/pages/record/detail/record_detail_page.dart';
import 'package:gas_station/res/clrs.dart';
import 'package:gas_station/res/text_styles.dart';
import 'package:gas_station/utils/date_utils.dart';
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
      leading: BackButton(color: Clrs.textBlackSub),
      title: Text("交班记录", style: TextStyles.black_18),
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
  final List<RecordListEntity> _recordList = [];

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
    final RecordListEntity record = _recordList[index];

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
              "交班时间：${DateUtils.getYmdHms(record.endDate)}",
              style: TextStyles.black_14,
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
                  style: TextStyles.blackSub_12,
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

  Widget _buildTxt(String content, RecordListEntity record, int type) {
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
            style: TextStyles.blue_11,
          ),
        ),
      ),
    );
  }

  /// 跳转到详情页
  _gotoRecordDetailPage(RecordListEntity record) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RecordDetailPage(record.workRecordId)));
  }

  /// 处理点击
  _handleClick(RecordListEntity record, int type) {
    if (1 == type) {
      _gotoRecordDetailPage(record);
      return;
    }

    // TODO 补打小票
  }

  /// 获取数据
  _getDataList() {
    List<RecordListEntity> list = [];
    for (var i = 0; i < 3; i++) {
      RecordListEntity value = RecordListEntity();
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
