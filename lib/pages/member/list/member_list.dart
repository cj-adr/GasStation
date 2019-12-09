import 'package:flutter/material.dart';

class MemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员列表'),
      ),
      body: ListView(
        children: List.generate(100, (position) {
          return _ItemView();
        }),
      ),
    );
  }
}

class _ItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 18,
          ),
          Container(
            width: 36,
            height: 36,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                  'http://pic3.zhimg.com/50/v2-5b0251b83cd145e2d6231cefd9865413_hd.jpg'),
            ),
          ),
          SizedBox(
            width: 14,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '张三',
                      maxLines: 1,
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                        color: Color(0xffDDDDDD),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 4, top: 1, right: 4, bottom: 2),
                      child: Text(
                        '普通会员',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(2),
                        color: Color(0xff178BFB),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '151 0349 0345',
                  style: TextStyle(color: Color(0xff888888), fontSize: 11),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 14,
          ),
          Image.asset(
            'assets/images/common_more.png',
            scale: 4,
          ),
          SizedBox(
            width: 18,
          ),
        ],
      ),
    );
  }
}
