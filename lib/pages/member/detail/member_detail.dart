import 'package:flutter/material.dart';

class MemberDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MemberDetailState();
  }
}

class _MemberDetailState extends State<MemberDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Text('body'),
    );
  }
}
