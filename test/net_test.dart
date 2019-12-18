import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gas_station/models/user/user_entity.dart';
import 'package:gas_station/network/api.dart';
import 'package:gas_station/network/url_paths.dart';

void main() {
  test("test post", () async {
    var params = {
      "mobile": "15158081188",
      "pwd": "111111",
      "loginType": "MOBILE_PWD",
    };
    var resp = await api.post<UserEntity>(UrlPaths.LOGIN_PATH, data: params);

    print(resp);
  });

  test("test get", () async {
    var resp = await api.get(UrlPaths.GET_INFO_PATH);

    print(resp);
  });
}
