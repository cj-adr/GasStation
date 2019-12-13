import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gas_station/network/api.dart';
import 'package:gas_station/network/url_paths.dart';

void main() {
  test("test post", () async {
    FormData formData = FormData.fromMap({
      "mobile": "15158081188",
      "pwd": "hzcj123456",
      "loginType": "MOBILE_PWD",
    });
    var resp = await api.post(UrlPaths.LOGIN_PATH, data: formData);

    print(resp);
  });

  test("test get", () async {
    var resp = await api.get(UrlPaths.GET_INFO_PATH);

    print(resp);
  });
}
