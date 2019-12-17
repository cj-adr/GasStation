import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:gas_station/pages/home/home_page.dart';
import 'package:gas_station/pages/login/psd_login.dart';
import 'package:gas_station/res/themes.dart';
import 'package:gas_station/router/route_manager.dart';

void main() {
  Stetho.initialize();
  runApp(MyApp());

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themes.appTheme,
      onGenerateRoute: RouteManager.buildRouteFactory(),
      home: PsdLoginPage(),
    );
  }
}
