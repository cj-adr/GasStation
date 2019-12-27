import 'package:flutter/material.dart';
import 'package:gas_station/pages/member/detail/member_detail_model.dart';

Widget buildWidget(BuildContext context, MemberDetailModel detailModel) =>
    Column(
      children: <Widget>[
        Text('id:${detailModel.id}'),
        RaisedButton(
          child: Text("id++"),
          onPressed: () => detailModel.increment(),
        )
      ],
    );


var builder = (t, v) => buildWidget(t, v);
