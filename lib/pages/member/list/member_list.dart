import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gas_station/res/clrs.dart';
import 'package:gas_station/res/dimens.dart';

class MemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('会员列表'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 60,
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffF4F4F4),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      'assets/images/member_list_search.png',
                      scale: 4,
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      child: TextField(
                          maxLength: 11,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          cursorColor: Clrs.textBlack,
                          style: TextStyle(
                            fontSize: Dimens.font_large,
                            color: Clrs.textBlack,
                          ),
                          //todo:contentPadding
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                          )),
                    )),
                  ],
                ),
              ),
            ),
            Container(
              height: 30,
              width: double.infinity,
              alignment: Alignment.center,
              color: Color(0xffE7F3FF),
              child: Text(
                '共100条会员数据',
                style: TextStyle(
                    color: Clrs.colorPrimary, fontSize: Dimens.font_small),
              ),
            ),
            Expanded(
              child: ListView(
                children: List.generate(100, (position) {
                  return _MemberListItemView();
                }),
              ),
            ),
          ],
        ));
  }
}

class _MemberListItemView extends StatelessWidget {
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
                        color: Clrs.textBlack,
                        fontSize: Dimens.font_normal,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                        color: Clrs.lightTextBlack,
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
                        color: Clrs.colorPrimary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '151 0349 0345',
                  style: TextStyle(color: Clrs.subTextBlack, fontSize: 11),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 14,
          ),
          Image.asset(
            'assets/images/common_more.png',
            width: 5,
            height: 10,
          ),
          SizedBox(
            width: 18,
          ),
        ],
      ),
    );
  }
}
