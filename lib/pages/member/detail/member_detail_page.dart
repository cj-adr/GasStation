import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gas_station/res/clrs.dart';
import 'package:gas_station/res/dimens.dart';
import 'package:gas_station/res/text_styles.dart';
import 'package:gas_station/utils/image_utils.dart';
import 'package:gas_station/utils/text_style_utils.dart';

class MemberDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MemberDetailPageState();
  }
}

class _MemberDetailPageState extends State<MemberDetailPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  _MemberDetailPageState() {
    _tabController = new TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final statusHeight = MediaQueryData.fromWindow(window).padding.top;
    final blueHeight = 186 + statusHeight;
    final headerHeight = 201 + statusHeight;

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: headerHeight,
            child: Stack(
              children: <Widget>[
                Container(
                  height: blueHeight,
                  color: Clrs.colorPrimary,
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: statusHeight),
                    SizedBox(height: 55),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: Dimens.distance_horizontal_padding),
                          ClipOval(
                            child: Image.network(
                              'http://pic3.zhimg.com/50/v2-5b0251b83cd145e2d6231cefd9865413_hd.jpg',
                              width: 52,
                              height: 52,
                            ),
                          ),
                          SizedBox(width: 16),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '名字名字名字名字',
                                  style: TextStyle(
                                      fontSize: Dimens.font_16,
                                      color: Colors.white,
                                      height: 1.2),
                                ),
                                SizedBox(height: 4),
                                Opacity(
                                  opacity: 0.7,
                                  child: Text(
                                    '15143595063',
                                    style: TextStyle(
                                      fontSize: Dimens.font_12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            constraints: BoxConstraints(maxWidth: 128),
                          ),
                          SizedBox(width: 16),
                          Container(
                            width: 1,
                            height: 12,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: <Widget>[
                                Positioned(
                                  left: 18,
                                  child: Container(
                                    height: 18,
                                    padding: EdgeInsets.only(
                                      left: 14,
                                      right: 8,
                                    ),
                                    child: Text(
                                      '黄金会员',
                                      style: TextStyle(
                                        fontSize: Dimens.font_12,
                                        color: Clrs.textBlue,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                    ),
                                  ),
                                ),
                                ImageUtils.assetImage('member_level'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Color(0xFFEFF7FF),
                      ),
                      margin: EdgeInsets.only(
                        left: Dimens.distance_horizontal_padding,
                        right: Dimens.distance_horizontal_padding,
                      ),
                      child: Row(
                        children: <Widget>[
                          _getPrivilegeView(
                            ImageUtils.assetImage('member_level_discount'),
                            RichText(
                              text: TextSpan(children: <InlineSpan>[
                                TextSpan(
                                  text: '加油 ',
                                  style: TextStyle(
                                      fontSize: Dimens.font_14,
                                      color: Clrs.textBlack),
                                ),
                                TextSpan(
                                  text: '9.5',
                                  style: TextStyle(
                                      fontSize: 18, color: Clrs.textBlue),
                                ),
                                TextSpan(
                                  text: ' 折',
                                  style: TextStyle(
                                      fontSize: Dimens.font_14,
                                      color: Clrs.textBlack),
                                ),
                              ]),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 26,
                            color: Clrs.divide,
                          ),
                          _getPrivilegeView(
                            ImageUtils.assetImage('member_score_rate'),
                            RichText(
                              text: TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: '积分 ',
                                    style: TextStyle(
                                        fontSize: Dimens.font_14,
                                        color: Clrs.textBlack),
                                  ),
                                  TextSpan(
                                    text: '2',
                                    style: TextStyle(
                                        fontSize: 18, color: Clrs.textBlue),
                                  ),
                                  TextSpan(
                                    text: ' 倍',
                                    style: TextStyle(
                                        fontSize: Dimens.font_14,
                                        color: Clrs.textBlack),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 56,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Clrs.textBlack,
              unselectedLabelColor: Clrs.textBlackSub,
              indicatorColor: Clrs.colorPrimary,
              tabs: [
                Tab(text: '账户'),
                Tab(text: '资料'),
              ],
              controller: _tabController,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: Dimens.distance_horizontal_padding,
              right: Dimens.distance_horizontal_padding,
            ),
            height: 1,
            width: double.infinity,
            color: Clrs.divide,
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              _getPage0(),
              _getPage1(),
            ]),
          )
        ],
      ),
    );
  }

  Widget _getPrivilegeView(Widget icon, Widget text) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        SizedBox(width: 12),
        text,
      ],
    ));
  }

  Widget _getPage0() {
    return Column(
      children: <Widget>[
        SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.distance_horizontal_padding),
          child: Row(
            children: <Widget>[
              _getPage0ItemView('member_petrol_balance', '汽油卡', '¥40.00'),
              SizedBox(width: 20),
              _getPage0ItemView('member_diesel_balance', '柴油卡', '¥40.00'),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.distance_horizontal_padding),
          child: Row(
            children: <Widget>[
              _getPage0ItemView('member_score_balance', '可用积分', '¥40.00'),
              SizedBox(width: 20),
              _getPage0ItemView('member_coupon_balance', '卡包', '¥40.00'),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: Dimens.distance_horizontal_padding),
          child: MaterialButton(
            child: Text('充值'),
            color: Clrs.colorPrimary,
            minWidth: double.infinity,
            highlightElevation: 0,
            textColor: Colors.white,
            elevation: 0,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _getPage0ItemView(String imageName, String title, String content) {
    return Expanded(
        child: Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
          color: Clrs.colorPrimaryLight,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Row(
        children: <Widget>[
          SizedBox(width: 13),
          ImageUtils.assetImage(imageName),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  title,
                  textDirection: TextDirection.rtl,
                  style: TextStyles.blackSub_12,
                ),
                SizedBox(height: 4),
                Text(
                  content,
                  textDirection: TextDirection.rtl,
                  style: TextStyles.black_14,
                ),
              ],
            ),
          ),
          SizedBox(width: 13)
        ],
      ),
    ));
  }

  Widget _getPage1() {
    return CustomScrollView(slivers: <Widget>[
      SliverList(
          delegate: SliverChildListDelegate(
        <Widget>[
          _getPage1ItemView(
            ImageUtils.assetImage('member_name'),
            Text(
              '昵称',
              style: TextStyles.blackSub_14,
            ),
            Text('昵称', style: TextStyles.black_14),
          ),
          _getPage1DivideView(),
          _getPage1ItemView(
            ImageUtils.assetImage('member_sex'),
            Text(
              '性别',
              style: TextStyles.blackSub_14,
            ),
            Text('男', style: TextStyles.black_14),
          ),
          _getPage1DivideView(),
          _getPage1ItemView(
            ImageUtils.assetImage('member_birthday'),
            Text(
              '生日',
              style: TextStyles.blackSub_14,
            ),
            Text('1990-08-19', style: TextStyles.black_14),
          ),
          _getPage1DivideView(),
          _getPage1ItemView(
            ImageUtils.assetImage('member_password'),
            Text(
              '免密支付',
              style: TextStyles.blackSub_14,
            ),
            Switch(
              value: false,
              onChanged: null,
            ),
          ),
          _getPage1DivideView(),
          _getPage1ItemView(
            ImageUtils.assetImage('member_lock_level'),
            Text(
              '锁定等级',
              style: TextStyles.blackSub_14,
            ),
            Switch(value: false, onChanged: null),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.symmetric(
                horizontal: Dimens.distance_horizontal_padding),
            child: OutlineButton(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  '编辑',
                  style: TextStyles.blue_14,
                ),
              ),
              onPressed: () {},
              highlightElevation: 0,
              highlightColor: Colors.white,
              highlightedBorderColor: Clrs.textBlueDark,
              textColor: Clrs.textBlue,
              borderSide: BorderSide(color: Clrs.textBlue, width: 2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
            ),
          ),
          SizedBox(height: 12)
        ],
      ))
    ]);
  }

  Widget _getPage1ItemView(Widget icon, Widget title, Widget content) {
    return SizedBox(
        height: 56,
        child: Row(
          children: <Widget>[
            SizedBox(width: Dimens.distance_horizontal_padding),
            icon,
            SizedBox(width: 8),
            Expanded(
              child: title,
            ),
            content,
            SizedBox(width: Dimens.distance_horizontal_padding),
          ],
        ));
  }

  Widget _getPage1DivideView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      width: double.infinity,
      height: 1,
      color: Clrs.divide,
    );
  }
}
