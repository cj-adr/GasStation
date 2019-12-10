import 'package:flutter/material.dart';
import 'package:gas_station/res/clrs.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Column(
        children: <Widget>[
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
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              Text('a'),
              Text('b'),
            ]),
          )
        ],
      ),
    );
  }
}
