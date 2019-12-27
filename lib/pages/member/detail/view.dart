import 'package:flutter/material.dart';
import 'package:gas_station/pages/member/detail/model.dart';

Widget buildWidget(BuildContext context, Model detailModel) => Column(
      children: <Widget>[
        Text('id:${detailModel.id}'),
        RaisedButton(
          child: Text("id++"),
          onPressed: detailModel.increment,
        ),
        RaisedButton(
          child: Text("net"),
          onPressed: () => detailModel.testLogin(context),
        )
      ],
    );

var view = (t, v) => buildWidget(t, v);
