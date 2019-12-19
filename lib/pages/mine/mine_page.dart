import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: RaisedButton(
        child: Text('交班'),
        onPressed: () {
          Navigator.pushNamed(context, '/record/list', arguments: {'id': 1});
        },
      ),
    );
  }
}
