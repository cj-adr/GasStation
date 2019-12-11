import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gas_station/res/clrs.dart';
import 'package:gas_station/res/dimens.dart';
import 'package:gas_station/utils/image_utils.dart';

class MemberDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MemberDetailState();
  }
}

class _MemberDetailState extends State<MemberDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  _MemberDetailState() {
    _tabController = new TabController(vsync: this, length: 2);
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
                    SizedBox(
                      height: statusHeight,
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: Dimens.distance_horizontal,
                          ),
                          ClipOval(
                            child: Image.network(
                              'http://pic3.zhimg.com/50/v2-5b0251b83cd145e2d6231cefd9865413_hd.jpg',
                              width: 52,
                              height: 52,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '名字名字名字名字',
                                  style: TextStyle(
                                      fontSize: Dimens.font_large,
                                      color: Colors.white,
                                      height: 1.2),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Opacity(
                                  opacity: 0.7,
                                  child: Text(
                                    '15143595063',
                                    style: TextStyle(
                                      fontSize: Dimens.font_small,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            constraints: BoxConstraints(
                              maxWidth: 128,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
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
                                    padding:
                                        EdgeInsets.only(left: 14, right: 8),
                                    child: Text(
                                      '黄金会员',
                                      style: TextStyle(
                                        fontSize: Dimens.font_small,
                                        color: Clrs.textBlue,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2))),
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
                        left: Dimens.distance_horizontal,
                        right: Dimens.distance_horizontal,
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
                                      fontSize: Dimens.font_normal,
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
                                      fontSize: Dimens.font_normal,
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
                                text: TextSpan(children: <InlineSpan>[
                                  TextSpan(
                                    text: '积分 ',
                                    style: TextStyle(
                                        fontSize: Dimens.font_normal,
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
                                        fontSize: Dimens.font_normal,
                                        color: Clrs.textBlack),
                                  ),
                                ]),
                              )),
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
              unselectedLabelColor: Clrs.subTextBlack,
              indicatorColor: Clrs.colorPrimary,
              tabs: [
                Tab(
                  text: '账户',
                ),
                Tab(
                  text: '资料',
                ),
              ],
              controller: _tabController,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: Dimens.distance_horizontal,
              right: Dimens.distance_horizontal,
            ),
            height: 1,
            width: double.infinity,
            color: Clrs.divide,
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              _getPage0(),
              _getPage0(),
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
        SizedBox(
          width: 12,
        ),
        text,
      ],
    ));
  }

  Widget _getPage0() {
    return Column(
      children: <Widget>[
        Text('1'),
        Text('2'),
        RaisedButton(
          child: Text('充值'),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _getPage1() {
    return Text('2');
  }
}
