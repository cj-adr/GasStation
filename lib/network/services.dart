import 'package:dio/dio.dart';
import 'package:gas_station/network/api.dart';
import 'package:gas_station/network/url_paths.dart';

class Services {
  Future login(String mobile, String pwd) async {
    var body = {"mobile": mobile, "pwd": pwd, "loginType": "MOBILE_PWD"};
    return await api.post(UrlPaths.LOGIN_PATH, data: body);
  }
}
